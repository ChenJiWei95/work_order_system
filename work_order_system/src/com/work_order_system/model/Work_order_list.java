package com.work_order_system.model;

public class Work_order_list extends Work_order {
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String toString(){
		return "Work_order_list [id = "+this.getId()+", name = "+name+", priority = "+this.getPriority()+", title = "+this.getTitle()+", time = "+this.getTitle()+"]";
	}
}
