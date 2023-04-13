package controller;

import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.CustomerService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
public class LoginController {
    @Autowired
    private CustomerService customerService;
    @RequestMapping(value = "login")
    public String login(){
        return "login/loginPage";
    }
    @RequestMapping(value = "resigter")
    public String resigter(){
        return "login/resigter";
    }
    @GetMapping (value = "login1")
    public String login1(Model model, @RequestParam("name") String name,
                          @RequestParam("birthday") String birthday,
                          @RequestParam("address") String address,
                          @RequestParam("phone") String phone,
                          @RequestParam("email") String email,
                          @RequestParam("username") String username,
                          @RequestParam("password") String password){
        LocalDate localDate = LocalDate.parse(birthday);
        if (name == "" || address == "" ||phone == "" || username == "" ||password == ""){
            model.addAttribute("check","Request full import");
            return "login/resigter";
        }else if(customerService.checkName(username) == true){
            model.addAttribute("check","User name had been used ");
            return "login/resigter";
        }
        else {
            customerService.register(name, localDate, address, phone,email, username, password);
            return "redirect: login";
        }
    }
}
