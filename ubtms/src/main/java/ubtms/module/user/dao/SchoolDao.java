package ubtms.module.user.dao;

import ubtms.module.user.entity.User;

/**
 * Created by jinzhany on 2016/12/7.
 */

//ctrl+shift+t�½�����
public interface SchoolDao {
    User queryById(int schId);

    int insertSchool(User school);

    User queryByName(String schName);
}
