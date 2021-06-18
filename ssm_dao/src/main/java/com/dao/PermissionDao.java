package com.dao;

import com.domain.Permission;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 **/
public interface PermissionDao {
    @Select("select * from permission inner join role_permission rp on id=permissionId where roleId=#{rId}")
    public List<Permission> findByRid(String uid);

    @Select("select * from permission")
    List<Permission> findAll();
}
