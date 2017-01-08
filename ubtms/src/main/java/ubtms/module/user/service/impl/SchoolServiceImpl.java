package ubtms.module.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.user.dao.SchoolDao;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.SchoolService;

/**
 * Created by jinzhany on 2016/12/8.
 */
@Service
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    SchoolDao schoolDao;
/*    @Autowired
    User user;*/
    @Override
    public int insertSchool() {
        User school = new User();
        school.setSchName("�㶫��ҵ��ѧ");
        if (schoolDao.queryByName(school.getSchName())==null){
            System.out.println("����ɹ���"+schoolDao.insertSchool(school));
            return 1;
        }
        //schoolDao.insertSchool()
        System.out.println("����ʧ��");
        return 0;
    }
}
