package com.tj.makers.model;

public class Message {
	private int msnum;
	private String mid;
	private String mid2;
	private String mscontent;
	private String msdate;
	private int msfromstatus;
	private int mstostatus;
	private int startRow;
	private int endRow;
	public int getMsnum() {
		return msnum;
	}
	public void setMsnum(int msnum) {
		this.msnum = msnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMid2() {
		return mid2;
	}
	public void setMid2(String mid2) {
		this.mid2 = mid2;
	}
	public String getMscontent() {
		return mscontent;
	}
	public void setMscontent(String mscontent) {
		this.mscontent = mscontent;
	}
	public String getMsdate() {
		return msdate;
	}
	public void setMsdate(String msdate) {
		this.msdate = msdate;
	}
	public int getMsfromstatus() {
		return msfromstatus;
	}
	public void setMsfromstatus(int msfromstatus) {
		this.msfromstatus = msfromstatus;
	}
	public int getMstostatus() {
		return mstostatus;
	}
	public void setMstostatus(int mstostatus) {
		this.mstostatus = mstostatus;
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
		return "Message [msnum=" + msnum + ", mid=" + mid + ", mid2=" + mid2 + ", mscontent=" + mscontent + ", msdate="
				+ msdate + ", msfromstatus=" + msfromstatus + ", mstostatus=" + mstostatus + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}
	
		
}
