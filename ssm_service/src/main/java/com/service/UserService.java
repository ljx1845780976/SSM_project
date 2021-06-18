package com.service;

import com.domain.Role;
import com.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 *
 **/
public interface UserService extends UserDetailsService {
    List<UserInfo> findAll();

    void save(UserInfo user);

    UserInfo findById(String id);

    List<Role> findOtherRoles(String Uid);

    void addRoles(String uid, String rid);

    boolean existEmail(String email);

    void delete(String id);
}
