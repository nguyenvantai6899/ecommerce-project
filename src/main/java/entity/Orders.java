package entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity(name = "orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String note;
    private Double totalPrice;
    private String payment;
    private LocalDate date;
    private String status;

    @OneToMany(mappedBy = "orders")
    private List<OrderDetail> orderDetails;

    @ManyToOne
    @JoinColumn(name = "customerID")
    private Customer customerOrder;

    @ManyToOne
    @JoinColumn(name = "transportID")
    private Transport transport;

    @OneToOne(mappedBy = "orders")
    private PaymentDetail paymentDetail;

    public Orders() {
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Customer getCustomerOrder() {
        return customerOrder;
    }

    public void setCustomerOrder(Customer customerOrder) {
        this.customerOrder = customerOrder;
    }

    public PaymentDetail getPaymentDetail() {
        return paymentDetail;
    }

    public void setPaymentDetail(PaymentDetail paymentDetail) {
        this.paymentDetail = paymentDetail;
    }

    public Customer getCustomer() {
        return customerOrder;
    }

    public void setCustomer(Customer customer) {
        this.customerOrder = customer;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public int getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
}
