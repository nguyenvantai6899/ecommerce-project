package repository;

import entity.Orders;
import entity.Transport;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrdersRepository extends CrudRepository<Orders, Integer> {
    @Query(value = "select * from orders where customerID = ?1",nativeQuery = true)
    List<Orders> getListOrders(int id);
    @Query(value = "select id from orders where customerID = ?1",nativeQuery = true)
    List<Integer> getIdbyCustomerId(int id);
}
