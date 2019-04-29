package com.tj.makers.model;

import java.sql.Date;

public class Items {
	private int itnum;
	private String itcategory;
	private String itname;
	private String itimg;
	private Date itdate;
	private int ibnum;
	private int startRow;
	private int endRow;
	private int choose;
	private String insert;
	private int cnt;
	public Items() {
		// TODO Auto-generated constructor stub
	}

	public Items(int itnum, String itcategory, String itname, String itimg, Date itdate, int ibnum, int startRow,
			int endRow, int choose, String insert, int cnt) {
		super();
		this.itnum = itnum;
		this.itcategory = itcategory;
		this.itname = itname;
		this.itimg = itimg;
		this.itdate = itdate;
		this.ibnum = ibnum;
		this.startRow = startRow;
		this.endRow = endRow;
		this.choose = choose;
		this.insert = insert;
		this.cnt = cnt;
	}







	public int getCnt() {
		return cnt;
	}







	public void setCnt(int cnt) {
		this.cnt = cnt;
	}







	public int getChoose() {
		return choose;
	}






	public void setChoose(int choose) {
		this.choose = choose;
	}






	public String getInsert() {
		return insert;
	}






	public void setInsert(String insert) {
		this.insert = insert;
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




	public int getItnum() {
		return itnum;
	}

	public void setItnum(int itnum) {
		this.itnum = itnum;
	}

	public String getItcategory() {
		return itcategory;
	}

	public void setItcategory(String itcategory) {
		this.itcategory = itcategory;
	}

	public String getItname() {
		return itname;
	}

	public void setItname(String itname) {
		this.itname = itname;
	}

	public String getItimg() {
		return itimg;
	}

	public void setItimg(String itimg) {
		this.itimg = itimg;
	}

	public Date getItdate() {
		return itdate;
	}

	public void setItdate(Date itdate) {
		this.itdate = itdate;
	}

	public int getIbnum() {
		return ibnum;
	}

	public void setIbnum(int ibnum) {
		this.ibnum = ibnum;
	}

	@Override
	public String toString() {
		return "Items [itnum=" + itnum + ", itcategory=" + itcategory + ", itname=" + itname + ", itimg=" + itimg
				+ ", itdate=" + itdate + ", ibnum=" + ibnum + "]";
	}
	
}
