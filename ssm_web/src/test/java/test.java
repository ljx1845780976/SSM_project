import com.dao.ProductDao;
import com.dao.RoleDao;
import com.dao.TravellerDao;
import com.dao.UserDao;
import com.domain.Product;
import com.domain.SysLog;
import com.domain.UserInfo;
import com.service.OrderService;
import com.service.ProductService;
import com.service.SysLogService;
import org.apache.ibatis.jdbc.Null;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 *
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:ApplicationContext.xml")
public class test {
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserDao userDao;
    @Autowired
    private TravellerDao travellerDao;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private SysLogService sysLogService;
    @Test
    public void test() throws Exception{
       sysLogService.save(new SysLog());
    }
}
