package com.controller;

import com.domain.Role;
import com.domain.UserInfo;
import com.service.UserService;
import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 **/
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @RequestMapping("/findAll")
    @RolesAllowed({"ADMIN","USER"})
    //@RolesAllowed({"ADMIN","USER"})
    public ModelAndView findAll(){
        ModelAndView mv=new ModelAndView();
        List<UserInfo> users = userService.findAll();
        mv.addObject("users",users);
        mv.setViewName("user-list");
        return mv;
    }
    @RequestMapping("/save")
    @RolesAllowed("ADMIN")
    public  String save(UserInfo user, ModelMap modelMap){
        String email=user.getEmail();
        // modelMap 只能写在方法参数里，不然返回地址时不能传值到指定地址。
        if(userService.existEmail(email)){
            modelMap.addAttribute("msg","该邮箱已被注册！");
            return "user-add";
        }else {
        userService.save(user);
        return "redirect:/user/findAll";}

    }
    @RequestMapping("/findById")
    public ModelAndView findById(@RequestParam(value = "id")String id){
        ModelAndView mv=new ModelAndView();
         UserInfo userInfo= userService.findById(id);
         mv.addObject("user",userInfo);
         mv.setViewName("user-details");
         return mv;
    }
    @RequestMapping("/findUserByIdAndOtherRole")
    @RolesAllowed("ADMIN")
    public ModelAndView findUserByIdAndOtherRole(@RequestParam(value = "id")String id){
        ModelAndView mv=new ModelAndView();
        UserInfo userInfo= userService.findById(id);
        //根据用户id查询可添加的角色
        List<Role> roles=userService.findOtherRoles(id);
        mv.addObject("user",userInfo);
        mv.addObject("roles",roles);
        mv.setViewName("user-addRole");
        return mv;

    }
    @RequestMapping("/addRoles")
    @RolesAllowed("ADMIN")
    public String addRoles(@RequestParam("userId") String Uid,@RequestParam("ids") String[] Rid){
        for(String rid:Rid) {
            userService.addRoles(Uid, rid);
        }
        return "redirect:/user/findAll";
    }

    @RequestMapping("/delete")
    @RolesAllowed("ADMIN")
    public String delete(@RequestParam("ids") String[] id){
        for (String i:id){
            userService.delete(i);
        }
        return "redirect:/user/findAll";
    }
}

