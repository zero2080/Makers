package com.tj.makers.model;

import java.sql.Date;

public class Porder {
	private int ornum;
	private String orname;
	private String oraddr;
	private String orpost;
	private String orphone;
	private String mid;
	private Date ordate;
	private int startRow;
	private int endRow;
	
	public Porder() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Porder(int ornum, String orname, String oraddr, String orpost, String orphone, String mid, Date ordate,
			int startRow, int endRow) {
		super();
		this.ornum = ornum;
		this.orname = orname;
		this.oraddr = oraddr;
		this.orpost = orpost;
		this.orphone = orphone;
		this.mid = mid;
		this.ordate = ordate;
		this.startRow = startRow;
		this.endRow = endRow;
	}



	public String getOrphone() {
		return orphone;
	}



	public void setOrphone(String orphone) {
		this.orphone = orphone;
	}



	public int getOrnum() {
		return ornum;
	}
	public void setOrnum(int ornum) {
		this.ornum = ornum;
	}
	public String getOrname() {
		return orname;
	}
	public void setOrname(String orname) {
		this.orname = orname;
	}
	public String getOraddr() {
		return oraddr;
	}
	public void setOraddr(String oraddr) {
		this.oraddr = oraddr;
	}
	public String getOrpost() {
		return orpost;
	}
	public void setOrpost(String orpost) {
		this.orpost = orpost;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getOrdate() {
		return ordate;
	}
	public void setOrdate(Date ordate) {
		this.ordate = ordate;
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
		return "Porder [ornum=" + ornum + ", orname=" + orname + ", oraddr=" + oraddr + ", orpost=" + orpost
				+ ", orphone=" + orphone + ", mid=" + mid + ", ordate=" + ordate + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}
	
	
	
}

