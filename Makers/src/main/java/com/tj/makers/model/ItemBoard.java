package com.tj.makers.model;

import java.sql.Date;

public class ItemBoard {
	
	private int ibnum;
	private String ibcategory;
	private String ibtitle;
	private String ibcontent;
	private String ibimg;
	private Date ibdate;
	private int ibstate;
	private String mid;
	private int startRow;
	private int endRow;
	private int cnt;
	private String insert;
	private int choose;
	public ItemBoard() {
		// TODO Auto-generated constructor stub
	}
		
	
	


	public ItemBoard(int ibnum, String ibcategory, String ibtitle, String ibcontent, String ibimg, Date ibdate,
			int ibstate, String mid, int startRow, int endRow, int cnt, String insert, int choose) {
		super();
		this.ibnum = ibnum;
		this.ibcategory = ibcategory;
		this.ibtitle = ibtitle;
		this.ibcontent = ibcontent;
		this.ibimg = ibimg;
		this.ibdate = ibdate;
		this.ibstate = ibstate;
		this.mid = mid;
		this.startRow = startRow;
		this.endRow = endRow;
		this.cnt = cnt;
		this.insert = insert;
		this.choose = choose;
	}





	public String getInsert() {
		return insert;
	}





	public void setInsert(String insert) {
		this.insert = insert;
	}





	public int getChoose() {
		return choose;
	}





	public void setChoose(int choose) {
		this.choose = choose;
	}





	public int getCnt() {
		return cnt;
	}



	public void setCnt(int cnt) {
		this.cnt = cnt;
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

	public int getIbnum() {
		return ibnum;
	}
	public void setIbnum(int ibnum) {
		this.ibnum = ibnum;
	}
	public String getIbcategory() {
		return ibcategory;
	}
	public void setIbcategory(String ibcategory) {
		this.ibcategory = ibcategory;
	}
	public String getIbtitle() {
		return ibtitle;
	}
	public void setIbtitle(String ibtitle) {
		this.ibtitle = ibtitle;
	}
	public String getIbcontent() {
		return ibcontent;
	}
	public void setIbcontent(String ibcontent) {
		this.ibcontent = ibcontent;
	}
	public String getIbimg() {
		return ibimg;
	}
	public void setIbimg(String ibimg) {
		this.ibimg = ibimg;
	}
	public Date getIbdate() {
		return ibdate;
	}
	public void setIbdate(Date ibdate) {
		this.ibdate = ibdate;
	}
	public int getIbstate() {
		return ibstate;
	}
	public void setIbstate(int ibstate) {
		this.ibstate = ibstate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	@Override
	public String toString() {
		return "ItemBoard [ibnum=" + ibnum + ", ibcategory=" + ibcategory + ", ibtitle=" + ibtitle + ", ibcontent="
				+ ibcontent + ", ibimg=" + ibimg + ", ibdate=" + ibdate + ", ibstate=" + ibstate + ", mid=" + mid + "]";
	}
	
	
}
