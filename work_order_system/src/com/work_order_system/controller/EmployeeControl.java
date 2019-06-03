package com.work_order_system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.work_order_system.model.Employee;
import com.work_order_system.model.Employee_informate;
import com.work_order_system.model.OrderTrack;
import com.work_order_system.model.Work_order;
import com.work_order_system.model.Work_order_informate;
import com.work_order_system.model.Work_order_item;
import com.work_order_system.service.EmployeeService;
import com.work_order_system.util.DateUtil;
import com.work_order_system.util.TimeUtil;
/**
 * <b>用户对象控制类</b>
 * @author 威 
 * <br>2018年5月20日 下午2:48:28 
 * @since 1.0
 */
@Controller
/*
 * 将model中的user属性保存到Session中
 * @SessionAttributes("user")*/
public class EmployeeControl {
	@Autowired
	private EmployeeService employeeService;

	@RequestMapping("/toCreateOrder.do")
	public String toCreateOrder(){
		return "font/create_order";
	}
	@RequestMapping("/toMain.do")
	public String toMain(Model model, HttpServletRequest request){
		System.out.println("---------------------------toMain.do");
		Employee em = employeeService.getEmployeeById((Integer) request.getSession().getAttribute("employee_id"));
		//成功那么需要去访问员工的具体数据
		Employee_informate infor = employeeService.getEmployeeInfor(em.getUser());
		//初始化组内的工单数
		Work_order order = new Work_order();
		order.setGroup_id(infor.getGroup_id());
		order.setCurrent_employee_id(0);
		model.addAttribute("groupOrderCount", employeeService.workOrderCountOfGroup(order));
		//个人领取领取数量
		order.setCurrent_employee_id(infor.getEmployee_id());
		model.addAttribute("myTakeOrderCount", employeeService.workOrderCountOfGroup(order));
		//个人处理的工单数量
		model.addAttribute("myDealedOrderCount", employeeService.workOrderCountOfCommed(infor.getEmployee_id()));
		model.addAttribute("myCreateOrderCount", employeeService.myWorkOrderCountOfCommed(infor.getEmployee_id()));
		return "font/main";
	}
	
	//创建工单
	@RequestMapping("/createOrder.do")
	public String createOrder(Model model, HttpServletRequest request){
		short priority = Short.valueOf(request.getParameter("priority"));
		String title = request.getParameter("title");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		String user_email = request.getParameter("user_email");
		String desc = request.getParameter("desc");
		String advise = request.getParameter("advise");
		
		Work_order work_order = new Work_order();
		work_order.setDesc(desc);
		work_order.setTime(DateUtil.parseDateTiemOfString(TimeUtil.getDatetime()));
		work_order.setTitle(title);
		work_order.setPriority(priority);
		work_order.setState((short) 1);
		work_order.setAccepEmployeeId(
				(Integer) request.getSession().getAttribute("employee_id"));
		
		Work_order_informate infor = new Work_order_informate();
		infor.setUser_name(user_name);
		infor.setUser_email(user_email);
		infor.setUser_phone(user_phone);
		//employeeService.createOrder(1);
		/*已知 员工id*/
		Work_order_item item = new Work_order_item();
		item.setAdvise(advise);
		employeeService.createOrder(work_order, infor, item);
		return "redirect:/toMain.do";
	}
	 
	@RequestMapping("/createOrderItem.do")
	public String createOrderItem(Model model, HttpServletRequest request){
		//领取时调用
		//employeeService.createWorkOrderItem(1);
		return "testSuccess";
	}
	
	//处理工单
	@RequestMapping("/dealWorkOrderOfComm.do")
	public String dealWorkOrderOfComm(HttpServletRequest request){
		/*
		 * 已知 工单id 处理意见 结束时间
		 * */
		Integer orderId = Integer.parseInt(request.getParameter("order_id"));
		String advise = request.getParameter("advise");
		Integer group = Integer.parseInt(request.getParameter("group"));
		short operate = Short.parseShort(request.getParameter("operate"));
		System.out.println(orderId + " " + advise + " " + operate);
		Work_order_item item = new Work_order_item();
		item.setAdvise(advise);
		item.setOrder_id(orderId);
		item.setEnd_time(DateUtil.parseDateTiemOfString(TimeUtil.getDatetime()));
		item.setOperate(operate);
		employeeService.dealWorkOrderOfComm(item, group);
		return "testSuccess";
	}
	

	//工单详细
	@RequestMapping("/workOrderDetail.do")
	public String workOrderDetail(Model model, HttpServletRequest request){
		/*已知工单id*/
		Integer orderId = Integer.parseInt(request.getParameter("order_id"));
		model.addAttribute("data", 
				employeeService.workOrderDetail(orderId, 
						(Integer) request.getSession().getAttribute("employee_id")));
		return "font/work_order";
	}
	
