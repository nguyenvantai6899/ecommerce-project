package service;

import entity.Customer;
import entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductService {
    List<Product> getProductsByName(String name);
    List<Product> products();
    List<Product> getProductList();
    Product getProductById(int id);
    List<Product> searchProduct(String p1,String p2, String p3, String p4, String p5,
                                String m1, String m2, String m3, String m4,
                                int pin1,int pin2,
                                double price1, double price2);
    void saveProduct(Product product);
    List<Product> getTopProduct();
    Page<Product> getList(int p);
    boolean checkNullProduct(int i);
    List<Integer> getCustomer(String name);
}
