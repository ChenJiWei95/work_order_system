package com.work_order_system.model;

public class OrderDetail {
	//id title name time priority state desc user_name user_phone user_emails
	private Integer id;   //工单编号
	private String title;
	private String name;
	private java.sql.Timestamp time;
	private short priority;
	private short state;
	private String desc;
	private String user_name;
	private String user_phone;
	private String user_email;
	private Integer group_id;
	private Integer emp_group_id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.sql.Timestamp getTime() {
		return time;
	}
	public void setTime(java.sql.Timestamp time) {
		this.time = time;
	}
	public short getPriority() {
		return priority;
	}
	public void setPriority(short priority) {
		this.priority = priority;
	}
	public short getState() {
		return state;
	}
	public void setState(short state) {
		this.state = state;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
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
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_emails) {
		this.user_email = user_emails;
	}
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public String toString(){
		return "OrderDetail [id = "+id+", title = "+title+", name = "+name+", time = "+time+", priority = "+priority+", state = "+state+", desc = "+desc+", user_name = "+user_name+", user_phone = "+user_phone+", user_emails = "+user_email+",]";
	}
	public Integer getEmp_group_id() {
		return emp_group_id;
	}
	public void setEmp_group_id(Integer emp_group_id) {
		this.emp_group_id = emp_group_id;
	}
	
}
