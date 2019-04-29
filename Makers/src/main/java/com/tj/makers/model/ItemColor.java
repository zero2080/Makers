package com.tj.makers.model;

public class ItemColor {
		private int itcnum;
		private int ibnum;
		private String itcolor;

		
		
		public ItemColor() {
			super();
			// TODO Auto-generated constructor stub
		}
		
		public ItemColor(int ibnum, String itcolor) {
			super();
		
			this.ibnum = ibnum;
			this.itcolor = itcolor;
		}

		public int getItcnum() {
			return itcnum;
		}
		public void setItcnum(int itcnum) {
			this.itcnum = itcnum;
		}
		public int getIbnum() {
			return ibnum;
		}
		public void setIbnum(int ibnum) {
			this.ibnum = ibnum;
		}
		public String getItcolor() {
			return itcolor;
		}
		public void setItcolor(String itcolor) {
			this.itcolor = itcolor;
		}
		@Override
		public String toString() {
			return "ItemColor [itcnum=" + itcnum + ", ibnum=" + ibnum + ", itcolor=" + itcolor + "]";
		}
	  
}
