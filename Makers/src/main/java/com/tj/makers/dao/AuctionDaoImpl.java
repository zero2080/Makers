package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Auction;
import com.tj.makers.model.MakeOrder;
@Repository
public class AuctionDaoImpl implements AuctionDao {
	@Autowired
	SqlSession sessionTemplate;
	
	@Override
	public int totBid(int mrnum) {
		return sessionTemplate.selectOne("totBid",mrnum);
	}
	@Override
	public List<Auction> bidList(Auction ac) {
		return sessionTemplate.selectList("bidList",ac);
	}

	@Override
	public int insertBidding(Auction ac) {
		return sessionTemplate.insert("insertBidding",ac);
	}

	@Override
	public int modifyBid(Auction ac) {
		return sessionTemplate.update("modifyBid",ac);
	}

	@Override
	public int delBid(Auction ac) {
		return sessionTemplate.delete("delBid",ac);
	}

	@Override
	public int confirmBid(Auction ac) {
		return sessionTemplate.update("confirmBid",ac);
	}

	@Override
	public int retractBid(Auction ac) {
		System.out.println("retractBidDao:in");
		return sessionTemplate.update("retractBid",ac);
	}

	@Override
	public int confirmOrder(Auction ac) {
		return sessionTemplate.update("confirmOrder",ac);
	}

	@Override
	public int refusalOrder(Auction ac) {
		return sessionTemplate.update("refusalOrder",ac);
	}

	@Override
	public int deliveryResult(Auction ac) {
		return sessionTemplate.update("deliveryResult",ac);
	}

	@Override
	public int takeResult(Auction ac) {
		return sessionTemplate.update("takeResult",ac);
	}
	
	@Override
	public int degreeBid(Auction ac) {
		return sessionTemplate.update("degreeBid",ac);
	}
	
	@Override
	public int minPrice(Auction ac) {
		return sessionTemplate.selectOne("minPrice",ac);
	}
	
	@Override
	public MakeOrder getMorder(int mrnum) {
		return sessionTemplate.selectOne("getMorder",mrnum);
	}
	
	@Override
	public int confirmMOrder(int mrnum) {
		return sessionTemplate.update("confirmMOrder",mrnum);
	}
	
	@Override
	public int confirmMOrder2(int mrnum) {
		return sessionTemplate.update("confirmMOrder2",mrnum);
	}
	
	@Override
	public int confirmMOrder3(int mrnum) {
		return sessionTemplate.update("confirmMOrder3",mrnum);
	}
	
	@Override
	public int confirmMOrder4(int mrnum) {
		return sessionTemplate.update("confirmMOrder4",mrnum);
	}
	
	@Override
	public int returnOrder(int mrnum) {
		return sessionTemplate.update("returnOrder",mrnum);
	}
}
