package service;

import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import repository.CustomerRepository;

import java.time.LocalDate;
import java.util.List;

@Service(value = "customerService")
public class CustomerServiceImpl implements CustomerService{
    @Autowired
    private CustomerRepository customerRepository;
    @Override
    public void register(String name, LocalDate birthday, String address, String phone, String email, String username, String password) {
        Customer customer = new Customer();
        customer.setFullName(name);
        customer.setBirthday(birthday);
        customer.setAddress(address);
        customer.setPhoneNumber(phone);
        customer.setEmail(email);
        customer.setUsername(username);
        customer.setPassword("{noop}"+password);
        customer.setRole("ROLE_USER");
        customerRepository.save(customer);
    }

    @Override
    public boolean checkName(String name) {
        List<String> listName = customerRepository.allName();
        for (String s:listName){
            if(name.equalsIgnoreCase(s)){
                return true;
            }
        }
        return false;
    }

    @Override
    public Customer findCustomerbyID(int id) {
        return customerRepository.findById(id).get();
    }

    @Override
    public void saveCustomer(Customer customer) {
        customerRepository.save(customer);
    }
}
