package com.work_order_system.model;
/**
 * <b>一句话描述该类</b>
 * <p>
 * 描述:<br>
 * 存储环节名称和当前处理人id 用于工单详细页判断下一步操作 例如提交还是退回
 * @author 威 
 * <br>2019年3月4日 上午12:49:21 
 * @see
 * @since 1.0
 */
public class OparateModel {
	private String part_name;
	private Integer now_emp_id;
	private String state;
	public String getPart_name() {
		return part_name;
	}
	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}
	public Integer getNow_emp_id() {
		return now_emp_id;
	}
	public void setNow_emp_id(Integer now_emp_id) {
		this.now_emp_id = now_emp_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
