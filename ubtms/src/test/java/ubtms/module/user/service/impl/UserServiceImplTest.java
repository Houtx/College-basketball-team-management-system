package ubtms.module.user.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.user.dao.UserMapper;
import ubtms.module.user.entity.User;

import static org.junit.Assert.*;

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
    public void selectByAccountAndPassword() throws Exception {

    }

}