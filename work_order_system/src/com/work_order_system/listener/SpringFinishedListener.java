package com.work_order_system.listener;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.work_order_system.service.EmployeeService;

/**
 * <b>工单分派线程</b>
 * <p>
 * 描述:<br>
 * 一分钟分派一次
 * @author 威 
 * <br>2019年3月6日 上午8:13:06 
 * @see
 * @since 1.0
 */
@Component
public class SpringFinishedListener implements InitializingBean {
	@Autowired
	private EmployeeService employeeService;
	
	@Override
	public void afterPropertiesSet() throws Exception {
		new Thread(() -> {
			while (true) {
				System.out.println("进行工单分派 : START");
				employeeService.assignmentOrder();
				System.out.println("进行工单分派 : END");
				try {
					Thread.sleep(1200000); //一分钟跑一次
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}).start();
	}
}
