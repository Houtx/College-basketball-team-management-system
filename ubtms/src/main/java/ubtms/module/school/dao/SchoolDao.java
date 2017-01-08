package ubtms.module.school.dao;

import ubtms.module.school.entity.School;

/**
 * Created by jinzhany on 2016/12/7.
 */

//ctrl+shift+t生成测试
public interface SchoolDao {
    School queryById(int schId);

    int insertSchool(School school);

    School queryByName(String schName);
}
