package com.work_order_system.util;

import java.util.HashMap;
import java.util.Map;

public class FieldData {
	public static Map<Short, String> OparateField;
	public static Map<Short, String> StateField;
	public static Map<Short, String> PriorityField;
	static {
		OparateField = new HashMap<Short, String>();
		OparateField.put((short) 1, "分派");
		OparateField.put((short) 2, "转他人处理");
		OparateField.put((short) 3, "提交");
		OparateField.put((short) 4, "复核");
		OparateField.put((short) 5, "退回");
		OparateField.put((short) 6, "重派");
		OparateField.put((short) 7, "归档");
		OparateField.put((short) 8, "签收");
		OparateField.put((short) 9, "创建");
		StateField = new HashMap<Short, String>();
		StateField.put((short) 1, "在途");
		StateField.put((short) 2, "归档");
		PriorityField = new HashMap<Short, String>();
		PriorityField.put((short) 1, "低");
		PriorityField.put((short) 2, "一般");
		PriorityField.put((short) 3, "紧急");
		PriorityField.put((short) 4, "非常紧急");
	}
}
