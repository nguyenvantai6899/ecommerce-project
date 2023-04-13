package repository;

import entity.OrderDetail;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrderDetailRepository extends CrudRepository<OrderDetail,Integer> {
    @Query(value = "SELECT sum(quantity*unitPrice)  FROM order_detail where orderID = ?1",nativeQuery = true)
    double totalPrice(int id);
    @Query(value = "select * from order_detail where orderID = ?1",nativeQuery = true)
    List<OrderDetail> getListOrders(int id);
    @Query(value = "select sum(quantity) from order_detail od " +
            "inner join orders o on od.orderID = o.id " +
            "where productName = ?1 and o.status = 'paid'", nativeQuery = true)
    Integer sumProductOrdered(String name);
}
