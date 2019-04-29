package com.tj.makers.model;

public class Admin {
	private String aid;
	private String apw;
	
	public void setAid(String aid) {
		this.aid=aid;
	}
	public String getAid() {
		return aid;
	}
	
	public void setApw(String apw) {
		this.apw=apw;
	}
	public String getApw() {
		return apw;
	}
	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", apw=" + apw + "]";
	}
	
	
}
