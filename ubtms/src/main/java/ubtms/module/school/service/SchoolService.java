package ubtms.module.school.service;

import ubtms.basic.entity.LimitObjet;
import ubtms.module.school.entity.School;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
public interface SchoolService {
    int svaeSchool(School school);
    boolean validateSchool(String schoolName);
    School selectOne(School school);
    School selectOne(Integer schId);
    List<School> selectCollection(School school);
    List<School> selectCollection();
    List<School> selectWithLimit(LimitObjet<School> schoolLimitObjet);
    int updateSchoolById(School school);
    int updateSchoolById(List<School> schools) throws Exception;
    int getSchoolNum();
    int getSchoolNum(School school);
    int deleteSchool(List<School> schools);
}
