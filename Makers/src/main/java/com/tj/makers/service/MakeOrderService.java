package com.tj.makers.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.MakeOrder;

public interface MakeOrderService {
	public List<MakeOrder> getMorderAllPaging(MakeOrder mo);
	public MakeOrder getMorder(int mrnum);
	public int insertOrder(MultipartHttpServletRequest mRequest,MakeOrder mo);
	public int cancelOrder(MakeOrder mo);
	public int totMorderCnt();
	public List<MakeOrder> myMorderList(MakeOrder mo);
	public int myCntMorder(String mid);

}
