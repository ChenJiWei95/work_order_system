package com.work_order_system.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class DateUtil {
	public static java.sql.Timestamp parseDateTiemOfString(String dateString){
		if(dateString == null || "".equals(dateString))
			return null;
		DateFormat dateFormat; 
		dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss", Locale.ENGLISH);//设定格式 
		//dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss", Locale.ENGLISH); 
		dateFormat.setLenient(false); 
		java.util.Date timeDate = null;
		try {
			timeDate = dateFormat.parse(dateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}//util类型 
		java.sql.Timestamp dateTime = new java.sql.Timestamp(timeDate.getTime());
		return dateTime;
	}
	public static String parseStringOfDateTime(java.sql.Timestamp date){
		if(date == null) return null;
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		return sdf.format(date);
	}
}
