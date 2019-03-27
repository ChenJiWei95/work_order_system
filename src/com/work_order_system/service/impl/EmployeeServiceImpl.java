package com.work_order_system.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JSON2.json.JSONArray;
import com.JSON2.json.JSONObject;
import com.work_order_system.mapper.EmployeeMapper;
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
import com.work_order_system.service.EmployeeService;
import com.work_order_system.util.DateUtil;
import com.work_order_system.util.FieldData;
import com.work_order_system.util.TimeUtil;
import com.work_order_system.util.Util;
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{
	@Resource
	EmployeeMapper employeeMapper;
	
	/**
	 * 用一句话描述该方法
	 * @see com.work_order_system.service.EmployeeService#createOrder(java.lang.Integer)
	 */
	@Override
	public void createOrder(Work_order order, 
			Work_order_informate infor,
			Work_order_item item) {
		//工单的基本信息
		employeeMapper.createWorkOrder(order);
		
		Integer orderId = employeeMapper.getLastInsertId();
		infor.setOrderId(orderId);  //获取最大word_order id 建立关联
		employeeMapper.insertOrderInfor(infor);
		
		//创建受理人（发起人）处理项
		item.setOrder_id(orderId);
		item.setStart_time(DateUtil.parseDateTiemOfString(TimeUtil.getDatetime()));
		item.setEnd_time(DateUtil.parseDateTiemOfString(TimeUtil.getDatetime()));
		item.setEmployee_id(order.getAccepEmployeeId());
		employeeMapper.createWorkOrderItem(item);
		//获取item最大id
		item.setId(employeeMapper.getLastInsertIdOfItem());
		item.setOperate((short) 9);
		employeeMapper.updateWorkOrderItem(item);
	}
	
	/**
	 * 用一句话描述该方法
	 * @see com.work_order_system.service.EmployeeService#createWorkOrderItem(java.lang.Integer)
	 */
	@Override
	public void createWorkOrderItem(Work_order_item item){
		employeeMapper.createWorkOrderItem(item);
	}
	
	public void dealWorkOrderOfComm(Work_order_item item, Integer groupId){
		//修改工单环节字段 group_id=转派位置
		//UPDATE shopcarts SET `数量` = 2,`价格` = 23 WHERE `商品编号` = 10 
		//update work_order set `group_id` = 转派位置id, `now_emp_id` = null;
		Work_order order = new Work_order();
		order.setCurrent_employee_id(0);
		order.setGroup_id(groupId);
		order.setId(item.getOrder_id());
		if(item.getOperate() == 7) {
			order.setGroup_id(0);
			order.setState((short) 2); //归档的话则状态改为2
		}
		item.setId(employeeMapper.selectMaxIdByOrderId(item.getOrder_id()));
		employeeMapper.dealWorkOrderOfComm(order);
		//创建工单处理项 createWorkOrderItem 处理建议
		employeeMapper.updateWorkOrderItem(item);
		//工单评价
	}
	
	public ArrayList<OrderTrack> workOrderTrack(Integer orderId) {
		return employeeMapper.selectWorkOrderTrack(orderId);
	}
	
	
	public String workOrderDetail(Integer orderId, Integer employeeId){
		OrderDetail od = employeeMapper.selectWorkOrderDetail(orderId);
		JSONObject json = new JSONObject();
		JSONObject obj = new JSONObject();
		obj.put("id", od.getId());
		obj.put("name", od.getName());
		obj.put("priority", FieldData.PriorityField.get(od.getPriority()));
		obj.put("time", DateUtil.parseStringOfDateTime(od.getTime()));
		obj.put("title", od.getTitle());
		obj.put("user_email", od.getUser_email());
		obj.put("user_name", od.getUser_name());
		obj.put("user_phone", od.getUser_phone());
		obj.put("desc", od.getDesc());
		obj.put("type", "默认");
		obj.put("model", "默认");
		json.put("order_detail", obj);
		
		JSONObject jsonOr = new JSONObject(); 
		if(od.getGroup_id() != 0){
			Work_order orderOfSelectPartName = new Work_order();
			orderOfSelectPartName.setId(od.getId());
			orderOfSelectPartName.setGroup_id(od.getGroup_id());
			OparateModel or = employeeMapper.selectPartName(orderOfSelectPartName);
			jsonOr.put("emp_id", or.getNow_emp_id());
			jsonOr.put("part_name", or.getPart_name());
			jsonOr.put("state", or.getState());
		} else {
			//归档订单的组id为零不需要查数据库 直接设置empid=0 state=1 
			jsonOr.put("emp_id", 0);
			jsonOr.put("part_name", "-");
			jsonOr.put("state", 1);
		}
		jsonOr.put("accept_group_id", od.getGroup_id());
		jsonOr.put("emp_group_id", employeeMapper.selectGroupIdById(employeeId));
		json.put("part_name", jsonOr);
		
		ArrayList<OrderTrack> list = employeeMapper.selectWorkOrderTrack(orderId);
		JSONArray arr = null;
		if(list.size() > 0){
			arr = new JSONArray();
			for(OrderTrack item : list){
				JSONObject json_ = new JSONObject();
				json_.put("part", item.getPart_name());
				json_.put("advise", item.getAdvise());
				json_.put("end_time", DateUtil.parseStringOfDateTime(item.getEnd_time()));
				json_.put("responce", item.getG_name()+"/"+item.getName());
				json_.put("oparate", FieldData.OparateField.get(item.getOperate()));
				json_.put("start_time", DateUtil.parseStringOfDateTime(item.getStart_time()));
				arr.add(json_);
			}
		}
		json.put("employee_id", employeeId);
		json.put("order_process", arr);
		json.put("group_data", selectGroup());
		return json.toString();
	}
	
	public String receiveWorkOrder(Work_order order){
		ArrayList<Work_order_list> list = employeeMapper.receiveWorkOrder(order);
		JSONObject json = new JSONObject();
		//employee_id = 0  组内为领取的工单 返回的index=1
		//否则 则为个人已领取工单 返回的index=2
		json.put("index", order.getCurrent_employee_id() == 0 ? 1 : 2);
		JSONArray jsonArr = null;
		if(list.size() > 0){
			jsonArr = new JSONArray();
			for(int i = 0, len = list.size(); i < len; i++){
				Work_order_list item = list.get(i);
				JSONObject json_ = new JSONObject();
				json_.put("id", item.getId());
				json_.put("priority", FieldData.PriorityField.get(item.getPriority()));
				json_.put("title", item.getTitle());
				json_.put("time", DateUtil.parseStringOfDateTime(item.getTime()));
				json_.put("state", FieldData.StateField.get(item.getState()));
				json_.put("accep", item.getName());
				jsonArr.add(json_);
			}	
			json.put("data", jsonArr); //返回data数据
		}
		return json.toString();
	}
	
	public String commiteWorkOrder(Work_order order, String type){
		ArrayList<Work_order_list> list = employeeMapper.commiteWorkOrder(order);
		JSONObject json = new JSONObject();
		//employee_id = 0  组内为领取的工单 返回的index=1
		//否则 则为个人已领取工单 返回的index=2
		json.put("index", Integer.parseInt(type));
		JSONArray jsonArr = null;
		if(list.size() > 0){
			jsonArr = new JSONArray();
			for(int i = 0, len = list.size(); i < len; i++){
				Work_order_list item = list.get(i);
				JSONObject json_ = new JSONObject();
				json_.put("id", item.getId());
				json_.put("priority", FieldData.PriorityField.get(item.getPriority()));
				json_.put("title", item.getTitle());
				json_.put("time", DateUtil.parseStringOfDateTime(item.getTime()));
				json_.put("state", FieldData.StateField.get(item.getState()));
				json_.put("accep", item.getName());
				jsonArr.add(json_);
			}	
			json.put("data", jsonArr); //返回data数据
		}
		return json.toString();
	}
	
	public void takeWorkOrder (Work_order order){
		employeeMapper.takeWorkOrder(order);
		Work_order_item item = new Work_order_item();
		item.setEmployee_id(order.getCurrent_employee_id());
		item.setOrder_id(order.getId());
		item.setStart_time(DateUtil.parseDateTiemOfString(TimeUtil.getDatetime()));
		employeeMapper.createWorkOrderItem(item);
	}
	
	public Integer workOrderCountOfGroup(Work_order order){
		return employeeMapper.selectWorkOrderCountOfGroup(order);
	}

	public Integer workOrderCountOfCommed(Integer employeeId){
		return employeeMapper.selectWorkOrderCountOfCommed(employeeId);
	}
	public Integer myWorkOrderCountOfCommed(Integer acceptId){
		return employeeMapper.myWorkOrderCountOfCommed(acceptId);
	}
	public boolean login (String user, String pass) {
		Employee employee = employeeMapper.selectEmployee(user);
		if(employee != null && pass.equals(employee.getPass()))
			return true;
		return false;
	}
	public Employee getEmployeeById(Integer id) {
		return employeeMapper.selectEmployeeById(id);
	}
	
	public Employee_informate getEmployeeInfor(String user) {
		return employeeMapper.selectEmployeeInfor(user);
	}
	
	public List<Work_order> queryWorkOrderByPage(List<Work_order> list ,int currentPage, int pageSize){
		int fromIndex = (currentPage - 1) * pageSize;
		int toIndex = currentPage * pageSize;
		return list.subList(fromIndex, 
				(toIndex > list.size() 
						? list.size()
						: toIndex));
	}
	
	public JSONArray selectGroup(){
		List<Group> list = employeeMapper.selectGroup();
		JSONArray arr = new JSONArray();
		for(Group item : list){
			JSONObject json = new JSONObject();
			json.put("id", item.getId());
			json.put("part_name", item.getPart_name());
			JSONArray arr_ = new JSONArray();
			for(Group_ item_ : item.getGroup_()){
				JSONObject json_ = new JSONObject();
				json_.put("id", item_.getId());
				json_.put("g_name", item_.getG_name());
				arr_.add(json_);
			}
			json.put("group_", arr_);
			arr.add(json);
		}
		/*List<Group> list = employeeMapper.selectGroup();
		JSONArray arr = new JSONArray();
		for(Group item : list){
			JSONObject json = new JSONObject();
			json.put("id", item.getId());
			json.put("part_name", item.getPart_name());
			
			List<Group_> list_ = employeeMapper.selectGroup_(item.getId());
			JSONArray arr_ = new JSONArray();
			for(Group_ item_ : list_){
				JSONObject json_ = new JSONObject();
				json_.put("id", item_);
				json_.put("g_name", item_);
			}
			json.put("group_", arr_);
			arr.add(json);
		}
		return arr;*/
		return arr;
	}
	//分派工单
	public void assignmentOrder(){
		//对每个组进行自动分派工单
		//环节遍历
		for(Group item : employeeMapper.selectGroup()){
			int count = 0;
			//组遍历
			for(Group_ item_ : item.getGroup_()){
				List<Employee_informate_ext> infors = null;
				for(Work_order item__ : employeeMapper.selectNeedAssignmentOrder(item_.getId())){
					if(item_.getId() != 1 && infors == null) 
						infors = employeeMapper.selectEmployeeInforOfAssignment(item_.getId());
					//工单项数据
					Work_order_item order_item = new Work_order_item();
					
					order_item.setOrder_id(item__.getId());
					order_item.setStart_time(DateUtil.parseDateTiemOfString(TimeUtil.getDatetime()));
					if(item_.getId() == 1){
						//这是受理的分派 只需要派给创建人即可
						order_item.setEmployee_id(item__.getAccepEmployeeId());
						employeeMapper.takeWorkOrder(item__);
						employeeMapper.createWorkOrderItem(order_item);
					} else {
						//这里是其他所有的分派。采用轮流的机制分派给组内的所有成员
						if(count > infors.size()-1) count=0;
						order_item.setEmployee_id(infors.get(count).getId());
						item__.setCurrent_employee_id(infors.get(count++).getId());
						employeeMapper.takeWorkOrder(item__);
						employeeMapper.createWorkOrderItem(order_item);
					}
					System.out.println("将工单("+Util.fillString((item__.getId()+""), 6, '0')+")进行分派");
				}
			}
		}
	}
	public void test(){
		System.out.println("线程。。。");
	}
	/*@Override
	public List<User> queryUsers(User user) {
		List<User> list = null;
		try {
			list = userMapper.queryUsers(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public User queryUserByUsername(String username) {
		User user = null;
		try {
			user = userMapper.queryUserByUsername(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}*/
}
