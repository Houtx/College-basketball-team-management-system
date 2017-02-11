package ubtms.module.school.dao;

import org.apache.ibatis.annotations.Param;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.school.entity.School;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/7.
 */

//ctrl+shift+t生成测试
public interface SchoolMapper {
    School queryById(int schId);
    int insertSchool(School school);
    School queryByName(String schName);
    List<School> select(School school);
    List<School> selectWithLimit(LimitObjet<School> school);
    int updateSchoolById(School school);
    int countSchool(School school);
    int deleteSchool(List<School> schools);
}
