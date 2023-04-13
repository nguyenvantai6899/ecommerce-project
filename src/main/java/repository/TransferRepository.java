package repository;

import entity.Transfer;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TransferRepository extends CrudRepository<Transfer,Integer> {
    @Query(value = "select * from transfer where id= ?1", nativeQuery = true)
    Transfer getTransferById(long id);
}
