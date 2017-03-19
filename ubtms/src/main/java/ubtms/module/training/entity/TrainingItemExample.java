package ubtms.module.training.entity;

import java.util.ArrayList;
import java.util.List;

public class TrainingItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public TrainingItemExample() {
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

        public Criteria andItemIsNull() {
            addCriterion("item is null");
            return (Criteria) this;
        }

        public Criteria andItemIsNotNull() {
            addCriterion("item is not null");
            return (Criteria) this;
        }

        public Criteria andItemEqualTo(Byte value) {
            addCriterion("item =", value, "item");
            return (Criteria) this;
        }

        public Criteria andItemNotEqualTo(Byte value) {
            addCriterion("item <>", value, "item");
            return (Criteria) this;
        }

        public Criteria andItemGreaterThan(Byte value) {
            addCriterion("item >", value, "item");
            return (Criteria) this;
        }

        public Criteria andItemGreaterThanOrEqualTo(Byte value) {
            addCriterion("item >=", value, "item");
            return (Criteria) this;
        }

        public Criteria andItemLessThan(Byte value) {
            addCriterion("item <", value, "item");
            return (Criteria) this;
        }

        public Criteria andItemLessThanOrEqualTo(Byte value) {
            addCriterion("item <=", value, "item");
            return (Criteria) this;
        }

        public Criteria andItemIn(List<Byte> values) {
            addCriterion("item in", values, "item");
            return (Criteria) this;
        }

        public Criteria andItemNotIn(List<Byte> values) {
            addCriterion("item not in", values, "item");
            return (Criteria) this;
        }

        public Criteria andItemBetween(Byte value1, Byte value2) {
            addCriterion("item between", value1, value2, "item");
            return (Criteria) this;
        }

        public Criteria andItemNotBetween(Byte value1, Byte value2) {
            addCriterion("item not between", value1, value2, "item");
            return (Criteria) this;
        }

        public Criteria andContentIsNull() {
            addCriterion("content is null");
            return (Criteria) this;
        }

        public Criteria andContentIsNotNull() {
            addCriterion("content is not null");
            return (Criteria) this;
        }

        public Criteria andContentEqualTo(String value) {
            addCriterion("content =", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotEqualTo(String value) {
            addCriterion("content <>", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentGreaterThan(String value) {
            addCriterion("content >", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentGreaterThanOrEqualTo(String value) {
            addCriterion("content >=", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLessThan(String value) {
            addCriterion("content <", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLessThanOrEqualTo(String value) {
            addCriterion("content <=", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLike(String value) {
            addCriterion("content like", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotLike(String value) {
            addCriterion("content not like", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentIn(List<String> values) {
            addCriterion("content in", values, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotIn(List<String> values) {
            addCriterion("content not in", values, "content");
            return (Criteria) this;
        }

        public Criteria andContentBetween(String value1, String value2) {
            addCriterion("content between", value1, value2, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotBetween(String value1, String value2) {
            addCriterion("content not between", value1, value2, "content");
            return (Criteria) this;
        }

        public Criteria andCostIsNull() {
            addCriterion("cost is null");
            return (Criteria) this;
        }

        public Criteria andCostIsNotNull() {
            addCriterion("cost is not null");
            return (Criteria) this;
        }

        public Criteria andCostEqualTo(Integer value) {
            addCriterion("cost =", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotEqualTo(Integer value) {
            addCriterion("cost <>", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostGreaterThan(Integer value) {
            addCriterion("cost >", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostGreaterThanOrEqualTo(Integer value) {
            addCriterion("cost >=", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLessThan(Integer value) {
            addCriterion("cost <", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLessThanOrEqualTo(Integer value) {
            addCriterion("cost <=", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostIn(List<Integer> values) {
            addCriterion("cost in", values, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotIn(List<Integer> values) {
            addCriterion("cost not in", values, "cost");
            return (Criteria) this;
        }

        public Criteria andCostBetween(Integer value1, Integer value2) {
            addCriterion("cost between", value1, value2, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotBetween(Integer value1, Integer value2) {
            addCriterion("cost not between", value1, value2, "cost");
            return (Criteria) this;
        }

        public Criteria andDayIsNull() {
            addCriterion("day is null");
            return (Criteria) this;
        }

        public Criteria andDayIsNotNull() {
            addCriterion("day is not null");
            return (Criteria) this;
        }

        public Criteria andDayEqualTo(Byte value) {
            addCriterion("day =", value, "day");
            return (Criteria) this;
        }

        public Criteria andDayNotEqualTo(Byte value) {
            addCriterion("day <>", value, "day");
            return (Criteria) this;
        }

        public Criteria andDayGreaterThan(Byte value) {
            addCriterion("day >", value, "day");
            return (Criteria) this;
        }

        public Criteria andDayGreaterThanOrEqualTo(Byte value) {
            addCriterion("day >=", value, "day");
            return (Criteria) this;
        }

        public Criteria andDayLessThan(Byte value) {
            addCriterion("day <", value, "day");
            return (Criteria) this;
        }

        public Criteria andDayLessThanOrEqualTo(Byte value) {
            addCriterion("day <=", value, "day");
            return (Criteria) this;
        }

        public Criteria andDayIn(List<Byte> values) {
            addCriterion("day in", values, "day");
            return (Criteria) this;
        }

        public Criteria andDayNotIn(List<Byte> values) {
            addCriterion("day not in", values, "day");
            return (Criteria) this;
        }

        public Criteria andDayBetween(Byte value1, Byte value2) {
            addCriterion("day between", value1, value2, "day");
            return (Criteria) this;
        }

        public Criteria andDayNotBetween(Byte value1, Byte value2) {
            addCriterion("day not between", value1, value2, "day");
            return (Criteria) this;
        }

        public Criteria andTraingingIdIsNull() {
            addCriterion("trainging_id is null");
            return (Criteria) this;
        }

        public Criteria andTraingingIdIsNotNull() {
            addCriterion("trainging_id is not null");
            return (Criteria) this;
        }

        public Criteria andTraingingIdEqualTo(Integer value) {
            addCriterion("trainging_id =", value, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdNotEqualTo(Integer value) {
            addCriterion("trainging_id <>", value, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdGreaterThan(Integer value) {
            addCriterion("trainging_id >", value, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("trainging_id >=", value, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdLessThan(Integer value) {
            addCriterion("trainging_id <", value, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdLessThanOrEqualTo(Integer value) {
            addCriterion("trainging_id <=", value, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdIn(List<Integer> values) {
            addCriterion("trainging_id in", values, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdNotIn(List<Integer> values) {
            addCriterion("trainging_id not in", values, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdBetween(Integer value1, Integer value2) {
            addCriterion("trainging_id between", value1, value2, "traingingId");
            return (Criteria) this;
        }

        public Criteria andTraingingIdNotBetween(Integer value1, Integer value2) {
            addCriterion("trainging_id not between", value1, value2, "traingingId");
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