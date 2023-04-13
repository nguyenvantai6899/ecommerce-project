package repository;

import entity.Customer;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CustomerRepository extends CrudRepository<Customer,Integer> {
    @Query(value = "select username from customer", nativeQuery = true)
    List<String> allName();
    @Query(value = "select id from customer where username = ?1",nativeQuery = true)
    int getIdByUsername(String user);
}
