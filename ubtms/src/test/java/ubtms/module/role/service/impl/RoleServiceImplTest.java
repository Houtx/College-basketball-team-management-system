package ubtms.module.role.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.role.dao.RoleMapper;
import ubtms.module.role.entity.Role;
import ubtms.module.role.entity.RoleExample;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/1/19.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"
        , "classpath:spring/spring-service.xml"})
public class RoleServiceImplTest {
    @Autowired
    RoleService roleService;
    @Autowired
    RoleMapper roleMapper;

    @Test
    public void saveRole() throws Exception {
        //roleService.saveRole(new Role(3));
    }

    @Test
    public void selectRoleById() throws Exception {

    }

    @Test
    public void selectByExample() throws Exception {
        RoleExample roleExample = new RoleExample();
        roleExample.setLimit(10);
        roleExample.setOffset(0);
       // List<RoleExample.Criteria>  criteriaList = roleExample.getOredCriteria();
        RoleExample.Criteria criteria = roleExample.createCriteria();

        roleExample.getOredCriteria().get(0).andSchoolIdEqualTo(1);
        roleExample.getOredCriteria().get(0).andRoleNameEqualTo("超级系统管理员");

        List<Role> roles = roleService.selectByExample(roleExample);
        System.out.println(roles.get(0).getSchool().getSchName());
        //roleExample.createCriteria().andStatedEqualTo(new Byte(state));
    }

    @Test
    public void count() throws Exception {
        RoleExample roleExample = new RoleExample();
        roleExample.setLimit(null);
        roleExample.setOffset(null);
        System.out.println(roleMapper.countByExample(roleExample));
        //roleExample.createCriteria().andStatedEqualTo(new Byte(state));
    }
}