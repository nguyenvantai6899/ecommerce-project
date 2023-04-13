package service;

import entity.PaymentDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.PaymentRepository;

@Service("paymentDetailService")
public class PaymentDetailServiceImpl implements PaymentDetailService{
    @Autowired
    private PaymentRepository paymentRepository;
    @Override
    public PaymentDetail getPaymentDetailByOrderID(int id) {
        return paymentRepository.findPaymentDetailByOrders_Id(id);
    }

    @Override
    public void savePayment(PaymentDetail paymentDetail) {
        paymentRepository.save(paymentDetail);
    }
}
