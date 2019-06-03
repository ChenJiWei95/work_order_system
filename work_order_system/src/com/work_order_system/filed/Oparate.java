package com.work_order_system.filed;

public enum Oparate {
	ACCEPT{
		public short getNumVal(){
			return 0;
		}
		public String toString(){
			return "受理";
		}
	}, ASSIGN{
		public short getNumVal(){
			return 1;
		}
		public String toString(){
			return "分派";
		}
	}, TRANSFER{
		public short getNumVal(){
			return 2;
		}
		public String toString(){
			return "转他人处理";
		}
	}, COMMITE{
		public short getNumVal(){
			return 3;
		}
		public String toString(){
			return "提交";
		}
	}, CHECK{
		public short getNumVal(){
			return 4;
		}
		public String toString(){
			return "复核";
		}
	}, RETURN{
		public short getNumVal(){
			return 5;
		}
		public String toString(){
			return "退回";
		}
	}, UNSOLVED{
		public short getNumVal(){
			return 6;
		}
		public String toString(){
			return "未解决";
		}
	};
	public short getNumVal(){
		return 0;
	}
	public String toString(){
		return "";
	}
}
