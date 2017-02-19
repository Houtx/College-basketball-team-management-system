package ubtms.module.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.role.entity.Role;
import ubtms.module.role.entity.RoleExample;
import ubtms.module.role.service.RoleService;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;
import ubtms.module.user.dao.UserMapper;
import ubtms.module.user.entity.User;
import ubtms.module.user.entity.UserExample;
import ubtms.module.user.service.UserService;
import ubtms.module.user.dao.UserMapper;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleService roleService;
    @Autowired
    private SchoolService schoolService;


    
    @Override
    public int updateByPrimaryKey(List<User> users){
    	for(User user:users){
    		userMapper.updateByPrimaryKeySelective(user);
    	}	
    	return users.size();
    }

    @Override
    public boolean isUserAccountExist(String account) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andPhoneEqualTo(account);
        List<User> users = userMapper.selectByExample(userExample);
        if (users.size() > 0) {
            return true;
        }
        return false;
    }

    @Override
    public int saveUser(String headPic,String sex, String userType, String userName, String schoolName, String account, String password, String grade, String height, String weight, String shirtNum, String duty) {
       Integer schId = schoolService.selectOne(new School(schoolName)).getSchId();
        RoleExample roleExample = new RoleExample();
        roleExample.createCriteria().andSchoolIdEqualTo(schId).andRoleNameEqualTo(userType);
        Integer roleId = roleService.selectByExample(roleExample).get(0).getId();
        Byte dutyB = null;
        if (duty != null) {
            dutyB = Byte.valueOf(duty);
        }
        Byte shirtNumB = null;
        if (!shirtNum.isEmpty()) {
            shirtNumB = new Byte(shirtNum);
        }
        Float heightF = null;
        if (!height.isEmpty()) {
            heightF = Float.valueOf(height);
        }
        Float weightF = null;
        if (!weight.isEmpty()) {
            weightF = Float.valueOf(weight);
        }

        User user = new User(account,password,userName,Byte.valueOf(sex),new Byte("1"),heightF,weightF,grade,shirtNumB,dutyB,roleId,headPic);
        userMapper.insert(user);
        return 0;
    }

    @Override
    public User selectOne(User user) {
        List<User> users = select(user);
        if (users.size() > 0) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public List<User> select(User user) {
        return userMapper.select(user);
    }

    //根据schoolId或人员姓名查出人员
    @Override
    public List<User> selectWithRelative(LimitObjet<User> user) {
        return userMapper.selectWithRelative(user);
    }

    @Override
    public int countWithRelative(User user) {
        return userMapper.countWithRelative(user);
    }

    @Override
    public List<User> selectByExample(UserExample userExample) {
        return userMapper.selectByExample(userExample);
    }

    @Override
    public int countByExample(UserExample userExample) {
        return userMapper.countByExample(userExample);
    }
}
