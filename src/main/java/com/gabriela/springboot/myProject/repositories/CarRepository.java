package com.gabriela.springboot.myProject.repositories;
import com.gabriela.springboot.myProject.models.Car;
import com.gabriela.springboot.myProject.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CarRepository extends CrudRepository<Car, Long> {
    List<Car> findAll();
    Optional<Car> findById(Long id);
    List<Car> findByUserIdNot(Long userId);
    List<Car>findByUserId(Long userId);
    List<Car> findByAvailable(boolean available);
    Optional<Car> findByIdAndAvailable(Long id, boolean available);

}