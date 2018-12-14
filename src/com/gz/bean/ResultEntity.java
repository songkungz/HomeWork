package com.gz.bean;
/**
 * 返回状态码对象
 * @author Administrator
 *
 */
public class ResultEntity {
	private int state;//状态码
	private String message;//提示信息
	private Object data;//传递数据
	
	public ResultEntity() {
		super();
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	

}
