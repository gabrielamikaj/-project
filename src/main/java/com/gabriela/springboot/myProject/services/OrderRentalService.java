package com.gabriela.springboot.myProject.services;

import com.gabriela.springboot.myProject.models.OrderRent;
import com.gabriela.springboot.myProject.repositories.OrderRentalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderRentalService {
@Autowired
    private  OrderRentalRepository orderRentalRepository;
    public List<OrderRent> findAllRentals() {
        return orderRentalRepository.findAll();
    }
    public Optional<OrderRent> findRentalById(Long id) {
        return orderRentalRepository.findById(id);
    }
    public OrderRent saveRental(OrderRent rental) {
        return orderRentalRepository.save(rental);
    }
    public List<OrderRent> getAllOrderRents() {
            return orderRentalRepository.findAll();
    }

}
