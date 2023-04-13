package entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "customer")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "full_name")
    private String fullName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthday;
    private String address;
    private String email;
    @Column(name = "phone_number")
    private String phoneNumber;
    private String username;
    private String password;
    private String role;

    @OneToMany(mappedBy = "customer")
    private List<Transport> transportList;

    @OneToMany(mappedBy = "customerOrder")
    private List<Orders> ordersList;

    @OneToMany(mappedBy = "customerCR")
    private List<CommentAndRate> commentAndRates;


    public Customer() {
    }

    public List<CommentAndRate> getCommentAndRates() {
        return commentAndRates;
    }

    public void setCommentAndRates(List<CommentAndRate> commentAndRates) {
        this.commentAndRates = commentAndRates;
    }

    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    public int getId() {
        return id;
    }

    public List<Transport> getTransportList() {
        return transportList;
    }

    public void setTransportList(List<Transport> transportList) {
        this.transportList = transportList;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
