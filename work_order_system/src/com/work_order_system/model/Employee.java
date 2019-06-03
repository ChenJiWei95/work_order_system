package com.work_order_system.model;

import java.util.ArrayList;

public class Employee {
	//
	private Integer id;
	private String user;
	private String pass;
	private ArrayList<Work_order> work_orders;    //一对多
	private Employee_informate employee_infor;    //一对一
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public ArrayList<Work_order> getWork_orders() {
		return work_orders;
	}
	public void setWork_orders(ArrayList<Work_order> work_orders) {
		this.work_orders = work_orders;
	}
	public Employee_informate getEmployee_infor() {
		return employee_infor;
	}
	public void setEmployee_infor(Employee_informate employee_infor) {
		this.employee_infor = employee_infor;
	}
	public String toString(){
		return "Employee [id = "+id+", user = "+user+", pass = "+pass+"]";
	}
	
}
