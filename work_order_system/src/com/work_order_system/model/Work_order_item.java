package com.work_order_system.model;

public class Work_order_item {
	private Integer id;
	private short operate; 
	private java.sql.Timestamp start_time;
	private java.sql.Timestamp end_time;
	private String advise;
	private Integer order_id;  					//多对一
	private Integer employee_id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public short getOperate() {
		return operate;
	}
	public void setOperate(short operate) {
		this.operate = operate;
	}
	public java.sql.Timestamp getStart_time() {
		return start_time;
	}
	public void setStart_time(java.sql.Timestamp start_time) {
		this.start_time = start_time;
	}
	public java.sql.Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(java.sql.Timestamp end_time) {
		this.end_time = end_time;
	}
	public String getAdvise() {
		return advise;
	}
	public void setAdvise(String advise) {
		this.advise = advise;
	}
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
}
