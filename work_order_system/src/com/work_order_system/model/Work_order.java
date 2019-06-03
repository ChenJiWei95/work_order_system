package com.work_order_system.model;

import java.util.ArrayList;

public class Work_order {
	//id title desc accepEmployeeId state priority current_employee_id
	private Integer id;
	private String title;
	private String desc;
	private Integer accepEmployeeId; 								//多对一
	private ArrayList<Work_order_item> work_order_item;  			//一对多  
	private java.sql.Timestamp time;
	private short state;
	private Integer current_employee_id;
	private short priority;
	private Work_order_informate infor;
	private Integer group_id;

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
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Integer getAccepEmployeeId() {
		return accepEmployeeId;
	}
	public void setAccepEmployeeId(Integer accepEmployeeId) {
		this.accepEmployeeId = accepEmployeeId;
	}
	public ArrayList<Work_order_item> getWork_order_item() {
		return work_order_item;
	}
	public void setWork_order_item(ArrayList<Work_order_item> work_order_item) {
		this.work_order_item = work_order_item;
	}
	public Integer getCurrent_employee_id() {
		return current_employee_id;
	}
	public void setCurrent_employee_id(Integer current_employee_id) {
		this.current_employee_id = current_employee_id;
	}
	public java.sql.Timestamp getTime() {
		return time;
	}
	public void setTime(java.sql.Timestamp time) {
		this.time = time;
	}
	public short getState() {
		return state;
	}
	public void setState(short state) {
		this.state = state;
	}
	public short getPriority() {
		return priority;
	}
	public void setPriority(short priority) {
		this.priority = priority;
	}
	public Work_order_informate getInfor() {
		return infor;
	}
	public void setInfor(Work_order_informate infor) {
		this.infor = infor;
	}
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public String toString(){
		return "Work_order [id ="+id+", title ="+title+", desc ="+desc+", accepEmployeeId ="+accepEmployeeId+", state ="+state+", priority ="+priority+", current_employee_id ="+current_employee_id+"]";
	}
}
