package com.domain;

import com.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 *
 **/
public class Order {
    private  Integer id;
    private  String orderNum;
    private  Date orderTime;
    @DateTimeFormat(pattern = "yyyy-mm-dd HH:mm")
    private  String orderTimeStr;
    private  Integer peopleCount;
    private  String orderDesc;
    private  Integer payType;
    private  String  payTypeStr;
    private  Integer orderStatus;
    private  String orderStatusStr;
    private  Integer productId;
    private  Integer memberId;
    private  Member member;



    private Product product;
    private List<Traveller> travellers;

    public String getPayTypeStr() {
            if (payType==0){
                payTypeStr="支付宝";
            }
            else if (payType==1) {
                payTypeStr = "微信";
            }else if(payType==2){
                payTypeStr="其他";
            }

        return payTypeStr;
    }
    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
    public void setPayTypeStr(String payTypeStr) {
        this.payTypeStr = payTypeStr;
    }


    public Product getProduct() {
        return product;
    }
    public String getOrderDesc() {
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }
    public void setProduct(Product product) {
        this.product = product;
    }

    public List<Traveller> getTravellers() {
        return travellers;
    }

    public void setTravellers(List<Traveller> travellers) {
        this.travellers = travellers;
    }


    public String getOrderTimeStr() {
        if (orderTime!=null){
            orderTimeStr= DateUtils.dateToSting(orderTime,"yyyy-MM-dd HH:mm:ss");
        }
        return orderTimeStr;

    }

    public void setOrderTimeStr(String orderTimeStr) {
        this.orderTimeStr = orderTimeStr;
    }


    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", orderNum='" + orderNum + '\'' +
                ", orderTime=" + orderTime +
                ", orderTimeStr='" + orderTimeStr + '\'' +
                ", peopleCount=" + peopleCount +
                ", orderDesc='" + orderDesc + '\'' +
                ", payType=" + payType +
                ", payTypeStr='" + payTypeStr + '\'' +
                ", orderStatus=" + orderStatus +
                ", orderStatusStr='" + orderStatusStr + '\'' +
                ", productId=" + productId +
                ", memberId=" + memberId +
                ", product=" + product +
                ", travellers=" + travellers +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(Integer peopleCount) {
        this.peopleCount = peopleCount;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderStatusStr() {
            if (orderStatus==0){
                orderStatusStr="未支付";
            }
            if (orderStatus==1) {
                orderStatusStr = "已支付";
            }
        return orderStatusStr;
    }

    public void setOrderStatusStr(String orderStatusStr) {
        this.orderStatusStr = orderStatusStr;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }



    public Order(Integer id, String orderNum, Date orderTime, Integer peopleCount, Integer payType, Integer orderStatus, Integer productId, Integer memberId) {
        this.id = id;
        this.orderNum = orderNum;
        this.orderTime = orderTime;
        this.peopleCount = peopleCount;
        this.payType = payType;
        this.orderStatus = orderStatus;
        this.productId = productId;
        this.memberId = memberId;
    }

    public Order() {
    }
}
