package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.Auction;
import com.tj.makers.model.MakeOrder;

public interface AuctionDao {
	public int totBid(int mrnum);
	public List<Auction> bidList(Auction ac);
	public int insertBidding(Auction ac);
	public int modifyBid(Auction ac);
	public int delBid(Auction ac);
	public int confirmBid(Auction ac);
	public int retractBid(Auction ac);
	public int confirmOrder(Auction ac);
	public int refusalOrder(Auction ac);
	public int deliveryResult(Auction ac);
	public int takeResult(Auction ac);
	public int degreeBid(Auction ac);
	public int minPrice(Auction ac);
	public MakeOrder getMorder(int mrnum);
	public int confirmMOrder(int mrnum);
	public int confirmMOrder2(int mrnum);
	public int returnOrder(int mrnum);
	public int confirmMOrder3(int mrnum);
	public int confirmMOrder4(int mrnum);
	
}
