# work_order_system
该文件用于记录work_order_system工单管理项目的开发，基于SpringMVC、Spring、Mybatis所搭建，功能：系统登录注销，发起方、一线、二线、复核四个环节的工单分派过程的实现，工单的创建和分派中对工单的跟踪、环节的评价、工单的检索，的实现。
****

|Author|威|
|:---:|:---
|E-mail|chenJiWey@163.com

****

# 目录  
* [引言](#引言)  
* [程序流程图](#程序流程图)  
* [ER设计](#ER设计)  
* [页面分析](#页面分析)  

    
# 引言  
系统功能：登录注销，发起方、一线、二线、复核四个环节的工单分派过程的实现，工单的创建和分派中对工单的跟踪、环节的评价、工单的检索，的实现。  
# 程序流程图  
`系统流程图`  
![][xitongliuchegntu]  
`工单分派流程图`  
![][gongdanfenpailiuchengtu]  

# ER设计  
(1)	工作人员表(ID【主键】，用户名，密码)  
(2)	工作人员信息表(ID【主键】，工位名称，联系方式，工作人员表ID【外键】，处理组表ID【外键】）  
(3)	工单信息表(ID【主键】，标题，工单描述，创建时间，优先级，工单状态，处理组ID【外键】，当前操作人【员工表ID外键】，受理人【员工表ID外键】)  
(4)	工单用户信息表(ID【主键】，用户名称，用户电话，用户邮箱）  
(5)	工单信息处理项表(ID【主键】，操作字段，环节开始时间，环节结束时间，环节建议，工单信息表ID【外键】，环节受理人）  
(6)	组信息表(ID【主键】，组名称，环节ID【外键】）  
(7)	环节信息表(ID【主键】，环节名称）  

# 页面分析  
 主页  
		初始化主页 员工姓名 组 组内工单数 已领取 已处理   
			EmployeeControl login  
		点击前往工单管理  
			
		点击创建工单  
		
		top  
			左 系统名称  
			右 用户姓名等信息  
		con  
			显示一个工单管理  
			EmployeeControl workOrderCountOfGroup  
			（上面按钮是进入工单管理，下面是工单管理的一些快捷入口）  
			该环节未领取所存在的工单量 now_emp_id=0 state = 0 group_id = 特定组  
			该用户所存在的已领取 未处理的工单量 now_emp_id = 特定id state = 0 group_id = 特定组  
				select count(id) from work_order where now_emp_id = #{id}   
				假设当前的group_id 已知员工id,  state=0	 测试数据	  
				select count(id)  
					from work_order  
					where group_id = 3 AND now_emp_id = 1 AND state = 0;  
			EmployeeControl workOrderCountOfCommed  
			该用户所存在的已处理的工单量  
				select DISTINCT count(a.id)   
					from work_order a, work_order_item b   
					where a.id = b.order_id and b.employee_id = 1;  
				（点击可查看工单详细）  
			
			创建工单  
			（权限是：发起方）  
			已完成  
			
			通讯录  
			（模态框显示--所有员工的通信方式）  
			select group_name,part_name from group  
			select * from employee where sid = #{id}  
			二：  
			select * from group  
			select a.g_name, b.name, b.phone, b.email   
				from group_ a join employee_informate b   
				on a.id = b.group_id where g_id = #{g_id}  
			以上可以封装成一个list<map>集合  
			
	工单管理页   
		工单列表分页的设计  
			
		左导航栏  
			列表 工单编号 优先级 标题 发起时间 模板类型 工单分类 发起人  
			EmployeeControl receiveWorkOrder  
			EmployeeServiceImpl receiveWorkOrder  
			未领取工单 假设当前的group_id 已知员工id=0,state=0  
			已领取工单 假设当前的group_id 已知员工id,  state=0		  		
			测试数据select a.id, a.priority, a.title, a.time, b.`name`   
					from work_order a, employee_informate b   
					where a.emp_id = b.employee_id AND a.group_id = 3 AND a.now_emp_id = 0 state = 0 ;  
			
			EmployeeControl commiteWorkOrder  
			EmployeeServiceImpl commiteWorkOrder  
			已提交在途工单 假设当前的group_id 已知员工id,state=0 （回复过的工单）  
 			已提交归档工单 假设当前的group_id 已知员工id,state=1  
				测试数据select DISTINCT a.id, a.priority, a.title, a.time, c.`name`     
					from work_order a, work_order_item b, employee_informate c     
					where b.employee_id = c.employee_id AND a.id = b.order_id AND b.order_id = 1 AND c.employee_id = 2 and a.state = 1;  
			select DISTINCT a.id, a.priority, a.title, a.time, c.`name`   
					from work_order a, work_order_item b, employee_informate c   
					where b.employee_id = c.employee_id AND a.id = b.order_id AND b.order_id = 1 AND c.employee_id = 2 and a.state = 1;  
			已提交工单  
			
		右部  
			（对应显示）  
			top   
				检索设置 receiveWorkOrder commiteWorkOrder  
				<if test="group_id!=null">AND a.group_id = #{group_id} </if>  
				<if test="current_employee_id!=null">AND a.now_emp_id = #{current_employee_id} </if>  
				<if test="state!=null">AND a.state = #{state} </if>  
				<if test="priority!=null"> AND a.priority = #{priority}</if>  
				<if test="title!=null"> AND a.title LIKE #{title}</if>	  
				<if test="id!=null"> AND a.id = #{id}</if>  
					发起时间 紧急状态 工单状态 工单编号 工单标题   
					时间的前后  
					紧急程度  
					工单状态 工单编号 工单标题  
					
			con  
				工单详细列表  
					列表 工单编号 优先级 标题 发起时间 模板类型 工单分类 发起人  
			检索  
				工单标题  
					模糊查找，可自行配置查方式   
				工单id  
					精确查找，其他都无效  

			<if test="state!=null"> AND state = #{state}</if>  
			<if test="priority!=null"> AND priority = #{priority}</if>  
			<if test="title!=null"> AND title LIKE #{title}</if>  

			select a.id, a.priority, a.title, a.time, b.`name`  
				from work_order a, employee_informate b  
				where a.emp_id = b.employee_id  
				<if test="group_id!=null">AND a.group_id = #{group_id} </if>  
				<if test="current_employee_id!=null">AND a.now_emp_id = #{current_employee_id} </if>  
				<if test="state!=null">AND a.state = #{state} </if>  
				<if test="priority!=null"> AND a.priority = #{priority}</if>  
				<if test="title!=null"> AND a.title LIKE #{title}</if>	  
				<if test="id!=null"> AND a.id = #{id}</if>  

			select DISTINCT a.id, a.priority, a.title, a.time, c.`name`, a.state   
				from work_order a, work_order_item b, employee_informate c   
				where b.employee_id = c.employee_id AND a.id = b.order_id   
				AND c.employee_id = #{current_employee_id};  


			select DISTINCT a.id, a.priority, a.title, a.time, c.`name`, a.state   
				from work_order a, work_order_item b, employee_informate c   
				where b.employee_id = c.employee_id AND a.id = b.order_id   
				<if test="c.employee_id!=null">AND c.employee_id = #{current_employee_id}</if>  
				<if test="a.state!=null">AND a.state = #{state}</if>  
				<if test="priority!=null"> AND a.priority = #{priority}</if>  
				<if test="title!=null"> AND a.title LIKE #{title}</if>	  
				<if test="id!=null"> AND a.id = #{id}</if>
				
	工单页（工单跟踪）  
	工单详细页  
		part_name 传递:{part_name, emp_id}  
		返回情况   
			空为归档工单 只能收藏  
			受理 一线处理 二线处理 复核   
		过程  
			emp_id = 0 则为未领取工单  
				签收  
			受理  
				归档 挂起 废弃 重派  
			一线处理  
				退回 分派	转他人处理  
			二线处理  
				提交 转他人处理  
			复核  
				提交 退回 转他人处理  
		如果需要回复意见则点击打开意见输入窗  
		需要的数据  
			操作 id   
		work_order：修改当前处理人为零 修改组id  
			
		使用这个id判断  
			签收  
			提交 分派 转他人处理  

		按钮创建已ok  
		剩下的是点击   
		
		点击传递数据向后台  

		top  
			提交   
				EmployeeServiceImpl dealWorkOrderOfShow  
				EmployeeControl dealWorkOrderOfShow  
			退回   
				同上  
			分派   
				同上  
			转他人处理   
				在同事之间进行转派  
				略不同  
			签收  
				EmployeeControl、EmployeeServiceImpl takeWorkOrder  
				修改now_emp_id 为当前工作人员id  
			废弃  
			挂起  
				
		con  
			顶导航栏  
				工单描述   
					EmployeeControl workOrderDetail  
					EmployeeServiceImpl workOrderDetail  
					工单详细  
					List 工单编号 标题 受理人 发起时间 事件等级 用户名 用户电话 用户email 状态  描述  
					select * from work_order a, work_order_informate b where a.id = b.order_id AND work_order.id = #{id}  
					测试sql select * from work_order a, work_order_informate b where a.id = b.order_id AND a.id = 1  
				工单分派流程图  
				工单过程  
					EmployeeControl	workOrderTrack		  	
					EmployeeServiceImpl workOrderTrack  
					查找工单跟踪信息  
						List 环节 操作 处理人 开始时间 结束时间 处理意见  
					查找处理人信息  
						二线处理/xxx组/xxx名  
						测试数据  
						select c.part_name, a.operate, d.g_name, b.`name`, a.start_time, a.end_time, a.advise   
	          from work_order_item a, employee_informate b, `group` c, group_ d   
	          where  b.employee_id = a.employee_id AND b.group_id = d.id AND d.g_id = c.id AND a.order_id = 1  
			con  
				对应显示  
	处理工单页 （模态框）   测试通过  
		窗口初始化  
			EmployeeServiceImpl dealWorkOrderOfShow  
			EmployeeControl dealWorkOrderOfShow  
		提交  
			EmployeeServiceImpl dealWorkOrderOfComm  
			EmployeeControl dealWorkOrderOfComm  
		签收  
			EmployeeServiceImpl takeWorkOrder  
			将now_emp_id改为自个的id  
		top   
			关闭键  
		con  
			选择转派位置  
				select * from group  
				select * from group_ where g_id = #{id}  
				以上可以封装成list<list>  
			
			选择对上一环节的评价  
			输入建议内容  
			确认 重置  
		
	工单创建页  
		EmployeeControl createOrder  
		EmployeeServiceImpl createOrder  
		EmployeeMapper  createWorkOrder  createWorkOrderItem updateWorkOrderItem  
		权限只有发起方   
		发起方初次受理时也是处理工单页  
		提交并跳转 EmployeeControl toMain  
		top   
			创建 取消  
		con  
			填写创建信息  
			（标题）  
	登录页  
		EmployeeControl login  
	

[gongdanfenpailiuchengtu]:工单分派流程图.png
[xitongliuchegntu]:系统流程图.png
