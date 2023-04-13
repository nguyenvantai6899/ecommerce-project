package service;

import entity.OrderDetail;
import entity.Orders;

import java.util.List;


public interface OrderDetailService {
    void saveOrderDetail(OrderDetail orderDetail);
    double saveTotalPrice(int id);
    List<OrderDetail> getListOrderDetailsById(int id);
    Integer sumProductOrdered(String name);
}
