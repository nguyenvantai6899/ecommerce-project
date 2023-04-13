package repository;

import entity.CommentAndRate;
import entity.Customer;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CommentAndRateRepository extends CrudRepository<CommentAndRate,Integer> {
    List<CommentAndRate> findCommentAndRateByProductCR_Id(int id);
   @Query (value = "select avg(rate) from comment_rate where productDetailId = ?1",nativeQuery = true)
    Double avgRate(int id);
}
