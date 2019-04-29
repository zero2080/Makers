package com.tj.makers.model;

import java.sql.Date;

public class FreeBoard {

	private int fbnum;
	private String mid;
	private String fbcategory;
	private String fbtitle;
	private String fbcontent;
	private String fbfile;
	private Date fbdate;
	private int fbreadcount;
	private String fbip;
	private int startRow;
	private int endRow;

	public FreeBoard(int fbnum, String mid, String fbcategory, String fbtitle, String fbcontent, String fbfile,
			Date fbdate, int fbreadcount, String fbip, int startRow, int endRow) {
		super();
		this.fbnum = fbnum;
		this.mid = mid;
		this.fbcategory = fbcategory;
		this.fbtitle = fbtitle;
		this.fbcontent = fbcontent;
		this.fbfile = fbfile;
		this.fbdate = fbdate;
		this.fbreadcount = fbreadcount;
		this.fbip = fbip;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public FreeBoard() {
		super();
	}

	public int getFbnum() {
		return fbnum;
	}

	public void setFbnum(int fbnum) {
		this.fbnum = fbnum;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getFbcategory() {
		return fbcategory;
	}

	public void setFbcategory(String fbcategory) {
		this.fbcategory = fbcategory;
	}

	public String getFbtitle() {
		return fbtitle;
	}

	public void setFbtitle(String fbtitle) {
		this.fbtitle = fbtitle;
	}

	public String getFbcontent() {
		return fbcontent;
	}

	public void setFbcontent(String fbcontent) {
		this.fbcontent = fbcontent;
	}

	public String getFbfile() {
		return fbfile;
	}

	public void setFbfile(String fbfile) {
		this.fbfile = fbfile;
	}

	public Date getFbdate() {
		return fbdate;
	}

	public void setFbdate(Date fbdate) {
		this.fbdate = fbdate;
	}

	public int getFbreadcount() {
		return fbreadcount;
	}

	public void setFbreadcount(int fbreadcount) {
		this.fbreadcount = fbreadcount;
	}

	public String getFbip() {
		return fbip;
	}

	public void setFbip(String fbip) {
		this.fbip = fbip;
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
		return "FreeBoard [fbnum=" + fbnum + ", mid=" + mid + ", fbcategory=" + fbcategory + ", fbtitle=" + fbtitle
				+ ", fbcontent=" + fbcontent + ", fbfile=" + fbfile + ", fbdate=" + fbdate + ", fbreadcount="
				+ fbreadcount + ", fbip=" + fbip + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

}
