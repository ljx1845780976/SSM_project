package com.controller;

import com.domain.Order;
import com.domain.Product;
import com.service.OrderService;
import com.service.ProductService;
import com.utils.DateStringEditor;
import org.aspectj.apache.bcel.classfile.ConstantInterfaceMethodref;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 *
 **/
@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

//    @InitBinder
//    public void initBinder(WebDataBinder binder){
//        binder.registerCustomEditor(Date.class,new DateStringEditor());
//    }

    @RequestMapping("/findAllProduct")
    public ModelAndView findAllProduct() throws  Exception{
        ModelAndView mv=new ModelAndView();
        List<Product> products=productService.findAll();
        mv.addObject("products",products);
        mv.setViewName("product-list");
        return mv;
    }

    @RequestMapping("/save")
    public String save(Product product){
        productService.save(product);
        return "redirect:/product/findAllProduct";
    }


}
