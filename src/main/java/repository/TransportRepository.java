package repository;

import entity.Transport;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TransportRepository extends CrudRepository<Transport,Integer> {
    @Query(value = "select * from transport where customerID = ?1",nativeQuery = true)
    List<Transport> getListTransport(int id);
}
