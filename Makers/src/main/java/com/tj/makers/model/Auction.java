package com.tj.makers.model;

public class Auction {
	private int acnum;
	private String mid;
	private String mid2;
	private int mrnum;
	private int acprice;
	private String acdate;
	private int acstatus;
	private String actimelimit;
	private String mname;
	private int mgrade;
	private String mbank;
	private String maccount;
	private String macname;
	private int sort;
	private String mrenddate;
	private String mrdate;
	private String mrtimelimit;
	public int getAcnum() {
		return acnum;
	}
	public void setAcnum(int acnum) {
		this.acnum = acnum;
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
	public int getMrnum() {
		return mrnum;
	}
	public void setMrnum(int mrnum) {
		this.mrnum = mrnum;
	}
	public int getAcprice() {
		return acprice;
	}
	public void setAcprice(int acprice) {
		this.acprice = acprice;
	}
	public String getAcdate() {
		return acdate;
	}
	public void setAcdate(String acdate) {
		this.acdate = acdate;
	}
	public int getAcstatus() {
		return acstatus;
	}
	public void setAcstatus(int acstatus) {
		this.acstatus = acstatus;
	}
	public String getActimelimit() {
		return actimelimit;
	}
	public void setActimelimit(String actimelimit) {
		this.actimelimit = actimelimit;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getMgrade() {
		return mgrade;
	}
	public void setMgrade(int mgrade) {
		this.mgrade = mgrade;
	}
	public String getMbank() {
		return mbank;
	}
	public void setMbank(String mbank) {
		this.mbank = mbank;
	}
	public String getMaccount() {
		return maccount;
	}
	public void setMaccount(String maccount) {
		this.maccount = maccount;
	}
	public String getMacname() {
		return macname;
	}
	public void setMacname(String macname) {
		this.macname = macname;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getMrenddate() {
		return mrenddate;
	}
	public void setMrenddate(String mrenddate) {
		this.mrenddate = mrenddate;
	}
	public String getMrdate() {
		return mrdate;
	}
	public void setMrdate(String mrdate) {
		this.mrdate = mrdate;
	}
	public String getMrtimelimit() {
		return mrtimelimit;
	}
	public void setMrtimelimit(String mrtimelimit) {
		this.mrtimelimit = mrtimelimit;
	}
	@Override
	public String toString() {
		return "Auction [acnum=" + acnum + ", mid=" + mid + ", mid2=" + mid2 + ", mrnum=" + mrnum + ", acprice="
				+ acprice + ", acdate=" + acdate + ", acstatus=" + acstatus + ", actimelimit=" + actimelimit
				+ ", mname=" + mname + ", mgrade=" + mgrade + ", mbank=" + mbank + ", maccount=" + maccount
				+ ", macname=" + macname + ", sort=" + sort + ", mrenddate=" + mrenddate + ", mrdate=" + mrdate
				+ ", mrtimelimit=" + mrtimelimit + "]";
	}
	
}
