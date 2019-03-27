package com.work_order_system.service;

import java.util.ArrayList;
import java.util.List;

import com.JSON2.json.JSONArray;
import com.work_order_system.model.Employee;
import com.work_order_system.model.Employee_informate;
import com.work_order_system.model.Group;
import com.work_order_system.model.OrderDetail;
import com.work_order_system.model.OrderTrack;
import com.work_order_system.model.Work_order;
import com.work_order_system.model.Work_order_informate;
import com.work_order_system.model.Work_order_item;

public interface EmployeeService {
	/**
	 * 创建工单
	 * <p>	 
	 * 本接口由发起方调用 1.工单初始化 2.工单的 保障人信息 3、受理人工单处理项
	 * @param adapteEployeeId
	 * void
	 * @see
	 * @since 1.0
	 */
	void createOrder(Work_order order, Work_order_informate infor, Work_order_item item);
	
	/**
	 * 创建工单处理项
	 * <p>	 
	 * @param orderId
	 * void
	 * @see
	 * @since 1.0
	 */
	void createWorkOrderItem(Work_order_item item);
	
	/**
	 * 处理工单
	 * <p>	 
	 * void
	 * @see
	 * @since 1.0
	 */
	void dealWorkOrderOfComm(Work_order_item item, Integer groupId);
	
	ArrayList<OrderTrack> workOrderTrack(Integer orderId);
	
	String workOrderDetail(Integer orderId, Integer employeeId);
	
	String receiveWorkOrder(Work_order order);
	
	String commiteWorkOrder(Work_order order, String type);
	
	void takeWorkOrder (Work_order order);
	
	Integer workOrderCountOfGroup(Work_order order);
	
	Integer workOrderCountOfCommed(Integer employeeId);
	
	Integer myWorkOrderCountOfCommed(Integer acceptId);
	
	boolean login (String user, String pass);
	
	Employee getEmployeeById(Integer id);
	
	Employee_informate getEmployeeInfor(String user);
	
	List<Work_order> queryWorkOrderByPage(List<Work_order> list, int currentPage, int pageSize);
	
	JSONArray selectGroup();
	
	void test();

	void assignmentOrder();
}
