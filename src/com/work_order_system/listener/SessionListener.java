package com.work_order_system.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * <b>用于对session的监听</b>
 * <p>
 * 描述:<br>
 * 
 * @author 威 
 * <br>2019年3月6日 下午5:18:27 
 * @see
 * @since 1.0
 */
public class SessionListener implements HttpSessionListener {
	public void sessionCreated(HttpSessionEvent se) {  
	     System.out.println("session 被创建------------------");
	}
	/* Session失效事件 */  
	public void sessionDestroyed(HttpSessionEvent se) {  
		 System.out.println("session 失效-------------------");
	}  
}	
