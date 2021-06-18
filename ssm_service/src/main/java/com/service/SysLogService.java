package com.service;

import com.domain.SysLog;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 **/
public interface SysLogService  {
     void save(SysLog sysLog);
     List<SysLog> findAll();
}
