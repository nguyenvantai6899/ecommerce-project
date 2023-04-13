package repository;

import entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface ProductRepository extends PagingAndSortingRepository<Product, Integer> {
    @Query(value="select  * from product where name like %?1% or producer like %?1%",nativeQuery = true)
    public List<Product> searchProductByName(String name);
    @Query(value="select  * from product order by id desc limit 8 ",nativeQuery = true)
    public List<Product> getProducts();
    @Query(value="SELECT * FROM product  where (producer like %?1% or producer like %?2% or  producer like %?3% or producer like %?4% or producer like %?5%)" +
            "and (memory like %?6% or memory like %?7% or memory like %?8% or memory like %?9% )" +
            "and  (?10 <pin and pin < ?11)"+
            "and (?12 <= unitPrice and unitPrice <= ?13)"
            ,nativeQuery = true)
    public List<Product> searchProduct(String p1,String p2, String p3, String p4, String p5,
                                       String m1, String m2, String m3, String m4,
                                       int pin1, int pin2,
                                       double price1, double price2);
    @Query(value = "select * from product  order by sold desc limit 8",nativeQuery = true)
    List<Product> getTopProduct();
    @Query(value = "select c.id from (orders  as o \n" +
            "inner join order_detail as od\n" +
            "on o.id = od.orderID)\n" +
            "inner join customer as c\n" +
            "on c.id= o.customerID \n" +
            "where productName = ?1",nativeQuery = true)
    List<Integer> getCustomer(String name);

}
