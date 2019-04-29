package com.tj.makers.model;

public class Product {
	
		private int pnum;
		private String ptitle;
		private String pcategory;
		private String pcontent;
		private int pcount;
		private	int preadcount;
		private String mid;
		private int mrnum;
		private int startRow;
		private int endRow;
		private int price;
		private int pstate;
		
		
		public Product(int pnum, String ptitle, String pcategory, String pcontent, int pcount, int preadcount,
				String mid, int mrnum, int startRow, int endRow, int price, int pstate) {
			super();
			this.pnum = pnum;
			this.ptitle = ptitle;
			this.pcategory = pcategory;
			this.pcontent = pcontent;
			this.pcount = pcount;
			this.preadcount = preadcount;
			this.mid = mid;
			this.mrnum = mrnum;
			this.startRow = startRow;
			this.endRow = endRow;
			this.price = price;
			this.pstate = pstate;
		}





		public Product() {
			// TODO Auto-generated constructor stub
		}
		

		


		public int getPstate() {
			return pstate;
		}





		public void setPstate(int pstate) {
			this.pstate = pstate;
		}





		public int getPrice() {
			return price;
		}




		public void setPrice(int price) {
			this.price = price;
		}




		public int getPnum() {
			return pnum;
		}
		public void setPnum(int pnum) {
			this.pnum = pnum;
		}
		public String getPtitle() {
			return ptitle;
		}
		public void setPtitle(String ptitle) {
			this.ptitle = ptitle;
		}
		public String getPcategory() {
			return pcategory;
		}
		public void setPcategory(String pcategory) {
			this.pcategory = pcategory;
		}
		public String getPcontent() {
			return pcontent;
		}
		public void setPcontent(String pcontent) {
			this.pcontent = pcontent;
		}
		public int getPcount() {
			return pcount;
		}
		public void setPcount(int pcount) {
			this.pcount = pcount;
		}
		public int getPreadcount() {
			return preadcount;
		}
		public void setPreadcount(int preadcount) {
			this.preadcount = preadcount;
		}
		public String getMid() {
			return mid;
		}
		public void setMid(String mid) {
			this.mid = mid;
		}
		public int getMrnum() {
			return mrnum;
		}
		public void setMrnum(int mrnum) {
			this.mrnum = mrnum;
		}
		public int getStartRow() {
			return startRow;
		}
		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}
		public int getEndRow() {
			return endRow;
		}
		public void setEndRow(int endRow) {
			this.endRow = endRow;
		}




		@Override
		public String toString() {
			return "Product [pnum=" + pnum + ", ptitle=" + ptitle + ", pcategory=" + pcategory + ", pcontent="
					+ pcontent + ", pcount=" + pcount + ", preadcount=" + preadcount + ", mid=" + mid + ", mrnum="
					+ mrnum + ", startRow=" + startRow + ", endRow=" + endRow + ", price=" + price + "]";
		}
		
		
		

}
