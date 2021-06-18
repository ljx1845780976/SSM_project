package com.dao;

import com.domain.Permission;
import com.domain.Role;
import org.apache.ibatis.annotations.*;

import javax.swing.plaf.BorderUIResource;
import java.util.List;

/**
 *
 **/
public interface RoleDao {
    @Select("select id,roleName,roleDesc from role inner join users_role ur on role.id=ur.roleId where ur.userId=#{uid} ")
    @Results(id="permissions", value = {
         @Result(id=true,column = "id" ,property ="id"),
         @Result(column = "roleName" ,property ="roleName"),
         @Result(column = "roleDesc" ,property ="roleDesc"),
         @Result(column = "id" ,property ="permissions",
                 many = @Many(select = "com.dao.PermissionDao.findByRid"))
    })
    public List<Role> findByUid(String uid);

    @Select("select * from role")
    List <Role> findAll();

    @Insert("insert into role values(null,#{roleName},#{roleDesc})")
    void save(Role role);

    @Select("select * from role where id=#{id}")
    @ResultMap("permissions")
    Role findById(String id);

    //删角色时要先删该角色在中间表的数据
    @Delete("delete from role_permission where roleId=#{Rid}")
    void deleteByRidInR_P(String Rid);
    @Delete("delete from users_role where roleId=#{Rid}")
    void deleteByRidInU_R(String Rid);
    @Delete("delete from role where id=#{id}")
    void deleteById(String id);

    @Select("select * from permission where id not in(select permissionId from role_permission where roleId=#{Rid})")
    List<Permission> findOtherPermissions(String id);

    @Insert("insert into role_permission values(#{pid},#{rid})")
    void addPermissions(@Param("rid") String rid,@Param("pid") String pid);
}
