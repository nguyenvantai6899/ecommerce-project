package service;

import entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.OrdersRepository;

import java.util.List;

@Service(value = "ordersService")
public class OrdersServiceImpl implements OrdersService{
    @Autowired
    private OrdersRepository ordersRepository;
    @Override
    public void saveOrders(Orders orders) {
        ordersRepository.save(orders);
    }

    @Override
    public List<Orders> ordersList(int id) {
        return ordersRepository.getListOrders(id);
    }

    @Override
    public List<Integer> orderIntegerList(int id) {
        return ordersRepository.getIdbyCustomerId(id);
    }

    @Override
    public Orders findOrdersByID(int id) {
        return ordersRepository.findById(id).get();
    }
}
