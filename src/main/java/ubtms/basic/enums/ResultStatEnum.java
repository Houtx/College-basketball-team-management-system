package ubtms.basic.enums;

public enum ResultStatEnum {
	SUCCESS(1,"秒杀成功"),
	END(0,"秒杀结束"),
	UPDATE_FAILED(-1,"插入失败"),
	INNER_ERROR(-2,"系统异常"),
	DATA_REWRITE(-3,"数据篡改"),
	NOT_LOGIN(-4,"未登陆");
	
	private int state;
	private String stateInfo;

	public int getState() {
		return state;
	}

	public String getStateInfo() {
		return stateInfo;
	}


	private ResultStatEnum(int state, String stateInfo) {
		this.state = state;
		this.stateInfo = stateInfo;
	}
	
	public static ResultStatEnum stateOf(int index) {
		for(ResultStatEnum state:values()){
			if (state.getState()==index) {
				return state;	
			}
		}
		return null;
	}

}
