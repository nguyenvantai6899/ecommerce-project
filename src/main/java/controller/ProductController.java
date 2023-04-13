package controller;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import repository.CustomerRepository;
import service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private CommentAndRateService commentAndRateService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrderDetailService orderDetailService;

    public  int getID(HttpServletRequest request){
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();
        return customerRepository.getIdByUsername(username);
    }

    @GetMapping({"homePage" , "/"})
    public String homePage(Model model, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            String username = principal.getName();
            int id = customerRepository.getIdByUsername(username);
            model.addAttribute("userId", id);
        }
        List<Product> products = productService.getProductList();
        for (int i = 1 ; i <= products.size() ; i++ ){
            if (productService.checkNullProduct(i)) {
                Product product = productService.getProductById(i);
                product.setUnitPrice(product.getPrice());
                if (orderDetailService.sumProductOrdered(product.getName()) != null)
                product.setSold(orderDetailService.sumProductOrdered(product.getName()));
//                product.setQuantity(product.getQuantity() - product.getSold());
                productService.saveProduct(product);
            }
        }
        List<Promotion> promotionList = promotionService.getListPromotions();
        for ( Promotion promotion: promotionList){
            Product product = productService.getProductById(promotion.getProduct().getId());
            product.setUnitPrice(product.getPrice() - (product.getPrice() * (promotion.getPromotion() / 100)));
            productService.saveProduct(product);
        }
        model.addAttribute("products", productService.products());
        model.addAttribute("topProduct",productService.getTopProduct());
        model.addAttribute("promotion", promotionService.promotionList());
        return "guest/homePage";
    }

    @GetMapping({"searchProductByName"})
    public String searchProductByName(Model model, @RequestParam("name") String name){
        model.addAttribute("productList",productService.getProductsByName(name));
        return "guest/productList";
    }


    @GetMapping("getProductList")
    public String getProductList(Model model, HttpServletRequest request,
                                 @RequestParam(value = "page", defaultValue = "0") int pageN){
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            String username = principal.getName();
            int id = customerRepository.getIdByUsername(username);
            model.addAttribute("userId", id);
        }
        if (pageN < 0){
            pageN = 0;
        }

        Page<Product> page = productService.getList(pageN);
        List<Product> productList = page.getContent();
        int totalPage = page.getTotalPages();
        int totalItem = (int) page.getTotalElements();
        System.out.println(totalItem);
        int pageCurrent = page.getNumber();
        List<Integer> pageNumber = new ArrayList<>();
        for (int i = 0; i < totalPage ; i ++){
            pageNumber.add(i);
        }
        List<Product> products = productService.getProductList();
        for (Product product : products){
            product.setRate(commentAndRateService.avgRate(product.getId()));
            productService.saveProduct(product);
        }
        model.addAttribute("pageCurrent",pageCurrent);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("totalItem",totalItem);
        model.addAttribute("productList",productList);
        model.addAttribute("pageNumber", pageNumber);
        return "guest/productList";
    }
    @GetMapping("getProductById")
    public String getProductById(Model model, @RequestParam("id") int id, HttpServletRequest request,
                                 @RequestParam(value = "bought",defaultValue = "") String bought) {
        Principal principal = request.getUserPrincipal();
        if (principal != null) {
            String username = principal.getName();
            model.addAttribute("userId", customerRepository.getIdByUsername(username));
        }
        Product product =  productService.getProductById(id);
        model.addAttribute("CR",commentAndRateService.getListCommentAndRates(id));
        model.addAttribute("product", product);
        model.addAttribute("bought", bought);
        return "guest/productDetail";
    }
    @GetMapping("userComment")
    public String comment(@RequestParam(value = "rate",defaultValue = "0") double rate,
                          @RequestParam(value = "content" ,defaultValue = "") String content,
                          @RequestParam("id") int id,
                          HttpServletRequest request, Model model){
        if(rate == 0 && content.equals("")){
            model.addAttribute("id", id);
            return "redirect:getProductById";
        }
        Product product = productService.getProductById(id);
        Customer customer = customerService.findCustomerbyID(getID(request));
        List<Integer> listID = productService.getCustomer(product.getName());
        for (Integer i: listID){
            if(customer.getId() == i){
                CommentAndRate commentAndRate = new CommentAndRate();
                commentAndRate.setComment(content);
                commentAndRate.setDate(LocalDate.now());
                commentAndRate.setRate(rate);
                commentAndRate.setCustomerCR(customer);
                commentAndRate.setProductCR(product);
                commentAndRateService.saveCommentAndRate(commentAndRate);
                model.addAttribute("id", id);
                return "redirect:getProductById";
            }
        }
        model.addAttribute("bought", "you don't buy it");
        model.addAttribute("id", id);
        return "redirect:getProductById";
    }

    @GetMapping("searchProduct")
    public String searchProduct(Model model, @RequestParam("producer") String[] producer,
                                @RequestParam("memory") String[] memory,
                                @RequestParam("pin") int pin,
                                @RequestParam("price") int price,
                                @RequestParam(value = "page", defaultValue = "0") int pageN,HttpServletRequest request) {
        String p1, p2, p3, p4, p5;
        if (producer.length == 1) {
            p1 = p2 = p3 = p4 = p5 = "";
        } else if (producer.length < 3) {
            p2 = p3 = p4 = p5 = "aaa";
            p1 = producer[1];
        } else if (producer.length < 4) {
            p3 = p4 = p5 = "aaa";
            p1 = producer[1];
            p2 = producer[2];
        } else if (producer.length < 5) {
            p1 = producer[1];
            p2 = producer[2];
            p3 = producer[3];
            p4 = p5 = "aaa";
        } else if (producer.length < 6) {
            p1 = producer[1];
            p2 = producer[2];
            p3 = producer[3];
            p4 = producer[4];
            p5 = "aaa";
        } else if (producer.length < 7) {
            p1 = producer[1];
            p2 = producer[2];
            p3 = producer[3];
            p4 = producer[4];
            p5 = producer[5];
        } else {
            p1 = p2 = p3 = p4 = p5 = "";
        }

        String m1, m2, m3, m4;
        if (memory.length == 1) {
            m1 = m2 = m3 = m4 = "";
        } else if (memory.length == 2) {
            m2 = m3 = m4 = "aaa";
            m1 = memory[1];
        } else if (memory.length == 3) {
            m3 = m4 = "aaa";
            m1 = memory[1];
            m2 = memory[2];
        } else if (memory.length == 4) {
            m1 = memory[1];
            m2 = memory[2];
            m3 = memory[3];
            m4 =  "aaa";
        }else{
            m1 = m2 = m3 = m4 = "";
        }
        int pin1 = 0 ;
        int pin2 = 0;
        if (pin == 1){
            pin1 = 5000;
            pin2 = 10000;
        }else if(pin == 2){
            pin1 = 0;
            pin2 = 5000;
        }else{
            pin2 = 20000;
        }
        double price1=0 ,price2 =0;
        if (price == 1){
            price1 = 2001;
            price2 = 100000;
        }else if (price == 2){
            price1 = 1000;
            price2 = 2000;
        }else if( price == 3){
            price2 = 999;
        }else{
            price2 = 100000;
        }
        List<Product> productList = productService.searchProduct(p1, p2, p3, p4, p5, m1, m2, m3, m4, pin1, pin2, price1, price2);
        model.addAttribute("productList", productList);
        return "guest/productList";
    }
}
