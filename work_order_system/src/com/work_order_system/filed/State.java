package com.work_order_system.filed;

public enum State {
	COMPLETE{
		public short getNumVal(){
			return 0;
		}
		public String toString(){
			return "归档";
		}
	}, ON_THE_WAY{
		public short getNumVal(){
			return 1;
		}
		public String toString(){
			return "在途";
		}
	};
	public short getNumVal(){
		return 0;
	}
	public String toString(){
		return "undefined";
	}
}
