package com.tj.makers.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.makers.model.Auction;
import com.tj.makers.model.Message;
import com.tj.makers.service.AuctionService;
import com.tj.makers.service.MessageService;

@Controller
public class AuctionController {
	@Autowired
	AuctionService acService;
	@Autowired
	MessageService msgService;
	
	@RequestMapping(value="bidList")
	public String bidList(Auction ac,Model model,HttpSession session) {
		System.out.println("mrnum / sort : "+ac.getMrnum() +" / "+ac.getSort());
		System.out.println(ac.getMbank());
		System.out.println(ac.getSort());
		model.addAttribute("mOrder",acService.getMorder(ac.getMrnum()));
		model.addAttribute("bidList",acService.bidList(ac));
		model.addAttribute("minPrice",acService.minPrice(ac));
		System.out.println(2);
		session.setAttribute("mrnum",ac.getMrnum());
		if(ac.getSort()==0) {
			System.out.println("bidList");
			return "makeOrder/bidList";
		}else {
			System.out.println("bidSort");
			return "makeOrder/bidSort";
		}
	}
	
	@RequestMapping(value="confirmBid")
	@ResponseBody
	public int confirmBid(Auction ac) {
		System.out.println(acService.degreeBid(ac)+"개 입찰 상태 비활성 완료");
		acService.confirmMOrder(ac.getMrnum());	//MakeOrder(mrstatus=1)입찰자 선정완료처리 
		return acService.confirmBid(ac);
	}
	
	@RequestMapping(value="retractBid")
	@ResponseBody
	public int retractBid(Auction ac) {
		acService.returnOrder(ac.getMrnum());
		return acService.retractBid(ac);
	}
	
	@RequestMapping(value="delBid")
	@ResponseBody
	public int delBid(Auction ac) {
		System.out.println(ac.toString());
		System.out.println(acService.retractBid(ac)+"개 입찰 상태 비활성 완료");
		acService.returnOrder(ac.getMrnum());
		acService.retractBid(ac);
		return acService.delBid(ac);
	}
	
	@RequestMapping(value="confirmOrder")
	@ResponseBody
	public int confirmOrder(Auction ac) {
		acService.confirmMOrder2(ac.getMrnum());	//MakeOrder(mrstatus=2)제작자 거래 승인 제작돌입(결재완료 확인했다침)
		return acService.confirmOrder(ac);
	}
	
	@RequestMapping(value="deliveryResult")
	@ResponseBody
	public int deliveryResult(Auction ac, Message msg) {
		System.out.println(msg.toString());
		System.out.println(ac.toString());
		msg.setMid(ac.getMid2());		//보내는 사람변경
		msg.setMid2(ac.getMid());		//받는 사람 변경
		msg.setMscontent(ac.getMrnum()+"번 제작 완료 되었습니다.<br> 배송이 시작됐습니다.<br> 송장번호 : "+msg.getMscontent());
		acService.confirmMOrder3(ac.getMrnum());	//MakeOrder(mrstatus=3)제작자 배송 시작
		int result = msgService.sendMessage(msg);
		result += acService.deliveryResult(ac);
		return result;
	}
	
	@RequestMapping(value="takeResult")
	@ResponseBody
	public int takeResult(Auction ac, Message msg) {
		msg.setMscontent("요청자가 제품을 수령하였습니다.");
		acService.confirmMOrder4(ac.getMrnum());	//MakeOrder(mrstatus=4)제작요청자 수령완료
		int result = msgService.sendMessage(msg);
		result += acService.takeResult(ac);
		return result;
	}
	
	@RequestMapping(value="insertBidingView")
	public String insertBidingView(Auction ac,Model model) {
		model.addAttribute("mOrder",acService.getMorder(ac.getMrnum()));
		return "makeOrder/insertBiddingView";
	}
	
	@RequestMapping(value="insertBiding")
	@ResponseBody
	public int insertBiding(Auction ac) {
		System.out.println(ac.toString());
		int result = acService.insertBidding(ac);
		return result;
	}
}
