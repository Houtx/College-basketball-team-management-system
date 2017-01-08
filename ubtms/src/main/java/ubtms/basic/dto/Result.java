package ubtms.basic.dto;

//DTO:完成WEB层到Service层的数据传递
public class Result<T> {
	private boolean success;
	private T data;
	private String error;
	public Result(boolean success, T data) {
		//super();
		this.success = success;
		this.data = data;
	}
	public Result(boolean success, String error) {
		super();
		this.success = success;
		this.error = error;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	@Override
	public String toString() {
		return "Result [success=" + success + ", data=" + data + ", error=" + error + "]";
	}
}
