package com.gabriela.springboot.myProject.models;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="cars")
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Car's name is required!")
    @Size(min = 3, max = 30, message = "It must be between 3 and 30 characters")
    private String carName;

    private String type;
    @NotNull(message = "Year of car is required!")
    @DateTimeFormat(pattern = "yyyy-MM-dd")

    private Date year;

    @NotEmpty(message = " Is required to know how much seat has this car")
    private String brand;

    @NotNull(message = "Amount must not be blank")
    @Min(value = 0, message = "You cant give a car for free")
    private Double price;

    @NotNull(message = "Amount must not be blank")
    @Min(value = 0, message = "0 seats? Doesnt make sense ")
    private Double seats;

    @NotEmpty(message = " Put the fuel type please..")
    private String fuel;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy")
    private Date createdAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    private boolean available = true;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "car", fetch = FetchType.LAZY)
    private List<OrderRent> rentals;

    public String[] toStringArray() {
        return new String[]{
                String.valueOf(this.getId()),
                this.getBrand(),
                this.getType(),
                this.getFuel(),
                String.valueOf(this.getSeats()),
                String.valueOf(this.getPrice())
        };
    }
}

