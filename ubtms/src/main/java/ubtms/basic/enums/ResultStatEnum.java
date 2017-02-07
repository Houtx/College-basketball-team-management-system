package ubtms.basic.enums;

public enum ResultStatEnum {
	SUCCESS(1,"��ɱ�ɹ�"),
	END(0,"��ɱ����"),
	UPDATE_FAILED(-1,"����ʧ��"),
	INNER_ERROR(-2,"ϵͳ�쳣"),
	DATA_REWRITE(-3,"���ݴ۸�"),
	NOT_LOGIN(-4,"δ��½");
	
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
