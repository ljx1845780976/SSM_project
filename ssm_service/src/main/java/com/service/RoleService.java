package com.service;

import com.domain.Permission;
import com.domain.Role;

import java.util.List;

/**
 *
 **/
public interface RoleService {
    List<Role> findAll();
    void  save(Role role);

    Role findById(String id);

    void deleteById(String id);

    List<Permission> findOtherPermissions(String id);

    void addPermissions(String rid, String pid);
}
