package ubtms.module.role.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.role.dao.SubMenuMapper;
import ubtms.module.role.entity.Permission;
import ubtms.module.role.entity.SubMenu;
import ubtms.module.role.service.PermissionService;
import ubtms.module.role.service.SubMenuService;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/2/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"
        ,"classpath:spring/spring-service.xml"})
public class SubMenuServiceImplTest {
    @Autowired
    SubMenuMapper subMenuMapper;

    @Autowired
    PermissionService permissionService;

    @Autowired
    SubMenuService subMenuService;

    @Test
    public void save() throws Exception {
        //subMenuMapper.insert(subMenu);
    }

    @Test
    public void saveAll() throws Exception {
       // int userMngId=2;
        SubMenu roleMng = subMenuMapper.selectByPrimaryKey(6);
        roleMng.setId(null);
        roleMng.setName("test1");
        SubMenu userMngs = subMenuMapper.selectByPrimaryKey(6);
        userMngs.setName("test2");
        userMngs.setId(null);
        List<SubMenu> teams = new ArrayList<SubMenu>();
        teams.add(roleMng);
        teams.add(userMngs);
        subMenuService.saveAll(teams);
//        for (SubMenu subMenu:subMenus) {
//            this.save(subMenu);
//            int subMenuId = this.selectOne(subMenu).getId();
//            List<Permission> permissions = new ArrayList<Permission>();
//            for (int i=1;i<=4;i++) {
//                Permission permission = new Permission(subMenuId,new Byte(String.valueOf(i)),new Byte("1"),i);
//                permissions.add(permission);
//            }
//            permissionService.saveAll(permissions);
//        }
    }

    @Test
    public void selectOne() throws Exception {
        System.out.println(subMenuMapper.selectByPrimaryKey(1));
    }

}