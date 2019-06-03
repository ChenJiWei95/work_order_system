package com.work_order_system.model;

public class Employee_informate {
	//id name phone employee_id group_id
	private Integer id;
	private String name;
	private String phone;
	private Integer employee_id;  		//一对一
	private Integer group_id; 				//一对一
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public String toString(){
		return "Employee_informate [id = "+id+", name = "+name+", phone = "+phone+", employee_id = "+employee_id+", group_id = "+group_id+"]";
	}
}
