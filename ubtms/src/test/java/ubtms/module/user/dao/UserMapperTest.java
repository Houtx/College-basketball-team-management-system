package ubtms.module.user.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.role.entity.Role;
import ubtms.module.school.entity.School;
import ubtms.module.user.entity.User;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by jinzhany on 2017/2/15.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserMapperTest {
    @Resource
    UserMapper userMapper;

    @Test
    public void selectWithRelative() throws Exception {
        //School school = new School(1);
        Role role = new Role();
        //role.setSchoolId(1);

        User user = new User();
        //user.setRealName("哈哈哈");
        user.setRole(role);
        LimitObjet<User> limitObjet = new LimitObjet<>(user,1,3);

        System.out.println(userMapper.selectWithRelative(limitObjet));
        //System.out.println("count:"+userMapper.countWithRelative(user));

    }

}