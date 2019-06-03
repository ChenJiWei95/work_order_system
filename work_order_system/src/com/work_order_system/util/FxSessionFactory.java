package com.work_order_system.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * <b>获取Mybatis session对象工具类</b>
 * <p>
 * 描述:<br>
 *  SqlSessionFactory提供静态方法
 * @author 威 
 * <br>2018年5月19日 下午10:43:13 
 * @see	
 * @since 1.0
 */
public class FxSessionFactory {
	private static SqlSessionFactory sf;
	static {
		String configre = "config/mybatis-config.xml";
		InputStream is = null;
		try {
			is = Resources.getResourceAsStream(configre);
		} catch (IOException e) {
			e.printStackTrace();
		}
		SqlSessionFactoryBuilder sfb = new SqlSessionFactoryBuilder();
		sf = sfb.build(is);
	}
	public static SqlSession openSesion(){
		return sf.openSession();
	}
}
