package com.work_order_system.util;

public class Util {
	public static String fillString (String string, Integer num, char fillChar){
		//num      需要多少位的数字
		String temp = "";
		string = string + "";
		int len = num - string.length();
		for(int i = 0; i < len; i++) temp += fillChar;
		return temp + "" + string;
	}
}
