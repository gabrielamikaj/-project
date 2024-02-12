package com.gabriela.springboot.myProject.repositories;

import com.gabriela.springboot.myProject.models.OrderRent;

import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface OrderRentalRepository extends CrudRepository<OrderRent, Long> {
    List<OrderRent> findByUserId(Long userId);
    List<OrderRent> findByCarId(Long carId);
    List<OrderRent> findAll();

}