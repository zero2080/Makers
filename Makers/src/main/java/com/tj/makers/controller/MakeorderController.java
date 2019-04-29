package com.tj.makers.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.MakeOrder;
import com.tj.makers.service.MakeOrderService;
import com.tj.makers.service.Paging;

@Controller
public class MakeorderController {
	@Autowired
	MakeOrderService moService;
	
	@RequestMapping(value="getMorderAllPaging")
	public String getMorderAllPaging(Model model,MakeOrder mo,String pageNum) {
		int tot = moService.totMorderCnt();
		Paging paging = new Paging(tot,pageNum,8,4);
		mo.setStartRow(paging.getStartRow());
		mo.setEndRow(paging.getEndRow());
		model.addAttribute("mOrderList",moService.getMorderAllPaging(mo));
		model.addAttribute("paging",paging);
		return "makeOrder/makeOrderList";
	}
	
	@RequestMapping(value="moreMorder")
	@ResponseBody
	public List<MakeOrder> moreMorder(Model model, MakeOrder mo, String pageNum) {
		int tot = moService.totMorderCnt();
		Paging paging = new Paging(tot,pageNum,4,4);
		mo.setStartRow(paging.getStartRow());
		mo.setEndRow(paging.getEndRow());
		model.addAttribute("paging",paging);
		return moService.getMorderAllPaging(mo);
	}
	
	@RequestMapping(value="makeOrderView")
	public String makeOrderView(MakeOrder mo, Model model) {
		mo = moService.getMorder(mo.getMrnum());
		model.addAttribute("mo",mo);
		return "makeOrder/makeOrderView";
	}
	
	@RequestMapping(value="mOrderWriteView")
	public String mOrderWriteView() {
		return "makeOrder/mOrderWriteView";
	}
	
	@RequestMapping(value="mOrderWrite")
	public String mOrderWrite(MultipartHttpServletRequest mRequest, MakeOrder mo) {
		moService.insertOrder(mRequest,mo);
		return "redirect:getMorderAllPaging.do";
	}
	
	@RequestMapping(value="imageEditor")
	public String imageEditor() {
		return "makeOrder/imageEditor";
	}
	
	@RequestMapping(value="myMorderList")
	public String myMorderList(Model model,MakeOrder mo,String pageNum) {
	
		int tot = moService.myCntMorder(mo.getMid());
		int page = 10; 
		if(tot > 10) {
			page = tot/2;
		}
		Paging paging = new Paging(tot,pageNum,page,5);
		mo.setStartRow(paging.getStartRow());
		mo.setEndRow(paging.getEndRow());
		List<MakeOrder> temp = moService.myMorderList(mo);
		model.addAttribute("mOrderList",moService.myMorderList(mo));
		model.addAttribute("paging",paging);
		return "makeOrder/makeOrderMyList";
	}
}
