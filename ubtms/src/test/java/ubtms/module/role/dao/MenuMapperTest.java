package ubtms.module.role.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.role.entity.Menu;
import ubtms.module.school.dao.SchoolMapper;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/2/12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class MenuMapperTest {
    @Resource
    private MenuMapper menuMapper;


    @Test
    public  void select(){
        Menu teamMng = new Menu("&#xe62d;", "人员管理", 1, new Byte("1"), 3);
        List<Menu> menus = menuMapper.select(teamMng);
        System.out.println(menus);
    }

    @Test
    public void insertAll() throws Exception {
        int roleId = 2;
        Menu teamMng = new Menu("&#xe62d;", "球队管理", roleId, new Byte("1"), 1);
        Menu teamCommunity = new Menu("&#xe62d;", "球队动态", roleId, new Byte("1"), 2);
        Menu userMng = new Menu("&#xe62d;", "人员管理", roleId, new Byte("1"), 3);
        Menu personMsg = new Menu("&#xe62d;", "个人信息", roleId, new Byte("1"), 4);
        List<Menu> menus = new ArrayList<Menu>();
        menus.add(teamMng);
        menus.add(teamCommunity);
        menus.add(userMng);
        menus.add(personMsg);
        menuMapper.insertAll(menus);
    }

}