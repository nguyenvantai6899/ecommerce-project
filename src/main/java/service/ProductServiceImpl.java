package service;

import entity.Customer;
import entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import repository.ProductRepository;

import java.util.List;

@Service(value = "productService")
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getProductsByName(String name) {
        return productRepository.searchProductByName(name);
    }

    @Override
    public List<Product> products() {
        return (List<Product>) productRepository.getProducts();
    }

    @Override
    public List<Product> getProductList() {
        return (List<Product>) productRepository.findAll();
    }

    @Override
    public Product getProductById(int id) {
        return productRepository.findById(id).get();
    }

    @Override
    public List<Product> searchProduct(String p1,String p2, String p3, String p4, String p5,
                                       String m1, String m2, String m3, String m4,
                                       int pin1, int pin2,
                                       double price1, double price2) {
        return productRepository.searchProduct(p1,p2,p3,p4,p5,m1,m2,m3,m4,pin1,pin2,price1,price2);
    }

    @Override
    public void saveProduct(Product product) {
        productRepository.save(product);
    }

    @Override
    public List<Product> getTopProduct() {
        return productRepository.getTopProduct();
    }

    @Override
    public Page<Product> getList(int p) {
        Pageable pageable = PageRequest.of(p,8);
        return productRepository.findAll(pageable);
    }

    @Override
    public boolean checkNullProduct(int i) {
        return productRepository.existsById(i);
    }

    @Override
    public List<Integer> getCustomer(String name) {
        return productRepository.getCustomer(name);
    }
}
