package com.service;

import com.domain.Order;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.List;

/**
 *
 **/
public interface OrderService {
    List<Order> findAll(int page,int size)  throws Exception;
    int findTotal();
    Order findById(String id);
}
