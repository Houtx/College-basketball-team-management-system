package ubtms.module.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.module.user.dao.UserMapper;
import ubtms.module.user.entity.User;
import ubtms.module.user.service.UserService;
import ubtms.module.user.dao.UserMapper;

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
    public User selectByAccountAndPassword(User user) {
        return userMapper.selectByAccountAndPassword(user);
    }
}
