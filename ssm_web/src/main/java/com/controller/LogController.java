package com.controller;

import com.domain.SysLog;
import com.service.SysLogService;
import org.aspectj.lang.annotation.After;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 *
 **/
@Controller
@RequestMapping("/log")
public class LogController {

    @Autowired
    private SysLogService sysLogService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView mv=new ModelAndView();
        List<SysLog> logs=sysLogService.findAll();
        mv.addObject("logs",logs);
        mv.setViewName("log-list");
        return mv;
    }
}
