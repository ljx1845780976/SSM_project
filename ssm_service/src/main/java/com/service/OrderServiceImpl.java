package com.service;

import com.dao.OrderDao;
import com.domain.Order;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 **/
@Service("orderService")
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderDao orderDao;
    @Override
    public List<Order> findAll(int page,int size) throws Exception {
        //参数pageNum是页码值，参数pageSize代表每页显示条数
        PageHelper.startPage(page,size);
       return orderDao.findAll();
    }

    @Override
    public int findTotal() {
        return orderDao.findTotal();
    }

    @Override
    public Order findById(String id) {
        return orderDao.findById(id);
    }
}
