package repository;

import entity.Product;
import entity.Promotion;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PromotionRepository extends CrudRepository<Promotion, Integer> {
    @Query(value = "select productID from promotion " ,nativeQuery = true)
    List<Integer> getListProduct();
    @Query(value = "select * from promotion order by promotion desc limit 8 " ,nativeQuery = true)
    List<Promotion> getListPromotion();
}
