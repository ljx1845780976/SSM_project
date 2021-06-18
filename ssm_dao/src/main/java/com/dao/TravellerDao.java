package com.dao;

import com.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 *
 **/
public interface TravellerDao {
    //多表查询，根据orderId得到中间表的travellerId，再从traveller表中匹配得到traveller信息
     // 再去OrderDao中得到对应的traveller信息
    @Select("select id,NAME,sex,phoneNum,credentialsType,credentialsNum,travellerType from traveller inner join order_traveller on travellerId=id where orderId=#{orderId}")
    public List<Traveller> findByOrderId(String orderId);
}
