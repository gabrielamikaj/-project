package com.gabriela.springboot.myProject.services;
import com.gabriela.springboot.myProject.models.Car;
import com.gabriela.springboot.myProject.models.OrderRent;
import com.gabriela.springboot.myProject.repositories.CarRepository;
import com.gabriela.springboot.myProject.repositories.OrderRentalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class CarService {
    @Autowired
    private CarRepository carRepo;

    @Autowired
    private OrderRentalRepository orderRentalRepository;
    public Car findById(Long id){
        Optional<Car> result = carRepo.findById(id);
        if(result.isPresent()){
            return result.get();
        }
        return null;
    }
    public List<Car> allCars(){
        return carRepo.findAll();
    }
    public Car updateCar(Car car) {
        return carRepo.save(car);
    }
    public Car createCar(Car car) {
        return carRepo.save(car);
    }

    public void deleteCar(Car car) {
        carRepo.delete(car);
    }
    public List<Car> findCarsByUser(Long userId) {
        return carRepo.findByUserId(userId);
    }
    public List<Car> findAllCarsExceptUser(Long userId) {
        return carRepo.findByUserIdNot(userId);
    }
    public List<Car> getAvailableCars() {
        return carRepo.findByAvailable(true);
    }
    public Car save(Car car) {
        return carRepo.save(car);
    }

   /* public void rentCar(OrderRent orderRent) {

        Optional<Car> carOptional = carRepo.findById(orderRent.getCar().getId());
        if(carOptional.isPresent()) {
            Car car = carOptional.get();
            if(car.isAvailable()) {
                car.setAvailable(false);
                carRepo.save(car);

                orderRentalRepository.save(orderRent);
            } else {
                throw new IllegalStateException("Car is not available for rent");
            }
        } else {
            throw new NoSuchElementException("Car with provided ID does not exist");
        }
    }*/

    public Car getAvailableCarById(Long carId) {
        return carRepo.findByIdAndAvailable(carId, true)
                .orElseThrow(() -> new NoSuchElementException("No available car found with ID: " + carId));
    }

    public void rentCar(Long carId, OrderRent orderRent) {
        Optional<Car> carOptional = carRepo.findById(carId);
        if (!carOptional.isPresent()) {
            throw new NoSuchElementException("No car found with ID: " + carId);
        }
        Car car = carOptional.get();
        if (!car.isAvailable()) {
            throw new IllegalStateException("Car is not available for rent");
        }
        car.setAvailable(false);
        carRepo.save(car);

        orderRent.setCar(car);
        orderRentalRepository.save(orderRent);
    }

}