package ubtms.module.user.service;

import ubtms.module.user.entity.User;

/**
 * Created by jinzhany on 2016/12/8.
 */
public interface UserService {
    int selectById(Integer id);
    User select(User user);
    //getUserRight(User user);
}
