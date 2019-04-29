package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.Porder;

public interface PorderDao {
	public List<Porder> porderList(Porder porder);
	
	public int porderInsert(Porder porder);
	public int porderWrite(Porder porder);
	public int porderOver(Porder porder);
	public int porderListCnt(Porder porder);
	public Porder porderSelect(Porder porder);
	public Porder porderView(int ornum);
}
