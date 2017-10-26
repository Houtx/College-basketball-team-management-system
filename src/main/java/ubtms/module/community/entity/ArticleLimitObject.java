package ubtms.module.community.entity;

import ubtms.basic.entity.LimitObjet;
import ubtms.module.school.entity.School;

/**
 * Created by jinzhany on 2017/2/26.
 */
public class ArticleLimitObject<T> extends LimitObjet<T>{
    private String schoolName;
    private String system;

    public String getSystem() {
        return system;
    }

    public void setSystem(String system) {
        this.system = system;
    }

    public ArticleLimitObject() {

    }

    public ArticleLimitObject(T data, int offset, int limit) {
        super(data, offset, limit);
    }

    public ArticleLimitObject(T data, String schoolName, int offset, int limit) {
        super(data, offset, limit);
        this.schoolName = schoolName;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }
}
