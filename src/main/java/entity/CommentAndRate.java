package entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity(name = "comment_rate")
public class CommentAndRate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private double rate;
    private String comment;
    private LocalDate date;

    @ManyToOne
    @JoinColumn(name = "customerId")
    private Customer customerCR;
    @ManyToOne
    @JoinColumn(name = "productDetailId")
    private Product productCR;

    public CommentAndRate() {
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Customer getCustomerCR() {
        return customerCR;
    }

    public void setCustomerCR(Customer customerCR) {
        this.customerCR = customerCR;
    }

    public Product getProductCR() {
        return productCR;
    }

    public void setProductCR(Product productCR) {
        this.productCR = productCR;
    }
}
