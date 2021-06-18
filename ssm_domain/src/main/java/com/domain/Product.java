package com.domain;

import com.utils.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 *
 **/
public class Product {
   private String id;
   private String productNum;//产品编号 唯一
   private String productName;
   private String cityName;//出发城市
   @DateTimeFormat(pattern = "yyyy-mm-dd HH:mm")
   private Date departureTime;//出发时间
   private String departureTimeStr; //用于页面显示出发时间字符串
   private Double productPrice;
   private String productDesc;
   private Integer productStatus;//状态 0关闭 1开启
   private String productStatusStr;//用于页面显示状态

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Date getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    public Product() {
    }

    public Product(String id, String productNum, String productName, String cityName, Date departureTime, Double productPrice, String productDesc, Integer productStatus) {
        this.id = id;
        this.productNum = productNum;
        this.productName = productName;
        this.cityName = cityName;
        this.departureTime = departureTime;
        this.productPrice = productPrice;
        this.productDesc = productDesc;
        this.productStatus = productStatus;
    }

    public String getDepartureTimeStr() {
        if (departureTime!=null){
            departureTimeStr= DateUtils.dateToSting(departureTime,"yyyy-MM-dd HH:mm:ss");
        }
        return departureTimeStr;
    }

    public void setDepartureTimeStr(String departureTimeStr) {
        this.departureTimeStr = departureTimeStr;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public Integer getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(Integer productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductStatusStr() {
        if(productStatus!=null){
        if (productStatus==0){
         productStatusStr="关闭";
        }
        if (productStatus==1) {
            productStatusStr = "开启";
        }}
            return productStatusStr;
    }

    public void setProductStatusStr(String productStatusStr) {
        this.productStatusStr = productStatusStr;
    }
}
