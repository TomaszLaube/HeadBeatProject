package pl.coderslab.models;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import pl.coderslab.validators.UniqueEmail;
import pl.coderslab.validators.UniqueTelephone;
import pl.coderslab.validators.UniqueUser;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotBlank
    @Email
    @Column(unique = true)
    //@UniqueEmail(message = "User with this email already exists")
    private String email;
    @NotBlank
    @Column(unique = true)
   // @UniqueUser(message = "User with this login already exists")
    private String username;
    @NotBlank
    private String password;
    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;
    @NotBlank
    private String address;
    @NotBlank
    @Pattern(regexp = "^[0-9]{9}$", message = "Telephone number should consist of exactly 9 digits")
    @Column(unique = true)
    //@UniqueTelephone(message = "User with this number already exists")
    private String telephone;


    @ManyToMany(fetch = FetchType.EAGER)
    List<User> observedUsers = new ArrayList<>();


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }


    public List<User> getObservedUsers() {
        return observedUsers;
    }

    public void setObservedUsers(List<User> observedUsers) {
        this.observedUsers = observedUsers;
    }
}
