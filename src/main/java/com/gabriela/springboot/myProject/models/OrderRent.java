package com.gabriela.springboot.myProject.models;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "order_rental")
public class OrderRent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "car_id", nullable = false)
    private Car car;

 @DateTimeFormat(pattern = "yyyy-MM-dd")
private Date rentalStartDate;

      @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rentalEndDate;

    @Column(name = "card_number", unique = true, nullable = false, length = 16)
    private Long cardNumber;

    @Column(name = "month", nullable = false, length = 2)
    private Integer month;

    @Column(name = "year", nullable = false, length = 4)
    private Integer year;

    @Min(001)
    @Max(999)
    @Column(name = "cvv", nullable = false, length = 3)
    private Integer cvv;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}