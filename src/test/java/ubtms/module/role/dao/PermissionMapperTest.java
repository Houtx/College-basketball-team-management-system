package ubtms.module.role.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.role.entity.Permission;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/3/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class PermissionMapperTest {
    @Autowired
    private PermissionMapper permissionMapper;

    @Test
    public void insert(){
        for (int j=36;j<=36;j++) {
            for (int i = 1;i<=4;i++) {
                Permission permission = new Permission();
                permission.setState((byte)1);
                permission.setType((byte)i);
                permission.setParentId(j);
                permissionMapper.insert(permission);
            }
        }

    }
}