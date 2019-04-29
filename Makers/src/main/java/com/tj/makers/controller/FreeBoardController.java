package com.tj.makers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.FreeBoard;
import com.tj.makers.service.FreeBoardService;
import com.tj.makers.service.Paging;

@Controller
@RequestMapping("FreeBoard")
public class FreeBoardController {

	@Autowired
	private FreeBoardService fbservice;
	

////////////////////////////////////////////////////////////////////////TODO FreeBoard

	@RequestMapping(value = "fblist")
	public String fblist(FreeBoard freeBoard, Model model, String pageNum) {
		Paging paging = new Paging(fbservice.fbCount(), pageNum, 10, 10);  // 페이징
		if(pageNum==null || pageNum.equals("")) {
			pageNum="1";
		}
		freeBoard.setStartRow(paging.getStartRow());  // 시작
		freeBoard.setEndRow(paging.getEndRow());  // 종료
		FreeBoard f = new FreeBoard();  // f생성
		f.setStartRow(1);  // f시작
		f.setEndRow(3);  // f종료
		model.addAttribute("ntlist", fbservice.ntList(f)); 
		model.addAttribute("fblist", fbservice.fbList(freeBoard));
		model.addAttribute("paging", paging);
		model.addAttribute("pageNum",pageNum);
		return "FreeBoard/fblistView";  // fblistView.jsp 로
	}
	
	
	@RequestMapping(value = "fbwriteView") // 글쓰기 폼으로 이동 
	public String fbWriteView() { 
		return "FreeBoard/fbWriteView"; 
	}


	@RequestMapping(value = "fbwrite", method=RequestMethod.POST) // 글쓰기가 완료되면 fblistView 로 이동
	public String fbWrite(MultipartHttpServletRequest mRequest, FreeBoard freeBoard) {
		fbservice.fbWrite(mRequest, freeBoard);
		return "redirect:fblist.do";
	}

	@RequestMapping(value = "fbmodifyView") // 글수정 폼으로 이동
	public String fbmodifyView(FreeBoard freeboard, String pageNum, Model model) {
		freeboard = fbservice.fbContentRead(freeboard);
		model.addAttribute("fbView", freeboard);
		model.addAttribute("pageNum", pageNum);
		return "FreeBoard/fbModifyView"; // input type hidden
	}

	@RequestMapping(value = "fbModify")
	public String fbModify(MultipartHttpServletRequest mRequest, FreeBoard freeBoard, String pageNum, Model model) {
		fbservice.fbModify(mRequest, freeBoard);
		model.addAttribute("fbnum", freeBoard.getFbnum());
		return "forward:fbMView.do?pageNum="+pageNum;
	}

	@RequestMapping(value = "fbView")
	public String fbView(String pageNum, FreeBoard freeboard, Model model) {
		if(pageNum=="" || pageNum==null) {
			pageNum="1";
		}
		model.addAttribute("fbView", fbservice.fbContentRead(freeboard));
		model.addAttribute("pageNum", pageNum);
		FreeBoard f = fbservice.fbContentRead(freeboard);
		fbservice.fbReadcountUp(f.getFbnum());
		return "FreeBoard/fbView";
	}

	@RequestMapping(value = "fbMView")
	public String fbMView(String pageNum, FreeBoard freeboard, Model model) {
		model.addAttribute("fbView", fbservice.fbContentRead(freeboard));
		model.addAttribute("pageNum", pageNum);
		/* FreeBoard f = fbservice.fbContentRead(freeboard); */
		return "FreeBoard/fbView";
	}
	
	@RequestMapping(value = "fbDelete")
	public String fbDelete(FreeBoard freeBoard) {
		fbservice.fbDelete(freeBoard);
		return "redirect:fblist.do";
	}



}

