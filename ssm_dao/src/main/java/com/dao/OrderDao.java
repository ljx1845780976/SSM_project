package com.dao;

import com.domain.Order;
import com.domain.Product;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.aspectj.weaver.ast.Or;

import java.util.List;

/**
 *
 **/
public interface OrderDao {
    @Select("select * from orders")
    @Results( value = {
        @Result(id=true,column = "id",property = "id"),
        @Result(column = "orderNum",property = "orderNum"),
        @Result(column = "orderTime",property = "orderTime"),
        @Result(column = "peopleCount",property = "peopleCount"),
        @Result(column = "orderDesc",property = "orderDesc"),
        @Result(column = "payType",property = "payType"),
        @Result(column = "orderStatus",property = "orderStatus"),
        @Result(column = "productId",property = "productId"),
         @ Result(column = "productId",property = "product",
                one = @One(select = "com.dao.ProductDao.findById"))
    })
    public List<Order> findAll();

    @Select("select count(*) from orders")
    public int findTotal();

    @Select("select * from orders where id=#{id} ")
    @Results( value = {
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "orderNum",property = "orderNum"),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "productId",property = "productId"),
            @Result(column = "memberId",property = "memberId"),
            @ Result(column = "productId",property = "product",
                    one = @One(select = "com.dao.ProductDao.findById")),
            @ Result(column = "memberId",property = "member",
                    one = @One(select = "com.dao.MemberDao.findById")),
            @ Result(column = "id",property = "travellers",
                    many = @Many(select = "com.dao.TravellerDao.findByOrderId"))
    })
    public Order findById(String id);
}
