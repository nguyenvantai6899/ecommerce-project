package controller;

import entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import repository.CustomerRepository;
import repository.TransportRepository;
import service.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes({"cart","orderDetail","totalPriceOrder"})
public class OrderController {
    @Autowired
    private PaymentDetailService paymentDetailService;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private TransportService transportService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private ProductService productService;
    @Autowired
    private TransferService transferService;
    @Autowired
    private MailSender mailSender;
    public  int getID(HttpServletRequest request){
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();
        int id = customerRepository.getIdByUsername(username);
        return id;
    }
    @GetMapping({"userCart"})
    public String homePage(Model model, HttpServletRequest request,
                           @RequestParam(value = "checkQuantity",defaultValue = "") String checkQuantity,
                           @ModelAttribute("check")String check) {
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();
        int id = customerRepository.getIdByUsername(username);
        if(check!= null){
            model.addAttribute("check",check);
        }
        model.addAttribute("checkQuantity", checkQuantity);
        model.addAttribute("userId", id);
        model.addAttribute("transport",transportService.transportList(id));
        return "order/orderListById";
    }

    @GetMapping({"userCart2"})
    public String userCart(Model model, @RequestParam("name") String name,
                           @RequestParam("image") String image,
                           @RequestParam("id") int id,
                           @ModelAttribute("cart") List<Cart> cartList,
                           @RequestParam("price") double price,
                           @RequestParam(value = "quantity" ,defaultValue = "0") int quantity,
                           @RequestParam("bl") int bl) {
        Cart cart = new Cart();
        int count = 0;
        if (cartList.size() != 0){
            for (Cart cart1 : cartList){
                if (cart1.getId() == id){
                    cart1.setQuantity(cart1.getQuantity()+ quantity);
                }else {
                    count ++;
                }
            }
            if (count == cartList.size()){
                cart.setId(id);
                cart.setName(name);
                cart.setPrice(price);
                cart.setImage(image);
                cart.setQuantity(quantity);
                cartList.add(cart);
            }
        }else {
            cart.setId(id);
            cart.setName(name);
            cart.setPrice(price);
            cart.setImage(image);
            cart.setQuantity(quantity);
            cartList.add(cart);
        }
        model.addAttribute("cart", cartList);
        if (bl == 0){
            return "redirect: userCart";
        }else
            return "redirect: getProductList";
    }
    @ModelAttribute("cart")
    public List<Cart> todos() {
        return new ArrayList<>();
    }