	//工单跟踪
	@RequestMapping("/workOrderTrack.do")
	public String workOrderTrack(HttpServletRequest requst){
		/*已知工单id*/
		ArrayList<OrderTrack> list = employeeService.workOrderTrack(1);
		list.forEach((item) -> System.out.println(item.toString()));
		System.out.println(list.size());
		return "testSuccess";
	}
	
	//领取工单  已领取，未领取  必然不是归档未归档
	/**
	 * 这里用一句话描述这个方法的作用
	 * <p>	 
	 * 返回参数为json
	 * index 这是栏位
	 * data 这是工单列表数据
	 * @param model
	 * @param request
	 * @return
	 * String
	 * @see
	 * @since 1.0
	 */
	@RequestMapping("/receiveWorkOrder.do")
	public String receiveWorkOrder(Model model, HttpServletRequest request){
		Integer id = (Integer) request.getSession().getAttribute("employee_id");
		//System.out.println("id："+id);
		if(id == null)
			return "index";
		//Integer group_id = Integer.parseInt(request.getParameter("group_id"));
		String type = request.getParameter("type");
		//model.addAttribute("employee_groupId", group_id);
		//员工id state=0 group_id
		Work_order order = new Work_order();
		Integer employee_id = type.equals("1") 
					? 0 
					: (int) request.getSession().getAttribute("employee_id");
		order.setCurrent_employee_id(employee_id);
		order.setState((short) 1);				//固定为零 在途
		order.setGroup_id((int) request.getSession().getAttribute("employee_groupId"));
		model.addAttribute("data", employeeService.receiveWorkOrder(order));
		//将数据传递到前台 栏位index 列表json数据
		return "font/manage_order";
	}
	
	//已提交 归档状态不确定
	@RequestMapping("/commiteWorkOrder.do")
	public String commiteWorkOrder(Model model, HttpServletRequest request){
		//此处是传值给关联的employye_informate 中的employye_id字段
		String type = request.getParameter("type");
		//检索功能 字段
		String search_type = request.getParameter("search_type");
		String priority = request.getParameter("search_priority");
		String state = request.getParameter("search_state");
		String content = request.getParameter("search_content");
		Work_order order = new Work_order();
		System.out.println(priority + " " + state);
		System.out.println(order);
		order.setCurrent_employee_id((Integer) request.getSession().getAttribute("employee_id"));
		if(!"id".equals(search_type)){
			if(priority != null && !"".equals(priority)) order.setPriority(Short.parseShort(priority));
			System.out.println(order);
			if(state != null && !"".equals(state)) order.setState(Short.parseShort(state));
			System.out.println(order);
			if(content != null && !"".equals(content))  order.setTitle("%"+content+"%");
		} else {
			if(content != null && !"".equals(content)) order.setId(Integer.parseInt(content));
		}
		System.out.println(order);
		if(!"5".equals(type)) order.setState((short) (Integer.parseInt(type) - 2));
		model.addAttribute("data", employeeService.commiteWorkOrder(order, type));
		return "font/manage_order";
	}
	
	@RequestMapping("/takeWorkOrder.do")
	public String takeWorkOrder(HttpServletRequest request){
		//会得到一个员工号 和 工单号。将当前签收的工单做对应修改 
		Integer orderId = Integer.parseInt(request.getParameter("orderId"));
		Work_order order = new Work_order();
		order.setId(orderId);
		order.setCurrent_employee_id((Integer) request.getSession().getAttribute("employee_id"));
		employeeService.takeWorkOrder(order);
		return "testSuccess";
	}
	
	@RequestMapping("/workOrderCountOfGroup.do")
	public String workOrderCountOfGroup(Model model, HttpServletRequest request){
		Work_order order = new Work_order();
		order.setGroup_id(3);
		order.setCurrent_employee_id(1);
		model.addAttribute("msg", "组中未领取的工单数=");
		model.addAttribute("workOrderCountOfGroup", employeeService.workOrderCountOfGroup(order));
		return "testSuccess";
	}
	
	@RequestMapping("/workOrderCountOfCommed.do")
	public String workOrderCountOfCommed(Model model, HttpServletRequest request){
		model.addAttribute("msg", "已处理的工单数=");
		model.addAttribute("workOrderCountOfGroup", employeeService.workOrderCountOfCommed(1));
		return "testSuccess";
	}
	
