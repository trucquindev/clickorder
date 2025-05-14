package com.example.ClickOrder.repository;

import com.example.ClickOrder.model.Order;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface OrderRepository extends MongoRepository<Order, String> {
    List<Order> findByCustomerName(String customerName);
    List<Order> findByCustomerNameContainingIgnoreCase(String keyword);

}
