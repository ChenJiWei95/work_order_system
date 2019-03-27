package com.work_order_system.model;

public class OrderTrack {
	//
	private Integer order_id;
	private String part_name;
	private short operate;
	private String g_name;
	private String name;
	private java.sql.Timestamp start_time;
	private java.sql.Timestamp end_time;
	private String advise;
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public String getPart_name() {
		return part_name;
	}
	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}
	public short getOperate() {
		return operate;
	}
	public void setOperate(short operate) {
		this.operate = operate;
	}
	public String getG_name() {
		return g_name;
	}
	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String toString(){
		return "OrderTrack[order_id = "+order_id+", part_name = "+part_name+", operate = "+operate+", g_name = "+g_name+", name = "+name+", start_time = "+start_time+", end_time = "+end_time+", advise = "+advise+",]";
	}
}
