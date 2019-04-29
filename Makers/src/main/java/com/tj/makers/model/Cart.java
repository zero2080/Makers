package com.tj.makers.model;

public class Cart {
	private int ctnum;
	private int ctcount;
	private String ptitle;
	private String mrtitle;
	private String mrimg;
	private int startRow;
	private int endRow;
	private String mid;
	private int pnum;
	private int pcount;
	private int ornum;
	private int ctstate;
	private int price;
	public Cart() {
		// TODO Auto-generated constructor stub
	}	
	
	

	public Cart(int ctnum, int ctcount, String ptitle, String mrtitle, String mrimg, int startRow, int endRow,
			String mid, int pnum, int pcount, int ornum, int ctstate, int price) {
		super();
		this.ctnum = ctnum;
		this.ctcount = ctcount;
		this.ptitle = ptitle;
		this.mrtitle = mrtitle;
		this.mrimg = mrimg;
		this.startRow = startRow;
		this.endRow = endRow;
		this.mid = mid;
		this.pnum = pnum;
		this.pcount = pcount;
		this.ornum = ornum;
		this.ctstate = ctstate;
		this.price = price;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getOrnum() {
		return ornum;
	}


	public void setOrnum(int ornum) {
		this.ornum = ornum;
	}



	public int getCtstate() {
		return ctstate;
	}

	public void setCtstate(int ctstate) {
		this.ctstate = ctstate;
	}


	public int getPcount() {
		return pcount;
	}


	public void setPcount(int pcount) {
		this.pcount = pcount;
	}


	public int getPnum() {
		return pnum;
	}


	public void setPnum(int pnum) {
		this.pnum = pnum;
	}


	public int getCtnum() {
		return ctnum;
	}

	public void setCtnum(int ctnum) {
		this.ctnum = ctnum;
	}

	public int getCtcount() {
		return ctcount;
	}

	public void setCtcount(int ctcount) {
		this.ctcount = ctcount;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getMrtitle() {
		return mrtitle;
	}

	public void setMrtitle(String mrtitle) {
		this.mrtitle = mrtitle;
	}

	public String getMrimg() {
		return mrimg;
	}

	public void setMrimg(String mrimg) {
		this.mrimg = mrimg;
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

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}








	@Override
	public String toString() {
		return "Cart [ctnum=" + ctnum + ", ctcount=" + ctcount + ", ptitle=" + ptitle + ", mrtitle=" + mrtitle
				+ ", mrimg=" + mrimg + ", startRow=" + startRow + ", endRow=" + endRow + ", mid=" + mid + ", pnum="
				+ pnum + ", pcount=" + pcount + ", ornum=" + ornum + ", ctstate=" + ctstate + "]";
	}

	
}
