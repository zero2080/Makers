package com.tj.makers.model;

public class Prcomment {
	private int rn;
	private int prcnum;
	private String mid;
	private int pnum;
	private int prcgroup;
	private int prcstep;
	private String prcdate;
	private String prccontent;
	private int startRow;
	private int endRow;
	

	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public int getPrcnum() {
		return prcnum;
	}
	public void setPrcnum(int prcnum) {
		this.prcnum = prcnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPrcgroup() {
		return prcgroup;
	}
	public void setPrcgroup(int prcgroup) {
		this.prcgroup = prcgroup;
	}
	public int getPrcstep() {
		return prcstep;
	}
	public void setPrcstep(int prcstep) {
		this.prcstep = prcstep;
	}
	public String getPrcdate() {
		return prcdate;
	}
	public void setPrcdate(String prcdate) {
		this.prcdate = prcdate;
	}
	public String getPrccontent() {
		return prccontent;
	}
	public void setPrccontent(String prccontent) {
		this.prccontent = prccontent;
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
		return "Prcomment [rn=" + rn + ", prcnum=" + prcnum + ", mid=" + mid + ", pnum=" + pnum + ", prcgroup=" + prcgroup
				+ ", prcstep=" + prcstep + ", prcdate=" + prcdate + ", prccontent=" + prccontent + ", startRow="
				+ startRow + ", endRow=" + endRow + "]";
	}
	
	
}
