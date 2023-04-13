package controller;

import entity.Customer;
import entity.Transport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import repository.CustomerRepository;
import service.CustomerService;
import service.TransportService;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.time.LocalDate;

@Controller
public class AccountController {
    @Autowired
    private TransportService transportService;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private CustomerService customerService;
    public  int getID(HttpServletRequest request){
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();
        int id = customerRepository.getIdByUsername(username);
        return id;
    }
    @GetMapping(value = "account")
    public String account(HttpServletRequest request,Model model){
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            String username = principal.getName();
            int id = customerRepository.getIdByUsername(username);
            model.addAttribute("userId", id);
        }
        model.addAttribute("customer",customerService.findCustomerbyID(getID(request)));
        return "account/account";
    }
    @GetMapping(value = "editInf")
    public String editInf(@RequestParam("password") String password,
                          @RequestParam("fullname") String fullname,
                          @RequestParam("address") String address,
                          @RequestParam("email") String email,
                          @RequestParam("birthday") String birthday,
                          @RequestParam("tel") String tel,
                          HttpServletRequest request){
        LocalDate localDate = LocalDate.parse(birthday);
        Customer customer = customerService.findCustomerbyID(getID(request));
        customer.setFullName(fullname);
        if (password.equals(customer.getPassword()) == false) {
            customer.setPassword("{noop}" + password);
        }
        customer.setEmail(email);
        customer.setPhoneNumber(tel);
        customer.setBirthday(localDate);
        customer.setAddress(address);
        customerService.saveCustomer(customer);
        return "redirect: account";
    }
    @GetMapping(value = "dAddress")
    public String dAddress(HttpServletRequest request, Model model){
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            String username = principal.getName();
            int id = customerRepository.getIdByUsername(username);
            model.addAttribute("userId", id);
        }
        model.addAttribute("transportList",transportService.transportList(getID(request)));
        return "account/dAddress";
    }
    @GetMapping(value = "addDAddress")
    public String addDAddress(@RequestParam("name") String name,
                              @RequestParam("address") String address,
                              @RequestParam("tel") String tel,
                              @RequestParam(name = "id", defaultValue = "0")  int id,
                              HttpServletRequest request,Model model){
        Customer customer = customerService.findCustomerbyID(getID(request));
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            String username = principal.getName();
            int idd = customerRepository.getIdByUsername(username);
            model.addAttribute("userId", idd);
        }
        if (id == 0){
            Transport transport = new Transport();
            transport.setCustomer(customer);
            transport.setAddress(address);
            transport.setName(name);
            transport.setTel(tel);
            transportService.saveTransport(transport);
            return "redirect: dAddress";
        }
        else {
            Transport transport = transportService.findTransportById(id);
            transport.setCustomer(customer);
            transport.setAddress(address);
            transport.setName(name);
            transport.setTel(tel);
            transportService.saveTransport(transport);
            return "redirect: dAddress";
        }
    }
    @GetMapping("editTransport")
    public String editTransport(@RequestParam("id") int id, Model model){
        model.addAttribute("transport", transportService.findTransportById(id));
        return "account/editTransport";
    }
}
