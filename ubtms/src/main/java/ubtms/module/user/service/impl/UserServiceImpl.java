package ubtms.module.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.entity.LimitObjet;
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

    @Override
    public int selectById(Integer id) {
        User user = userMapper.selectByPrimaryKey(id);
        System.out.println();
        return 0;
    }

    @Override
    public User select(User user) {
        return userMapper.select(user);
    }

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
