package ubtms.basic.dto;

//DTO:完成WEB层到Service层的数据传递
public class MngResult<T> {
	private boolean success;
	private T rows;
	private String error;
	private int total;

	public MngResult(boolean success, T rows, int total) {
		this.success = success;
		this.rows = rows;
		this.total = total;
	}

	public MngResult(boolean success, T rows) {
		this.success = success;
		this.rows = rows;
	}
	public MngResult(boolean success, String error) {
		super();
		this.success = success;
		this.error = error;
	}

	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public T getRows() {
		return rows;
	}
	public void setRows(T rows) {
		this.rows = rows;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
//	@Override
//	public String toString() {
//		return "MngResult [success=" + success + ", rows=" + rows + ", error=" + error + ", total="+total+", r="+r+"]";
//	}
}
