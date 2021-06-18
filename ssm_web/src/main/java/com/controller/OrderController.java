package com.controller;

import com.domain.Order;
import com.github.pagehelper.PageInfo;
import com.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 *
 **/
@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

//    @InitBinder
//    public void initBinder(WebDataBinder binder){
//        binder.registerCustomEditor(Date.class,new DateStringEditor());
//    }

// 1.未分页
//    @RequestMapping("/findAllOrder")
//   public ModelAndView findAllOrder() throws Exception{
//        ModelAndView mv=new ModelAndView();
//       List<Order> list= orderService.findAll();
//       mv.addObject("orders",list);
//       mv.setViewName("order-list");
//      return mv;
//    }

    //2.分页
    @RequestMapping("/findAllOrder")
  public ModelAndView findAllOrder
    (@RequestParam(name = "page",defaultValue = "1")Integer page,@RequestParam(name = "size",defaultValue = "4") Integer size) throws Exception{
        ModelAndView mv=new ModelAndView();
       List<Order> list= orderService.findAll(page,size);
       //获取总数据数
       int count=orderService.findTotal();
       //pageInfo 是一个分页bean，即把list分页了
        PageInfo pageInfo=new PageInfo(list);
        /*在前端jsp中写pageInfo.list获取每页内的内容*/
       mv.addObject("pageInfo",pageInfo);
       mv.addObject("count",count);
       mv.setViewName("order-list");
      return mv;
   }

   @RequestMapping("/findById")
    public ModelAndView findById(@RequestParam("id") String id){
        ModelAndView mv=new ModelAndView();
              Order order=  orderService.findById(id);
              mv.addObject("order",order);
              mv.setViewName("order-details");
              return mv;
   }
}
