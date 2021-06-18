package com.controller;

import com.domain.Permission;
import com.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 *
 **/
@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping("/findAll")
    @RolesAllowed({"ADMIN","USER"})
    public ModelAndView findAll(){
        ModelAndView mv=new ModelAndView();
        List<Permission> permissions = permissionService.findAll();
        mv.addObject("permissions",permissions);
        mv.setViewName("permission-list");
        return mv;
    }
}
