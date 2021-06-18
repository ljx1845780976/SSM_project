package com.dao;

import com.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *
 **/
@Repository
public interface SysLogDao {
    @Insert("insert into sysLog(visitTime,username,ip,url,executeTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executeTime},#{method})")
    public void save(SysLog sysLog);

    @Select("select * from sysLog order by id desc")
    List<SysLog> findAll();
}
