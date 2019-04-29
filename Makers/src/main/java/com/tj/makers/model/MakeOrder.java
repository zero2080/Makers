package com.tj.makers.model;

public class MakeOrder {
	private int mrnum;
	private String mrtitle;
	private String mid;
	private int mrcount;
	private String mrdate;
	private String mrenddate;
	private String mrtimelimit;
	private String mrimg;
	private String mrcontent;
	private int mrstatus;
	private int startRow;
	private int endRow;
	
	public int getMrnum() {
		return mrnum;
	}
	public void setMrnum(int mrnum) {
		this.mrnum = mrnum;
	}
	public String getMrtitle() {
		return mrtitle;
	}
	public void setMrtitle(String mrtitle) {
		this.mrtitle = mrtitle;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getMrcount() {
		return mrcount;
	}
	public void setMrcount(int mrcount) {
		this.mrcount = mrcount;
	}
	public String getMrdate() {
		return mrdate;
	}
	public void setMrdate(String mrdate) {
		this.mrdate = mrdate;
	}
	public String getMrenddate() {
		return mrenddate;
	}
	public void setMrenddate(String mrenddate) {
		this.mrenddate = mrenddate;
	}
	public String getMrtimelimit() {
		return mrtimelimit;
	}
	public void setMrtimelimit(String mrtimelimit) {
		this.mrtimelimit = mrtimelimit;
	}
	public String getMrimg() {
		return mrimg;
	}
	public void setMrimg(String mrimg) {
		this.mrimg = mrimg;
	}
	public String getMrcontent() {
		return mrcontent;
	}
	public void setMrcontent(String mrcontent) {
		this.mrcontent = mrcontent;
	}
	public int getMrstatus() {
		return mrstatus;
	}
	public void setMrstatus(int mrstatus) {
		this.mrstatus = mrstatus;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow=startRow;
	}
	public int getEndtRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow=endRow;
	}
	
	@Override
	public String toString() {
		return "MakeOrder [mrnum=" + mrnum + ", mrtitle=" + mrtitle + ", mid=" + mid + ", mrcount=" + mrcount
				+ ", mrdate=" + mrdate + ", mrenddate=" + mrenddate + ", mrtimelimit=" + mrtimelimit + ", mrimg="
				+ mrimg + ", mrcontent=" + mrcontent + ", mrstatus=" + mrstatus + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
