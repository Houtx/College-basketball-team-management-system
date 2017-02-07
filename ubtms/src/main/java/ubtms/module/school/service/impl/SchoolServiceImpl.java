package ubtms.module.school.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ubtms.basic.entity.LimitObjet;
import ubtms.module.school.dao.SchoolMapper;
import ubtms.module.school.entity.School;
import ubtms.module.school.service.SchoolService;

import java.util.List;

/**
 * Created by jinzhany on 2016/12/8.
 */
@Service
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    SchoolMapper schoolMapper;

    @Override
    public int svaeSchool(School school) {
        return 0;
    }

    @Override
    public School selectOne(School school) {
        return schoolMapper.select(school).get(0);
    }

    @Override
    public List<School> selectCollection(School school) {
        return schoolMapper.select(school);
    }

    @Override
    public List<School> selectCollection() {
        return schoolMapper.select(null);
    }

    @Override
    public List<School> selectWithLimit(LimitObjet<School> schoolLimitObjet) {
        return schoolMapper.selectWithLimit(schoolLimitObjet);
    }

    @Override
    public int updateSchoolById(School school) {
        return schoolMapper.updateSchoolById(school);
    }

    @Override
    public int updateSchoolById(List<School> schools) {
        int sum=0;
        for (School school : schools) {
            sum+=this.updateSchoolById(school);
        }
        return sum;
    }

    @Override
    public int getSchoolNum() {
        return schoolMapper.countSchool();
    }
}
