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
//����junit spring�������ļ�·��
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SchoolDaoTest {
    @Resource
    private SchoolDao schoolDao;
    //�˴����ֱ�Ӻ��ԣ���Ϊ���ǲ��������Ҳ���bean
    @Test
    public void queryById() throws Exception {
        System.out.println(schoolDao.queryById(1));
    }

    @Test
    public void queryByName() throws Exception {
        System.out.println(schoolDao.queryByName("�㶫��ҵ"));
    }

    @Test
    public void insertSchool() throws Exception {
        School school = new School();
        school.setSchName("�㶫��ҵ��ѧ");
        System.out.println(schoolDao.insertSchool(school));
    }

}