package service;

import entity.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.OrderDetailRepository;

import java.util.List;

@Service(value = "orderDetail")
public class OrderDetailServiceImpl implements OrderDetailService{

    @Autowired
    private OrderDetailRepository orderDetailRepository;
    @Override
    public void saveOrderDetail(OrderDetail orderDetail) {
        orderDetailRepository.save(orderDetail);
    }

    @Override
    public double saveTotalPrice(int id) {
        return orderDetailRepository.totalPrice(id);
    }

    @Override
    public List<OrderDetail> getListOrderDetailsById(int id) {
        return orderDetailRepository.getListOrders(id);
    }

    @Override
    public Integer sumProductOrdered(String name) {
        return orderDetailRepository.sumProductOrdered(name);
    }
}
