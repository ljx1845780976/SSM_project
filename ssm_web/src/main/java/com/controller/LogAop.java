package com.controller;

import com.domain.SysLog;
import com.mysql.cj.log.Log;
import com.service.SysLogService;
import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.lang.invoke.MethodHandle;
import java.lang.reflect.Method;
import java.sql.DatabaseMetaData;
import java.util.Date;
import java.util.concurrent.ForkJoinTask;

/**   AOP日志：目的是获取1、visitTime访问时间，2、username用户名，3、ip访问的ip，4、url访问的路径
 *                     5、method访问的方法 6、executionTime执行时间
 *                  并把获取到的写入数据库方便日后查看
 *
 **/
@Component
@Aspect//表面当前类是一个切面类
public class LogAop {
      private Date visitTime;
      private Class clazz;
      private Method method;

      @Autowired
      private HttpServletRequest request;//前提在web.xml配置
      @Autowired
      private SysLogService sysLogService;
   /*
    <listener>
    <listener-class>org.springframework.web.context.request.RequestContextListener</listener-class>
    </listener>
   */
      //前置通知 ：主要是获取开始时间，执行的类是哪一个，执行的方法是哪一个
     @Before("execution( * com.controller.*.*(..))")
     public void  doBefore(JoinPoint jp) throws NoSuchMethodException{
          visitTime =new Date();//✔获取开始时间
          clazz=jp.getTarget().getClass();//获取访问的类
          String methodName=jp.getSignature().getName();//获取访问方法名

         //✔获取具体执行的方法的Method对象
         Object[] args=jp.getArgs();//获取访问方法的参数
         if (args==null||args.length==0){
             method=clazz.getMethod(methodName);//只能获取无参的方法
         }else {
             Class[] classArgs=new Class[args.length];
             for (int i=0;i<args.length;i++){
                 classArgs[i]=args[i].getClass();
             }
             clazz.getMethod(methodName,classArgs);
         }
    }

    //后置通知：
    @After("execution( * com.controller.*.*(..))")
    public void doAfter(){
         long time=new Date().getTime()-visitTime.getTime();//✔获取访问时长

        String url="";
        //✔获取url
        if (clazz!=null&&method!=null&&clazz!=LogAop.class){
            //1.获取类上的@requestMapping
            RequestMapping classAnnotation =(RequestMapping)clazz.getAnnotation(RequestMapping.class);
            if(classAnnotation!=null){
                String[] classValue=classAnnotation.value();

                //2.获取方法上的@requestMapping
                RequestMapping methodAnnotation=method.getAnnotation(RequestMapping.class);
                if(methodAnnotation!=null){
                    String[] methodValue=methodAnnotation.value();
                    url=classValue[0]+methodValue[0];
                }
            }


        }
        //✔获取访问的ip地址
        String ip=request.getRemoteAddr();
        //✔获取当前操作的用户
        SecurityContext context= SecurityContextHolder.getContext();//从文中获取当前登录的用户
        User user=(User)context.getAuthentication().getPrincipal();
        String username=user.getUsername();

        //将日志相关信息封装到SysLog对象
        SysLog sysLog=new SysLog();
        sysLog.setExecuteTime(time);
        sysLog.setIp(ip);
        sysLog.setMethod("[类名]"+clazz.getName()+"[方法名]"+method.getName());
        sysLog.setUrl(url);
        sysLog.setUsername(username);
        sysLog.setVisitTime(visitTime);

        sysLogService.save(sysLog);
    }

}
