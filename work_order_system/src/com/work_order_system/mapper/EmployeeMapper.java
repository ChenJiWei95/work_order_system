package com.work_order_system.mapper;

import java.util.ArrayList;
import java.util.List;

import com.work_order_system.model.Employee;
import com.work_order_system.model.Employee_informate;
import com.work_order_system.model.Employee_informate_ext;
import com.work_order_system.model.Group;
import com.work_order_system.model.Group_;
import com.work_order_system.model.OparateModel;
import com.work_order_system.model.OrderDetail;
import com.work_order_system.model.OrderTrack;
import com.work_order_system.model.Work_order;
import com.work_order_system.model.Work_order_informate;
import com.work_order_system.model.Work_order_item;
import com.work_order_system.model.Work_order_list;


public interface EmployeeMapper {
	/**
	 * 创建工单
	 * <p>	 
	 * @param work_order
	 * void
	 * @see
	 * @since 1.0
	 */
	void createWorkOrder(Work_order work_order);
	
	/**
	 * 这里用一句话描述这个方法的作用 领取的时候创建
	 * <p>	 
	 * @param item
	 * void
	 * @see
	 * @since 1.0
	 */
	void createWorkOrderItem(Work_order_item item);
	/**
	 * 提交的时候修改
	 * <p>	 
	 * @param item
	 * void
	 * @see
	 * @since 1.0
	 */
	void updateWorkOrderItem(Work_order_item item);
	
	/**
	 * 创建工单处理项
	 * <p>	 
	 * @param infor
	 * void
	 * @see
	 * @since 1.0
	 */
	void insertOrderInfor(Work_order_informate infor);
	
	Integer getLastInsertId();
	
	Integer getLastInsertIdOfItem();
	
	//提交
	void dealWorkOrderOfComm(Work_order order);
	
	ArrayList<OrderTrack> selectWorkOrderTrack(Integer orderId);
	
	OrderDetail selectWorkOrderDetail(Integer orderId);
	Integer selectGroupIdById(Integer id);
	
	ArrayList<Work_order_list> receiveWorkOrder(Work_order order);
	ArrayList<Work_order_list> commiteWorkOrder(Work_order order);
	
	void takeWorkOrder(Work_order order); 
	
	Integer selectWorkOrderCountOfGroup(Work_order order);
	Integer myWorkOrderCountOfCommed(Integer acceptId);
	Integer selectWorkOrderCountOfCommed(Integer employeeId);
	Employee selectEmployee (String user);
	Employee selectEmployeeById(Integer id);
	
	Employee_informate selectEmployeeInfor(String user);
	
	OparateModel selectPartName (Work_order order);
	
	ArrayList<Work_order> queryWorkOrderByPage();
	
	List<Group_> selectGroup_(Integer id);
	
	List<Group> selectGroup();
	
	Integer selectMaxIdByOrderId(Integer id);
	
	List<Work_order> selectNeedAssignmentOrder(Integer id);
	void runAssignmentOrderOfAccept(Integer id);
	void runAssignmentOrder(Employee_informate_ext infor);
	
	List<Employee_informate_ext> selectEmployeeInforOfAssignment(Integer id);
}
