package com.tj.makers.model;

import java.sql.Date;

public class QnA {
	private int qnum;
	private String qtitle;
	private String qcontent;
	private int qgroup;
	private int qstep;
	private String qfile;
	private Date qdate;
	private int qreadcount;
	private String qip;
	private String mid;
	private String aid;
	private int qstat;
	private int startRow;
	private int endRow;
	private String insert;
	private String choose;
	public QnA() {
		// TODO Auto-generated constructor stub
	}
	
	public QnA(int qnum, String qtitle, String qcontent, int qgroup, int qstep, String qfile, Date qdate,
			int qreadcount, String qip, String mid, String aid, int qstat, int startRow, int endRow, String insert,
			String choose) {
		super();
		this.qnum = qnum;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qgroup = qgroup;
		this.qstep = qstep;
		this.qfile = qfile;
		this.qdate = qdate;
		this.qreadcount = qreadcount;
		this.qip = qip;
		this.mid = mid;
		this.aid = aid;
		this.qstat = qstat;
		this.startRow = startRow;
		this.endRow = endRow;
		this.insert = insert;
		this.choose = choose;
	}

	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public int getQgroup() {
		return qgroup;
	}
	public void setQgroup(int qgroup) {
		this.qgroup = qgroup;
	}
	public int getQstep() {
		return qstep;
	}
	public void setQstep(int qstep) {
		this.qstep = qstep;
	}
	public String getQfile() {
		return qfile;
	}
	public void setQfile(String qfile) {
		this.qfile = qfile;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public int getQreadcount() {
		return qreadcount;
	}
	public void setQreadcount(int qreadcount) {
		this.qreadcount = qreadcount;
	}
	public String getQip() {
		return qip;
	}
	public void setQip(String qip) {
		this.qip = qip;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public int getQstat() {
		return qstat;
	}
	public void setQstat(int qstat) {
		this.qstat = qstat;
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

	public String getInsert() {
		return insert;
	}

	public void setInsert(String insert) {
		this.insert = insert;
	}

	public String getChoose() {
		return choose;
	}

	public void setChoose(String choose) {
		this.choose = choose;
	}

	@Override
	public String toString() {
		return "QnA [qnum=" + qnum + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qgroup=" + qgroup + ", qstep="
				+ qstep + ", qfile=" + qfile + ", qdate=" + qdate + ", qreadcount=" + qreadcount + ", qip=" + qip
				+ ", mid=" + mid + ", aid=" + aid + ", qstat=" + qstat + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", insert=" + insert + ", choose=" + choose + "]";
	}

		
	
	
}
