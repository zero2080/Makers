package com.tj.makers.model;

public class Member {
	private String mid;
	private String mpw;
	private String maddr;
	private String mphone;
	private int mpoint;
	private String mimg;
	private String mname;
	private String maccount;
	private String mbank;
	private String macname;
	private String mdate;
	private int mstatus;
	private int startRow;
	private int endRow;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMaddr() {
		return maddr;
	}
	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public int getMpoint() {
		return mpoint;
	}
	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}
	public String getMimg() {
		return mimg;
	}
	public void setMimg(String mimg) {
		this.mimg = mimg;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMaccount() {
		return maccount;
	}
	public void setMaccount(String maccount) {
		this.maccount = maccount;
	}
	public String getMbank() {
		return mbank;
	}
	public void setMbank(String mbank) {
		this.mbank = mbank;
	}
	public String getMacname() {
		return macname;
	}
	public void setMacname(String macname) {
		this.macname = macname;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getMstatus() {
		return mstatus;
	}
	public void setMstatus(int mstatus) {
		this.mstatus = mstatus;
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
		return "Member [mid=" + mid + ", mpw=" + mpw + ", maddr=" + maddr + ", mphone=" + mphone + ", mpoint=" + mpoint
				+ ", mimg=" + mimg + ", mname=" + mname + ", maccount=" + maccount + ", mbank=" + mbank + ", macname="
				+ macname + ", mdate=" + mdate + ", mstatus=" + mstatus + ", startRow=" + startRow + ", endRow="
				+ endRow + "]";
	}
	
}
