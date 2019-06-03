package com.work_order_system.model;

public class Work_order_informate {
	private Integer id;
	private String user_name;
	private String user_phone;
	private String user_email;
	private Integer orderId;  	//一对一
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_email() {
		return user_email;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	
}
