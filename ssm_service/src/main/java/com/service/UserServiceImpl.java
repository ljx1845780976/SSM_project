package com.service;

import com.dao.UserDao;
import com.domain.Role;
import com.domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.naming.Name;
import javax.swing.text.StyledEditorKit;
import java.util.ArrayList;
import java.util.List;

/**
 *
 **/
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo=null;
        try {
            userInfo=userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //把自己的数据库user封装成UserDetails，并封装登录时的角色
        // 获取状态,如果为0,即enabled属性为false,该账户不可用
        // 不加密时要在userInfo.getPassword()前加字符串"{noop}"
        User user=new User(userInfo.getUsername(),userInfo.getPassword(),
                userInfo.getStatus()==0?false:true,true,true,true,
                getAuthority(userInfo.getRoles()));
        return user;
    }
    //编写一个返回角色的方法，返回用户所拥有的角色
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list=new ArrayList<>();
        for(Role role:roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return list;
    }

    public List<UserInfo> findAll(){
        return userDao.findAll();
    }

    @Override
    public void save(UserInfo user) {
        //对密码进行加密处理
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userDao.save(user);
    }

    @Override
    public UserInfo findById(String id) {
        return userDao.findById(id);
    }

    @Override
    public List<Role> findOtherRoles(String Uid) {
        return userDao.findOtherRoles(Uid);
    }

    @Override
    public void addRoles(String uid, String rid) {
        userDao.addRoles(uid,rid);
    }

    @Override
    public boolean existEmail(String email) {
       String e= userDao.existEmail(email);
       if (e==null){
           return false;
       }else {
           return true;
       }
    }

    @Override
    public void delete(String id) {
        userDao.deleteInU_R(id);
        userDao.delete(id);
    }

}
