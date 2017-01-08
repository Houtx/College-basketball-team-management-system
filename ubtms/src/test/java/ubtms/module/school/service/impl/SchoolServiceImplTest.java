package ubtms.module.school.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.school.dao.SchoolDao;
import ubtms.module.school.entity.School;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2016/12/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"
        ,"classpath:spring/spring-service.xml"})
public class SchoolServiceImplTest {
    @Autowired
    SchoolDao schoolDao;

    @Test
    //测试通过
    public void insertSchool() throws Exception {
        School school = new School();
        school.setSchName("广东工业大学");
        if (schoolDao.queryByName(school.getSchName())==null){
            System.out.println("插入成功："+schoolDao.insertSchool(school));
        }
        //schoolDao.insertSchool()
        System.out.println("插入失败");
    }

}