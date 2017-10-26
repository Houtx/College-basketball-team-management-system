package ubtms.module.role.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.role.entity.Role;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/1/19.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class RoleMapperTest {
    static final Logger log = LoggerFactory.getLogger(RoleMapperTest.class);
    @Autowired
    RoleMapper roleMapper;

    @Test
    public void selectByPrimaryKey() throws Exception {
       Role role =  roleMapper.selectByPrimaryKey(1);
        log.debug("*************************success");
        System.out.println(role);
    }

    @Test
    public void insert() throws Exception {
        int a =  roleMapper.insert(new Role("球队领队",14,new Byte("1")));
        //log.info("success");
       // System.out.println(role);
    }

}