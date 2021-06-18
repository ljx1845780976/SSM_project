package com.service;

import com.dao.RoleDao;
import com.domain.Permission;
import com.domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 **/
@Service("roleService")
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;
    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }

    @Override
    public void save(Role role) {
        roleDao.save(role);
    }

    @Override
    public Role findById(String id) {
        return roleDao.findById(id);
    }

    @Override
    public void deleteById(String id) {
        //删角色时要先删该角色在中间表的数据
        roleDao.deleteByRidInU_R(id);
        roleDao.deleteByRidInR_P(id);
        roleDao.deleteById(id);
    }

    @Override
    public List<Permission> findOtherPermissions(String id) {
        return roleDao.findOtherPermissions(id);
    }

    @Override
    public void addPermissions(String rid, String pid) {
        roleDao.addPermissions(rid,pid);
    }
}
