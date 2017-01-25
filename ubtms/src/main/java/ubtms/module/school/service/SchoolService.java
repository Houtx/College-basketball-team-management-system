package ubtms.module.school.service;

import ubtms.basic.entity.LimitObjet;
import ubtms.module.school.entity.School;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
public interface SchoolService {
    int svaeSchool(School school);
    School selectOne(School school);
    List<School> selectCollection(School school);
    List<School> selectCollection();
    List<School> selectWithLimit(LimitObjet<School> schoolLimitObjet);
}
