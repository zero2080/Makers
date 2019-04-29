package com.tj.makers.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.makers.model.Prcomment;
import com.tj.makers.service.Paging;
import com.tj.makers.service.PrcommentService;

@Controller
public class PrCommentController {
	@Autowired
	PrcommentService prcService;
	
	@RequestMapping(value="prcView")
	public String listView(String pageNum, Prcomment prc, Model model) {
		/********************************************************/
		/*				     제품번호 임시 설정				    */
		/* 임시로 설정함  */  prc.setPnum(2); /* 임시로 설정함  */
		/*											 		    */
		/********************************************************/
		
		Paging paging = new Paging(prcService.prcTotCnt(prc.getPnum()),pageNum,10,10);
		prc.setStartRow(paging.getStartRow());
		prc.setEndRow(paging.getEndRow());
		model.addAttribute("prcList",prcService.prcPagingList(prc));
		model.addAttribute("paging",paging);
		return "market/prcListView";
	}
	
	@RequestMapping(value="moreComment")
	@ResponseBody
	public List<Prcomment> moreComment(String pageNum, Prcomment prc, Model model){
		System.out.println("moreComment: 잘들어옴 ㅇㅇ");
		/*******************************************************/
		/*				     제품번호 임시 설정				   */
		/* 임시로 설정함  */  prc.setPnum(2); /* 임시로 설정함 */
		/*													   */
		/*******************************************************/
		Paging paging = new Paging(prcService.prcTotCnt(prc.getPnum()),pageNum,10,10);
		prc.setStartRow(paging.getStartRow());
		prc.setEndRow(paging.getEndRow());
		model.addAttribute("paging",paging);
		return prcService.prcPagingList(prc);
	}
	
	@RequestMapping(value="prcWrite")
	@ResponseBody
	public String prcWrite(Prcomment prc, String pageNum, Model model) {
		System.out.println(prc.toString());
		return prcService.prcWrite(prc)+"";
	}
	
	@RequestMapping(value="prcReply")
	@ResponseBody
	public String prcReply(Prcomment prc, String pageNum,Model model) {
		System.out.println(prc.toString());
		return prcService.prcReply(prc)+"";
	}
	
	@RequestMapping(value="prcDel")
	@ResponseBody
	public String prcDel(Prcomment prc) {
		int result =0;
		System.out.println(prc.toString());
		if(prc.getPrcnum()==prc.getPrcgroup()) {		//원글
			result=prcService.prcDelOrigin(prc.getPrcgroup());
		}else {											//댓글
			result=prcService.prcDelrepl(prc.getPrcnum());
		}
		return result+"";
	}
}