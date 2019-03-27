package com.work_order_system.filed;

public enum Priority  {
	LOW_LEVEL{
		public short getNumVal(){
			return 0;
		}
		public String toString(){
			return "低";
		}
	}, COMMON_LEVEL{
		public short getNumVal(){
			return 1;
		}
		public String toString(){
			return "一般";
		}
	}, URGENT_LEVEL{
		public short getNumVal(){
			return 2;
		}
		public String toString(){
			return "紧急";
		}
	}, VERY_URGENT_LEVEL{
		public short getNumVal(){
			return 3;
		}
		public String toString(){
			return "非常紧急";
		}
	};
	
	public short getNumVal(){
		return 0;
	}
	public String toString(){
		return "undefined";
	}
}
