package ubtms.module.school.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.module.school.entity.School;

import javax.annotation.Resource;

/**
 * Created by jinzhany on 2016/12/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class SchoolMapperTest {
    @Resource
    private SchoolMapper schoolMapper;
    //�˴����ֱ�Ӻ��ԣ���Ϊ���ǲ��������Ҳ���bean
    @Test
    public void queryById() throws Exception {
        System.out.println(schoolMapper.queryById(1));
    }

    @Test
    public void queryByName() throws Exception {
        System.out.println(schoolMapper.queryByName("�㶫��ҵ"));
    }

    @Test
    public void insertSchool() throws Exception {
        School school = new School();
        school.setSchName("�㶫��ҵ��ѧ");
        System.out.println(schoolMapper.insertSchool(school));
    }

}