	@RequestMapping("/login.do")
	public String login(Model model, HttpServletRequest request){
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		System.out.println(user + ", " + pass);
		if(employeeService.login(user, pass)){
			//记录用户名 不为空则为权限
			//成功那么需要去访问员工的具体数据
			Employee_informate infor = employeeService.getEmployeeInfor(user);
			System.out.println("infor" + infor.toString());
			System.out.println("sessionId:"+request.getSession().getId());
			request.getSession().setAttribute("employee_name", infor.getName());
			request.getSession().setAttribute("employee_id", infor.getEmployee_id());
			request.getSession().setAttribute("employee_groupId", infor.getGroup_id());
			return "redirect:/toMain.do";
		}
		else 
			return "index";
	}
	@ResponseBody  
	@RequestMapping(method=RequestMethod.POST, value="/test.do")
	public Object test(HttpServletRequest request){
		String user = request.getParameter("user");
		System.out.println("ajax 接到数据：user=" + user);
		Map<String, String> map = new HashMap<>();
		map.put("user", user);
		return "success";
	}
	
	@RequestMapping(value="/test1.do")
	public String test1(HttpServletRequest request){
		
		return "redirect:/toMain.do";
	}
	
	@RequestMapping(value="/test2.do/{pageSize}")
	public String test2(HttpServletRequest request, @PathVariable int pageSize){
		System.out.println(pageSize);
		return "successTest";
	}
	
	/*@RequestMapping("/hello.do")
	public String getUsers(Model model, HttpServletRequest request){
		User user = new User();
		user.setId(1);
		List<User> users = userService.queryUsers(user);
		model.addAttribute("user", users);
		return "index";
	}
	@RequestMapping("/ajax.do")
	public String getUser(Model model, HttpServletRequest request){
		String username = request.getParameter("username");
		System.out.println("usernmae:"+username);
		User user = userService.queryUserByUsername(username);
		model.addAttribute("user", user);
		return "fonts/ajax";
	}
	@RequestMapping(value="/login.do", 
			method=RequestMethod.POST, 
			params="user=123456")
	//@RequestParam 将请求参数赋值给形参
	public String doLogin(@RequestParam("username") String username, 
			@RequestParam("password") String password, 
			Model model){
		System.out.println("usernmae:"+username);
		User user = userService.queryUserByUsername(username);
		if(user != null){
			if(user.getPassword().equals(password)){
				model.addAttribute("msg", "登录成功！");
				return "fonts/success";
			}else {
				model.addAttribute("msg", "密码错误！");
			}
		}else {
			model.addAttribute("msg", "不存在用户！");
		}
		return "fonts/fail";
	}
	//通过@PathVariable 获取请求中的动态参数
	@RequestMapping("/test1/{testId}")
	public void test1(@PathVariable Integer testId){
		System.out.println("result:" + testId);
	}
	//将请求的头部数据映射到方法参数中
	@RequestMapping("test2")
	public void test2 (@RequestHeader("User-Agent") String userAgent,
			@RequestHeader("Agent") String agents){
		System.out.println("result:User-Agent:" + userAgent + ", Agent:" + agents);
	}
	//映射请求的cookie数据到方法的参数中
	@RequestMapping("test3")
	public void test3(@CookieValue("SESSIONID") String sessionId){
		System.out.println("result:session-id:" + sessionId);
	}
	//日志对象
	private static final Log log = LogFactory.getLog(UserControl.class);
	//上传
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(HttpServletRequest request,
			@RequestParam("description") String description,
			@RequestParam("file") MultipartFile file){
		if(file.isEmpty()){
			String path = request.getServletContext().getRealPath("/image/");
			String filename = file.getOriginalFilename();
			File filepath = new File(path, filename);
			//判断路径是否存在，不存在则创建
			if(!filepath.getParentFile().exists()){
				filepath.getParentFile().mkdirs();
			}
			//将上传文件保存到一个目标文件当中
			try {
				file.transferTo(new File(path+File.separator+filename));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "success";
		}else {
			return "error";
		}
	}
	//下载
	@RequestMapping(value="/download", method=RequestMethod.POST)
	public ResponseEntity<byte[]> download(HttpServletRequest request, 
			@RequestParam("filename") String filename,
			Model model) throws Exception{
		String path = request.getServletContext().getRealPath("/images/");
		File file = new File(path+File.separator+filename);
		HttpHeaders headers = new HttpHeaders();
		//下载显示的文件名，解决中文乱码问题
		String downloadFileName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
		//通知浏览器以attachment（下载方式）打开图片
		headers.setContentDispositionFormData("attachment", downloadFileName);
		// application.octet-stream 二进制流数据
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		//状态为 201
		return new ResponseEntity<byte[]>(org.apache.commons.io.FileUtils.readFileToByteArray(file), 
				headers, HttpStatus.CREATED);}*/
}
