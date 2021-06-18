package com.controller;

import com.domain.Permission;
import com.domain.Role;
import com.domain.UserInfo;
import com.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 *
 **/
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;
    @RequestMapping("/findAll")
    @Secured({"ROLE_ADMIN","ROLE_USER"})
    public ModelAndView findAll(){
        ModelAndView mv=new ModelAndView();
        List<Role> roles = roleService.findAll();
        mv.addObject("roles",roles);
        mv.setViewName("role-list");
        return mv;
    }

    @RequestMapping("/save")
    @Secured("ROLE_ADMIN")
    public String save(Role role){
        roleService.save(role);
        return "redirect:/role/findAll";

    }
    @RequestMapping("/findById")
    public ModelAndView findById(@RequestParam(value = "id")String id){
        ModelAndView mv=new ModelAndView();
        Role role= roleService.findById(id);
        mv.addObject("role",role);
        mv.setViewName("role-details");
        return mv;
    }
    @RequestMapping("/deleteById")
    @Secured("ROLE_ADMIN")
    public String deleteById(@RequestParam(value = "ids")String[] id){
        for (String i:id) {
            roleService.deleteById(i);
        }
        return "redirect:/role/findAll";
    }
    @RequestMapping("/findRoleIdAndOtherPermissions")
    @Secured("ROLE_ADMIN")
    public ModelAndView findRoleIdAndOtherPermissions(@RequestParam(value = "id")String id){
        ModelAndView mv=new ModelAndView();
        Role role= roleService.findById(id);
        //根据用户id查询可添加的角色
        List<Permission> permissions=roleService.findOtherPermissions(id);
        mv.addObject("role",role);
        mv.addObject("permissions",permissions);
        mv.setViewName("role-addPermissions");
        return mv;

    }
    @RequestMapping("/addPermissions")
    @Secured("ROLE_ADMIN")
    public String addPermissions(@RequestParam("roleId") String Rid,@RequestParam("ids") String[] Pid){
        for(String pid:Pid) {
            roleService.addPermissions(Rid, pid);
        }
        return "redirect:/role/findAll";
    }
}
