package service;

import entity.Orders;

import java.util.List;

public interface OrdersService {
    void saveOrders(Orders orders);
    List<Orders> ordersList(int id);
    List<Integer> orderIntegerList(int id);
    Orders findOrdersByID(int id);
}
