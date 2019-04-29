package com.tj.makers.model;

import java.sql.Date;

public class FbComment {

	private int fbcnum;
	private String mid;
	private int fbnum;
	private int fbcgroup;
	private int fbcstep;
	private Date fbcdate;
	private String fbccontent;
	private int startRow;
	private int endRow;

	public FbComment(int fbcnum, String mid, int fbnum, int fbcgroup, int fbcstep, Date fbcdate, String fbccontent,
			int startRow, int endRow) {
		super();
		this.fbcnum = fbcnum;
		this.mid = mid;
		this.fbnum = fbnum;
		this.fbcgroup = fbcgroup;
		this.fbcstep = fbcstep;
		this.fbcdate = fbcdate;
		this.fbccontent = fbccontent;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public FbComment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getFbcnum() {
		return fbcnum;
	}

	public void setFbcnum(int fbcnum) {
		this.fbcnum = fbcnum;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getFbnum() {
		return fbnum;
	}

	public void setFbnum(int fbnum) {
		this.fbnum = fbnum;
	}

	public int getFbcgroup() {
		return fbcgroup;
	}

	public void setFbcgroup(int fbcgroup) {
		this.fbcgroup = fbcgroup;
	}

	public int getFbcstep() {
		return fbcstep;
	}

	public void setFbcstep(int fbcstep) {
		this.fbcstep = fbcstep;
	}

	public Date getFbcdate() {
		return fbcdate;
	}

	public void setFbcdate(Date fbcdate) {
		this.fbcdate = fbcdate;
	}

	public String getFbccontent() {
		return fbccontent;
	}

	public void setFbccontent(String fbccontent) {
		this.fbccontent = fbccontent;
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
		return "FbComment [fbcnum=" + fbcnum + ", mid=" + mid + ", fbnum=" + fbnum + ", fbcgroup=" + fbcgroup
				+ ", fbcstep=" + fbcstep + ", fbcdate=" + fbcdate + ", fbccontent=" + fbccontent + ", startRow="
				+ startRow + ", endRow=" + endRow + "]";
	}

}
