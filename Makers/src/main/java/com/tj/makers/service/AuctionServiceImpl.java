package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.AuctionDao;
import com.tj.makers.model.Auction;
import com.tj.makers.model.MakeOrder;

@Service
public class AuctionServiceImpl implements AuctionService {
	@Autowired
	AuctionDao acDao;
	
	@Override
	public int totBid(int mrnum) {
		return acDao.totBid(mrnum);
	}

	@Override
	public List<Auction> bidList(Auction ac) {
		return acDao.bidList(ac);
	}

	@Override
	public int insertBidding(Auction ac) {
		return acDao.insertBidding(ac);
	}

	@Override
	public int modifyBid(Auction ac) {
		return acDao.modifyBid(ac);
	}

	@Override
	public int delBid(Auction ac) {
		return acDao.delBid(ac);
	}

	@Override
	public int confirmBid(Auction ac) {
		return acDao.confirmBid(ac);
	}

	@Override
	public int retractBid(Auction ac) {
		System.out.println("retractBid:in");
		return acDao.retractBid(ac);
	}

	@Override
	public int confirmOrder(Auction ac) {
		return acDao.confirmOrder(ac);
	}

	@Override
	public int refusalOrder(Auction ac) {
		return acDao.refusalOrder(ac);
	}

	@Override
	public int deliveryResult(Auction ac) {
		return acDao.deliveryResult(ac);
	}

	@Override
	public int takeResult(Auction ac) {
		return acDao.takeResult(ac);
	}
	
	@Override
	public int degreeBid(Auction ac) {
		return acDao.degreeBid(ac);
	}
	
	@Override
	public int minPrice(Auction ac) {
		return acDao.minPrice(ac);
	}
	
	@Override
	public MakeOrder getMorder(int mrnum) {
		return acDao.getMorder(mrnum);
	}
	
	@Override
	public int confirmMOrder(int mrnum) {
		return acDao.confirmMOrder(mrnum);
	}
	@Override
	public int confirmMOrder2(int mrnum) {
		return acDao.confirmMOrder2(mrnum);
	}
	
	@Override
	public int confirmMOrder3(int mrnum) {
		return acDao.confirmMOrder3(mrnum);
	}
	
	@Override
	public int confirmMOrder4(int mrnum) {
		return acDao.confirmMOrder4(mrnum);
	}
	
	@Override
	public int returnOrder(int mrnum) {
		return acDao.returnOrder(mrnum);
	}
}