    @GetMapping("getCartSession")
    public String getCart(@SessionAttribute("cart") List<Cart> cartList,
                          @RequestParam("id") int id) {
        cartList.remove(id);
        return "redirect: userCart";
    }
    @GetMapping("saveTransport")
    public String addTransport(HttpServletRequest request,
                               @RequestParam("name")String name,
                               @RequestParam("address")String address,
                               @RequestParam("tel")String tel){
        Transport transport = new Transport();
        transport.setCustomer(customerService.findCustomerbyID(getID(request)));
        transport.setName(name);
        transport.setAddress(address);
        transport.setTel(tel);
        transportService.saveTransport(transport);
        return "redirect: userCart";
    }
    @GetMapping("saveOrder")
    public String saveOrder(Model model,
                            @SessionAttribute("cart") List<Cart> cartList,
                            @RequestParam(value = "quantity",defaultValue = "0") int[] quantity,
                            @RequestParam("transport") int transport,
                            @RequestParam("note") String note,
                            HttpServletRequest request){

        if (transport == 0 || quantity.length == 0){
            model.addAttribute("check","You have not entered shipping information or cart is empty");
            return "redirect: userCart";
        } else {
            //Orders
            Orders orders = new Orders();
            orders.setDate(LocalDate.now());
            orders.setPayment("online payment");
            orders.setStatus("unpaid");
            orders.setNote(note);
            orders.setTransport(transportService.findTransportById(transport));
            orders.setCustomer(customerService.findCustomerbyID(getID(request)));
            //OrderDetail
            int i = 0;
            for (Cart cart : cartList) {
                Orders orders1 = orders;
                OrderDetail orderDetail = new OrderDetail();
                while (i < quantity.length) {
                    Product product = productService.getProductById(cart.getId());
                    if (quantity[i] > product.getQuantity()) {
                        model.addAttribute("checkQuantity", "Temporarily out of stock");
                        return "redirect:userCart";
                    }else{
                        ordersService.saveOrders(orders);
                        orderDetail.setProductName(cart.getName());
                        orderDetail.setQuantity(quantity[i]);
                        orderDetail.setUnitPrice(cart.getPrice());
                        orderDetail.setImage(cart.getImage());
                        orderDetail.setOrders(orders1);
                        product.setQuantity(product.getQuantity() - quantity[i]);
                        productService.saveProduct(product);

                        orderDetailService.saveOrderDetail(orderDetail);
                    }
                    break;
                }
                i++;
            }
            double totalPrice = orderDetailService.saveTotalPrice(orders.getId());
            orders.setTotalPrice(totalPrice);
            ordersService.saveOrders(orders);
            model.addAttribute("totalP",totalPrice);
            model.addAttribute("orderId", orders.getId());
            return "redirect: paymentPage";
        }
    }
    @GetMapping("paymentPage")
    public String paymentPage(@ModelAttribute("totalP") double totalP,
                              @ModelAttribute("orderId") int id,
                              Model model){
        model.addAttribute("totalP", totalP);
        model.addAttribute("orderId", id);
        return "order/payment";
    }
    @GetMapping("paymentPage2")
    public String paymentPage2(@RequestParam("totalP") double totalP,
                              @RequestParam("idOrder") int id,
                              HttpServletRequest request,
                              Model model){
        model.addAttribute("totalP", totalP);
        model.addAttribute("orderId", id);
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();
        int idd = customerRepository.getIdByUsername(username);
        model.addAttribute("userId", idd);
        return "order/payment";
    }
    @PostMapping("userPayment")
    public String payment(@RequestParam(value = "totalP",defaultValue = "0") double totalP,
                          @SessionAttribute("cart") List<Cart> cartList,
                          @RequestParam(value = "idOrder",defaultValue = "0") int idOrder,
                          @RequestParam(value = "name",defaultValue = "0") String name,
                          @RequestParam(value = "date",defaultValue = "0") String date,
                          @RequestParam(value = "code",defaultValue = "0") int code,
                          @RequestParam(value = "fromAcc" ,defaultValue = "0") long fromAcc,
                          Model model){
        long toAcc = 123456789;
        if (transferService.checkNull(fromAcc) == true) {
            Transfer transfer = transferService.findById(fromAcc);
            if (name.equals(transfer.getName()) == true && code == transfer.getCode() &&
                    fromAcc == transfer.getId() && date.equals(transfer.getDate())== true) {
                Orders orders = ordersService.findOrdersByID(idOrder);
                orders.setStatus("paid");
                ordersService.saveOrders(orders);
                transferService.transfer(fromAcc, toAcc, totalP);
                List<OrderDetail> orderDetail = orderDetailService.getListOrderDetailsById(idOrder);
                model.addAttribute("orderDetail", orderDetail);
                model.addAttribute("totalPriceOrder", orders);
                SimpleMailMessage message = new SimpleMailMessage();
                message.setFrom("nguyenvantai6899@gmail.com");
                message.setTo(orders.getCustomer().getEmail());
                message.setSubject("Pay detail");
                List<String> nameP = new ArrayList<>();
                List<Double> priceP = new ArrayList<>();
                for (OrderDetail ot : orderDetail) {
                    nameP.add(ot.getProductName());
                    priceP.add(ot.getUnitPrice());
                }
                message.setText(
                        "product name:\t" + nameP + "\n" +
                                "price:" + "\t\t" + priceP + "\n" +
                                "Total price : " + orders.getTotalPrice());
                mailSender.send(message);
                PaymentDetail paymentDetail = new PaymentDetail();
                paymentDetail.setCardId(fromAcc);
                paymentDetail.setOrders(ordersService.findOrdersByID(idOrder));
                paymentDetail.setDate(LocalDate.now());
                paymentDetailService.savePayment(paymentDetail);
                cartList.removeAll(cartList);
                return "redirect: orderSuccess";
            }
        }
        Orders orders = ordersService.findOrdersByID(idOrder);
        List<OrderDetail> orderDetail = orderDetailService.getListOrderDetailsById(idOrder);
        model.addAttribute("orderDetail", orderDetail);
        model.addAttribute("totalPriceOrder", orders);
        cartList.removeAll(cartList);
        return "redirect: paymentFailed ";
    }
    @GetMapping("paymentFailed")
    public String paymentFailed(@ModelAttribute("totalPriceOrder") Orders orders,
                               @ModelAttribute("orderDetail") List<OrderDetail> orderDetails,Model model){
        model.addAttribute("totalPriceOrder",orders);
        model.addAttribute("orderDetail",orderDetails);
        return "order/paymentFailed";
    }
    @GetMapping("orderSuccess")
    public String orderSuccess(@ModelAttribute("totalPriceOrder") Orders orders,
                               @ModelAttribute("orderDetail") List<OrderDetail> orderDetails,Model model){
        model.addAttribute("totalPriceOrder",orders);
        model.addAttribute("orderDetail",orderDetails);
//        List<Product> products = productService.getProductList();
//        for (int i = 1 ; i <= products.size() ; i++ ){
//            if (productService.checkNullProduct(i)) {
//                Product product = productService.getProductById(i);
//                product.setQuantity(product.getQuantity() - product.getSold());
//                productService.saveProduct(product);
//            }
//        }
        return "order/orderSuccess";
    }
    @GetMapping({"userOrderHistory"})
    public String Order(Model model,
                        HttpServletRequest request){
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();
        int id = customerRepository.getIdByUsername(username);
        model.addAttribute("userId", id);
        model.addAttribute("ordersListByID", ordersService.ordersList(getID(request)));
        return "order/orderHistory";
    }
    @GetMapping("orderDetail")
    public String orderDetail(Model model, @RequestParam("id") int id, HttpServletRequest request){
        Principal principal = request.getUserPrincipal();
        String username = principal.getName();
        int idd = customerRepository.getIdByUsername(username);
        model.addAttribute("userId", idd);
        model.addAttribute("getOrderDetail",orderDetailService.getListOrderDetailsById(id));
        return "order/orderDetail";
    }
    @GetMapping("paymentDetail")
    public String paymentDetail(Model model, @RequestParam("idOrder") int id,
                                @RequestParam("totalP") double totalP){
        model.addAttribute("payment", paymentDetailService.getPaymentDetailByOrderID(id));
        return "order/paymentDetail";
    }
}
