package service;


import entity.Customer;

import java.time.LocalDate;

public interface CustomerService {
    public void register(String name, LocalDate birthday, String address,String phone, String email,String username,String password);
    public boolean checkName(String name);
    public Customer findCustomerbyID(int id);
    void saveCustomer(Customer customer);
}
