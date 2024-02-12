package com.gabriela.springboot.myProject.controllers;
import com.gabriela.springboot.myProject.models.Car;
import com.gabriela.springboot.myProject.models.LoginUser;
import com.gabriela.springboot.myProject.models.OrderRent;
import com.gabriela.springboot.myProject.models.User;
import com.gabriela.springboot.myProject.services.CarService;
import com.gabriela.springboot.myProject.services.OrderRentalService;
import com.gabriela.springboot.myProject.services.UserService;
import com.opencsv.CSVWriter;
import jakarta.persistence.criteria.Order;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Controller
public class mainController {

    @Autowired
    private UserService userService;
    @Autowired
    private CarService carService;
    @Autowired
    private OrderRentalService orderRentalService;


    @RequestMapping("/")
    public String index() {
        return "welcome";
    }

    @GetMapping("/register")
    public String sign(Model model) {
        model.addAttribute("newUser", new User());
        return "register";
    }

    @PostMapping("/register")
    public String singup(@Valid @ModelAttribute("newUser") User newUser,
                         BindingResult result, Model model, HttpSession session) {

        User user = userService.register(newUser, result);
        if (result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "register";
        }
        session.setAttribute("userId", user.getId());
        return "viewOtherCars";
    }

    @GetMapping("/login")
    public String log(Model model) {
        model.addAttribute("newLogin", new LoginUser());
        return "login";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
        User user = userService.login(newLogin, result);
        if (result.hasErrors()) {
            return "login";
        }
        session.setAttribute("userId", user.getId());
        return "viewOtherCars";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/home")
    public String home(Model model, HttpSession session) {

        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
        model.addAttribute("cars", carService.allCars());
        model.addAttribute("user", userService.findById((Long) session.getAttribute("userId")));
        return "viewOtherCars";
    }

    @GetMapping("/viewOtherCars")
    public String viewOtherCars(Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");

        List<Car> cars = carService.findAllCarsExceptUser(userId);
        model.addAttribute("cars", cars);
        return "viewOtherCars";
    }

    @GetMapping("/myCars")
    public String viewMyCars(Model model, HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");
        List<Car> myCars = carService.findCarsByUser(userId);
        model.addAttribute("myCars", myCars);
        return "myCars";
    }

    @GetMapping("/newCar")
    public String add(@ModelAttribute("car") Car car, HttpSession session, Model model) {
        User user = userService.findById((Long) session.getAttribute("userId"));
        model.addAttribute("user", user);
        return "addCar";
    }

    @PostMapping("/newCar")
    public String addCar(@Valid @ModelAttribute("car") Car car, BindingResult result, HttpSession session) {
        if (result.hasErrors()) {
            return "addCar";
        }
        Long userId = (Long) session.getAttribute("userId");
        User user = userService.findById(userId);

        car.setUser(user);
        carService.createCar(car);

        return "redirect:/viewOtherCars";
    }

    @GetMapping("/cars/{id}")
    public String carDetail(@PathVariable("id") Long id, HttpSession session, Model model) {
        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Car cars = carService.findById(id);
        model.addAttribute("cars", cars);
        return "show";
    }



    @GetMapping("/cars/{id}/edit")
    public String Edit(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/viewOtherCars";
        }
        Car carEdit = carService.findById(id);
        model.addAttribute("carEdit", carEdit);
        return "editCar";
    }
    @PutMapping("cars/{id}/edit")
    public String editCar(@Valid @ModelAttribute("CarEdit") Car carEdit, BindingResult result, Model model, @PathVariable("id") Long id, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        User userLogged = userService.findById(userId);
        if (result.hasErrors()) {
            return "editCar";
        } else {
            carEdit.setUser(userLogged);
            carService.updateCar(carEdit);
            return "redirect:/viewOtherCars";
        }
    }
    @RequestMapping("/cars/{id}/delete")
    public String deleteCar(@PathVariable("id") Long id, HttpSession session) {

        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Car car = carService.findById(id);
        carService.deleteCar(car);
        return "redirect:/myCars";
    }
    @GetMapping("/cars/{id}/rent")
    public String showRentCarForm(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        Car car = carService.findById(id);
        if (car == null || !car.isAvailable()) {
            return "carNotFound";
        }
        model.addAttribute("car", car);
        OrderRent orderRent = new OrderRent();
        model.addAttribute("orderRent",orderRent);
        return "rentCarForm";
    }

    @PostMapping("/cars/{id}/rent")
    public String rentCar(@PathVariable Long id, @ModelAttribute("orderRent") OrderRent orderRent, BindingResult result, Model model, HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        if (result.hasErrors()) {
            model.addAttribute("car", carService.findById(id));
            return "rentCarForm";
        }
        try {
            carService.rentCar(id, orderRent);
        } catch (IllegalStateException | NoSuchElementException e) {
            model.addAttribute("error", e.getMessage());
            return "carNotFound";
        }

        return "rentalConfirmation";
    }

    @GetMapping("/downloadCSV")
    public void downloadCSV(HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; file=cars.csv");

        List<Car> cars = carService.allCars();
        CSVWriter writer = new CSVWriter(response.getWriter());
        cars.forEach(car -> writer.writeNext(car.toStringArray()));
        writer.close();
    }
}