package ubtms.module.school.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.school.dao.SchoolMapper;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;

/**
 * Created by jinzhany on 2016/12/8.
 */
@Service
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    SchoolMapper schoolMapper;

    @Override
    public int svaeSchool() {
        School school = new School();
        school.setSchName("广东工业大学");
        if (schoolMapper.queryByName(school.getSchName())==null){
            System.out.println("影响行数："+ schoolMapper.insertSchool(school));
            return 1;
        }
        //schoolMapper.insertSchool()
        System.out.println("学校已存在");
        return 0;
    }


}
