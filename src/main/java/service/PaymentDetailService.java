package service;

import entity.PaymentDetail;

public interface PaymentDetailService {
    public PaymentDetail getPaymentDetailByOrderID(int id);
    void savePayment(PaymentDetail paymentDetail);
}
