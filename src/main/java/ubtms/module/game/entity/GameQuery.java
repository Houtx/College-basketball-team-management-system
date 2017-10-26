package ubtms.module.game.entity;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.Date;

/**
 * Created by jinzhany on 2017/3/25.
 */
public class GameQuery extends Game {
    Integer limit;
    Integer offset;
    String schoolName;
    Date searchStartTime;
    Date searchEndTime;
    Integer searchState;//-1 全部 0未开始 1已结束

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public Date getSearchStartTime() {
        return searchStartTime;
    }

    public void setSearchStartTime(Date searchStartTime) {
        this.searchStartTime = searchStartTime;
    }

    public Date getSearchEndTime() {
        return searchEndTime;
    }

    public void setSearchEndTime(Date searchEndTime) {
        this.searchEndTime = searchEndTime;
    }

    public Integer getSearchState() {
        return searchState;
    }

    public void setSearchState(Integer searchState) {
        this.searchState = searchState;
    }
}
