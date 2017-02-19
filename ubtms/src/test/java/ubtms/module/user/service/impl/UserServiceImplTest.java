package ubtms.module.user.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.handler.UserRoleAuthorizationInterceptor;
import ubtms.module.user.dao.UserMapper;
import ubtms.module.user.entity.User;

/**
 * Created by jinzhany on 2017/1/17.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"
        ,"classpath:spring/spring-service.xml"})
public class UserServiceImplTest {
    @Autowired
    UserMapper userMapper;
    @Test
    public void selectById() throws Exception {
        User user = userMapper.selectByPrimaryKey(1);
        System.out.println(user);
    }

    @Test
    public void select() throws Exception {
       // User user = new User("root","123456");
        User user = new User();
       // user.setId(1);
        user.setPhone("admin");
        user.setPassword("123456");
       // User user2 = userMapper.selectOne(user);
        //System.out.println(user2);
    }

}