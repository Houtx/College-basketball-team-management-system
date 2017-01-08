package ubtms.module.school.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.school.entity.School;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2016/12/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件路径
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SchoolDaoTest {
    @Resource
    private SchoolDao schoolDao;
    //此错误可直接忽略，因为这是测试所以找不到bean
    @Test
    public void queryById() throws Exception {
        System.out.println(schoolDao.queryById(1));
    }

    @Test
    public void queryByName() throws Exception {
        System.out.println(schoolDao.queryByName("广东工业"));
    }

    @Test
    public void insertSchool() throws Exception {
        School school = new School();
        school.setSchName("广东工业大学");
        System.out.println(schoolDao.insertSchool(school));
    }

}