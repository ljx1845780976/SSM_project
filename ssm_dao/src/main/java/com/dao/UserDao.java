package com.dao;

import com.domain.Role;
import com.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 *
 **/
@Repository
public interface UserDao {
    @Select("select * from users where userName=#{username}")
    @Results(value = {
            @Result(id=true ,column = "id" ,property = "id"),
            @Result(column = "userName" ,property = "username"),
            @Result(column = "email" ,property = "email"),
            @Result(column = "password" ,property = "password"),
            @Result(column = "phoneNum" ,property = "phoneNum"),
            @Result(column = "status" ,property = "status"),
            @Result(column = "id" ,property = "roles" ,
                    many = @Many(select = "com.dao.RoleDao.findByUid"))
    })
    public UserInfo findByUsername(String username) throws Exception;

    @Select("select * from users")
    public List<UserInfo> findAll();

    @Insert("insert into users values(null,#{email},#{username},#{password},#{phoneNum},#{status})")
    void save(UserInfo user);

    @Select("select * from users where id=#{id}")
    @Results(value = {
            @Result(id=true ,column = "id" ,property = "id"),
            @Result(column = "userName" ,property = "username"),
            @Result(column = "email" ,property = "email"),
            @Result(column = "password" ,property = "password"),
            @Result(column = "phoneNum" ,property = "phoneNum"),
            @Result(column = "status" ,property = "status"),
            @Result(column = "id" ,property = "roles" ,
                    many = @Many(select = "com.dao.RoleDao.findByUid"))
    })
    UserInfo findById(String id);

    @Select("select * from role where id not in(select roleId from users_role where userId=#{Uid})")
    List<Role> findOtherRoles(String Uid);

    @Insert("insert into users_role values(#{uid},#{rid})")
    void addRoles(@Param("uid") String uid,@Param("rid") String rid);

    @Select("select email from users where email=#{email}")
   String existEmail(String email);

    @Delete("delete from users_role where userId=#{id}")
    void  deleteInU_R(String id);

    @Delete("delete from users where id=#{id}")
    void delete(String id);
}
