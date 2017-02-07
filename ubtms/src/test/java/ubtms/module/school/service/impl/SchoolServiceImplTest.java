package ubtms.module.school.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.school.dao.SchoolMapper;
import ubtms.module.school.entity.School;

/**
 * Created by jinzhany on 2016/12/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"
        ,"classpath:spring/spring-service.xml"})
public class SchoolServiceImplTest {
    @Autowired
    SchoolMapper schoolMapper;

    @Test
    public void insertSchool() throws Exception {
        School school = new School();
        school.setSchName("�㶫��ҵ��ѧ");
        if (schoolMapper.queryByName(school.getSchName())==null){
            System.out.println("����ɹ���"+ schoolMapper.insertSchool(school));
        }
        //schoolMapper.insertSchool()
        System.out.println("����ʧ��");
    }

    @Test
    public void updateSchoolById() {
        School school = new School();
        school.setSchName("中大");
        school.setSchId(5);
        short s = 0;
        school.setState(s);

        int i= schoolMapper.updateSchoolById(school);
        System.out.println(i);
    }


}