package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.MakeOrder;

public interface MakeOrderDao {
	public List<MakeOrder> getMorderAllPaging(MakeOrder mo);
	public MakeOrder getMorder(int mrnum);
	public int insertOrder(MakeOrder mo);
	public int cancelOrder(MakeOrder mo);
	public int totMorderCnt();
	public List<MakeOrder> myMorderList(MakeOrder mo);
	public int myCntMorder(String mid);

}
