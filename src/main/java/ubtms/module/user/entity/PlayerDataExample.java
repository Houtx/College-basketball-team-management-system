package ubtms.module.user.entity;

import java.util.ArrayList;
import java.util.List;

public class PlayerDataExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public PlayerDataExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andScoreIsNull() {
            addCriterion("score is null");
            return (Criteria) this;
        }

        public Criteria andScoreIsNotNull() {
            addCriterion("score is not null");
            return (Criteria) this;
        }

        public Criteria andScoreEqualTo(Integer value) {
            addCriterion("score =", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotEqualTo(Integer value) {
            addCriterion("score <>", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThan(Integer value) {
            addCriterion("score >", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("score >=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThan(Integer value) {
            addCriterion("score <", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThanOrEqualTo(Integer value) {
            addCriterion("score <=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreIn(List<Integer> values) {
            addCriterion("score in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotIn(List<Integer> values) {
            addCriterion("score not in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreBetween(Integer value1, Integer value2) {
            addCriterion("score between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("score not between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andShotIsNull() {
            addCriterion("shot is null");
            return (Criteria) this;
        }

        public Criteria andShotIsNotNull() {
            addCriterion("shot is not null");
            return (Criteria) this;
        }

        public Criteria andShotEqualTo(Integer value) {
            addCriterion("shot =", value, "shot");
            return (Criteria) this;
        }

        public Criteria andShotNotEqualTo(Integer value) {
            addCriterion("shot <>", value, "shot");
            return (Criteria) this;
        }

        public Criteria andShotGreaterThan(Integer value) {
            addCriterion("shot >", value, "shot");
            return (Criteria) this;
        }

        public Criteria andShotGreaterThanOrEqualTo(Integer value) {
            addCriterion("shot >=", value, "shot");
            return (Criteria) this;
        }

        public Criteria andShotLessThan(Integer value) {
            addCriterion("shot <", value, "shot");
            return (Criteria) this;
        }

        public Criteria andShotLessThanOrEqualTo(Integer value) {
            addCriterion("shot <=", value, "shot");
            return (Criteria) this;
        }

        public Criteria andShotIn(List<Integer> values) {
            addCriterion("shot in", values, "shot");
            return (Criteria) this;
        }

        public Criteria andShotNotIn(List<Integer> values) {
            addCriterion("shot not in", values, "shot");
            return (Criteria) this;
        }

        public Criteria andShotBetween(Integer value1, Integer value2) {
            addCriterion("shot between", value1, value2, "shot");
            return (Criteria) this;
        }

        public Criteria andShotNotBetween(Integer value1, Integer value2) {
            addCriterion("shot not between", value1, value2, "shot");
            return (Criteria) this;
        }

        public Criteria andFieldGoalIsNull() {
            addCriterion("field_goal is null");
            return (Criteria) this;
        }

        public Criteria andFieldGoalIsNotNull() {
            addCriterion("field_goal is not null");
            return (Criteria) this;
        }

        public Criteria andFieldGoalEqualTo(Integer value) {
            addCriterion("field_goal =", value, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalNotEqualTo(Integer value) {
            addCriterion("field_goal <>", value, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalGreaterThan(Integer value) {
            addCriterion("field_goal >", value, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalGreaterThanOrEqualTo(Integer value) {
            addCriterion("field_goal >=", value, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalLessThan(Integer value) {
            addCriterion("field_goal <", value, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalLessThanOrEqualTo(Integer value) {
            addCriterion("field_goal <=", value, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalIn(List<Integer> values) {
            addCriterion("field_goal in", values, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalNotIn(List<Integer> values) {
            addCriterion("field_goal not in", values, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalBetween(Integer value1, Integer value2) {
            addCriterion("field_goal between", value1, value2, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andFieldGoalNotBetween(Integer value1, Integer value2) {
            addCriterion("field_goal not between", value1, value2, "fieldGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotIsNull() {
            addCriterion("three_point_shot is null");
            return (Criteria) this;
        }

        public Criteria andThreePointShotIsNotNull() {
            addCriterion("three_point_shot is not null");
            return (Criteria) this;
        }

        public Criteria andThreePointShotEqualTo(Integer value) {
            addCriterion("three_point_shot =", value, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotNotEqualTo(Integer value) {
            addCriterion("three_point_shot <>", value, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGreaterThan(Integer value) {
            addCriterion("three_point_shot >", value, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGreaterThanOrEqualTo(Integer value) {
            addCriterion("three_point_shot >=", value, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotLessThan(Integer value) {
            addCriterion("three_point_shot <", value, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotLessThanOrEqualTo(Integer value) {
            addCriterion("three_point_shot <=", value, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotIn(List<Integer> values) {
            addCriterion("three_point_shot in", values, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotNotIn(List<Integer> values) {
            addCriterion("three_point_shot not in", values, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotBetween(Integer value1, Integer value2) {
            addCriterion("three_point_shot between", value1, value2, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotNotBetween(Integer value1, Integer value2) {
            addCriterion("three_point_shot not between", value1, value2, "threePointShot");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalIsNull() {
            addCriterion("three_point_shot_goal is null");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalIsNotNull() {
            addCriterion("three_point_shot_goal is not null");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalEqualTo(Integer value) {
            addCriterion("three_point_shot_goal =", value, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalNotEqualTo(Integer value) {
            addCriterion("three_point_shot_goal <>", value, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalGreaterThan(Integer value) {
            addCriterion("three_point_shot_goal >", value, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalGreaterThanOrEqualTo(Integer value) {
            addCriterion("three_point_shot_goal >=", value, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalLessThan(Integer value) {
            addCriterion("three_point_shot_goal <", value, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalLessThanOrEqualTo(Integer value) {
            addCriterion("three_point_shot_goal <=", value, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalIn(List<Integer> values) {
            addCriterion("three_point_shot_goal in", values, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalNotIn(List<Integer> values) {
            addCriterion("three_point_shot_goal not in", values, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalBetween(Integer value1, Integer value2) {
            addCriterion("three_point_shot_goal between", value1, value2, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andThreePointShotGoalNotBetween(Integer value1, Integer value2) {
            addCriterion("three_point_shot_goal not between", value1, value2, "threePointShotGoal");
            return (Criteria) this;
        }

        public Criteria andBackboardIsNull() {
            addCriterion("backboard is null");
            return (Criteria) this;
        }

        public Criteria andBackboardIsNotNull() {
            addCriterion("backboard is not null");
            return (Criteria) this;
        }

        public Criteria andBackboardEqualTo(Integer value) {
            addCriterion("backboard =", value, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardNotEqualTo(Integer value) {
            addCriterion("backboard <>", value, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardGreaterThan(Integer value) {
            addCriterion("backboard >", value, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardGreaterThanOrEqualTo(Integer value) {
            addCriterion("backboard >=", value, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardLessThan(Integer value) {
            addCriterion("backboard <", value, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardLessThanOrEqualTo(Integer value) {
            addCriterion("backboard <=", value, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardIn(List<Integer> values) {
            addCriterion("backboard in", values, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardNotIn(List<Integer> values) {
            addCriterion("backboard not in", values, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardBetween(Integer value1, Integer value2) {
            addCriterion("backboard between", value1, value2, "backboard");
            return (Criteria) this;
        }

        public Criteria andBackboardNotBetween(Integer value1, Integer value2) {
            addCriterion("backboard not between", value1, value2, "backboard");
            return (Criteria) this;
        }

        public Criteria andAssistIsNull() {
            addCriterion("assist is null");
            return (Criteria) this;
        }

        public Criteria andAssistIsNotNull() {
            addCriterion("assist is not null");
            return (Criteria) this;
        }

        public Criteria andAssistEqualTo(Integer value) {
            addCriterion("assist =", value, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistNotEqualTo(Integer value) {
            addCriterion("assist <>", value, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistGreaterThan(Integer value) {
            addCriterion("assist >", value, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistGreaterThanOrEqualTo(Integer value) {
            addCriterion("assist >=", value, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistLessThan(Integer value) {
            addCriterion("assist <", value, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistLessThanOrEqualTo(Integer value) {
            addCriterion("assist <=", value, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistIn(List<Integer> values) {
            addCriterion("assist in", values, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistNotIn(List<Integer> values) {
            addCriterion("assist not in", values, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistBetween(Integer value1, Integer value2) {
            addCriterion("assist between", value1, value2, "assist");
            return (Criteria) this;
        }

        public Criteria andAssistNotBetween(Integer value1, Integer value2) {
            addCriterion("assist not between", value1, value2, "assist");
            return (Criteria) this;
        }

        public Criteria andStealIsNull() {
            addCriterion("steal is null");
            return (Criteria) this;
        }

        public Criteria andStealIsNotNull() {
            addCriterion("steal is not null");
            return (Criteria) this;
        }

        public Criteria andStealEqualTo(Integer value) {
            addCriterion("steal =", value, "steal");
            return (Criteria) this;
        }

        public Criteria andStealNotEqualTo(Integer value) {
            addCriterion("steal <>", value, "steal");
            return (Criteria) this;
        }

        public Criteria andStealGreaterThan(Integer value) {
            addCriterion("steal >", value, "steal");
            return (Criteria) this;
        }

        public Criteria andStealGreaterThanOrEqualTo(Integer value) {
            addCriterion("steal >=", value, "steal");
            return (Criteria) this;
        }

        public Criteria andStealLessThan(Integer value) {
            addCriterion("steal <", value, "steal");
            return (Criteria) this;
        }

        public Criteria andStealLessThanOrEqualTo(Integer value) {
            addCriterion("steal <=", value, "steal");
            return (Criteria) this;
        }

        public Criteria andStealIn(List<Integer> values) {
            addCriterion("steal in", values, "steal");
            return (Criteria) this;
        }

        public Criteria andStealNotIn(List<Integer> values) {
            addCriterion("steal not in", values, "steal");
            return (Criteria) this;
        }

        public Criteria andStealBetween(Integer value1, Integer value2) {
            addCriterion("steal between", value1, value2, "steal");
            return (Criteria) this;
        }

        public Criteria andStealNotBetween(Integer value1, Integer value2) {
            addCriterion("steal not between", value1, value2, "steal");
            return (Criteria) this;
        }

        public Criteria andBlockshotIsNull() {
            addCriterion("blockshot is null");
            return (Criteria) this;
        }

        public Criteria andBlockshotIsNotNull() {
            addCriterion("blockshot is not null");
            return (Criteria) this;
        }

        public Criteria andBlockshotEqualTo(Integer value) {
            addCriterion("blockshot =", value, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotNotEqualTo(Integer value) {
            addCriterion("blockshot <>", value, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotGreaterThan(Integer value) {
            addCriterion("blockshot >", value, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotGreaterThanOrEqualTo(Integer value) {
            addCriterion("blockshot >=", value, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotLessThan(Integer value) {
            addCriterion("blockshot <", value, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotLessThanOrEqualTo(Integer value) {
            addCriterion("blockshot <=", value, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotIn(List<Integer> values) {
            addCriterion("blockshot in", values, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotNotIn(List<Integer> values) {
            addCriterion("blockshot not in", values, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotBetween(Integer value1, Integer value2) {
            addCriterion("blockshot between", value1, value2, "blockshot");
            return (Criteria) this;
        }

        public Criteria andBlockshotNotBetween(Integer value1, Integer value2) {
            addCriterion("blockshot not between", value1, value2, "blockshot");
            return (Criteria) this;
        }

        public Criteria andTurnoverIsNull() {
            addCriterion("turnover is null");
            return (Criteria) this;
        }

        public Criteria andTurnoverIsNotNull() {
            addCriterion("turnover is not null");
            return (Criteria) this;
        }

        public Criteria andTurnoverEqualTo(Integer value) {
            addCriterion("turnover =", value, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverNotEqualTo(Integer value) {
            addCriterion("turnover <>", value, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverGreaterThan(Integer value) {
            addCriterion("turnover >", value, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverGreaterThanOrEqualTo(Integer value) {
            addCriterion("turnover >=", value, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverLessThan(Integer value) {
            addCriterion("turnover <", value, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverLessThanOrEqualTo(Integer value) {
            addCriterion("turnover <=", value, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverIn(List<Integer> values) {
            addCriterion("turnover in", values, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverNotIn(List<Integer> values) {
            addCriterion("turnover not in", values, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverBetween(Integer value1, Integer value2) {
            addCriterion("turnover between", value1, value2, "turnover");
            return (Criteria) this;
        }

        public Criteria andTurnoverNotBetween(Integer value1, Integer value2) {
            addCriterion("turnover not between", value1, value2, "turnover");
            return (Criteria) this;
        }
    }

    /**
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}