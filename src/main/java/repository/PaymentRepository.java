package repository;

import entity.PaymentDetail;
import org.springframework.data.repository.CrudRepository;

public interface PaymentRepository extends CrudRepository<PaymentDetail, Integer> {
    PaymentDetail findPaymentDetailByOrders_Id(int id);
}
