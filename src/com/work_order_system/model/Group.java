package com.work_order_system.model;

import java.util.ArrayList;

public class Group {
	private Integer id;
	private String part_name; 
	private ArrayList<Group_> group_;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPart_name() {
		return part_name;
	}
	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}
	public ArrayList<Group_> getGroup_() {
		return group_;
	}
	public void setGroup_(ArrayList<Group_> group_) {
		this.group_ = group_;
	}
	
}
