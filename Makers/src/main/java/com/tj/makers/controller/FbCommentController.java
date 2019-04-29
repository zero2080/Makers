package com.tj.makers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tj.makers.model.FbComment;
import com.tj.makers.service.FbCommentService;
import com.tj.makers.service.Paging;

@Controller
@RequestMapping("FbComment")
public class FbCommentController {

	@Autowired
	private FbCommentService fbcservice;

////////////////////////////////////////////////////////////////////////TODO FbComment

	@RequestMapping(value = "fbcList") // 댓글 리스트
	public String fbcList( FbComment fbcomment, Model model, String cpageNum) {
		Paging cpaging = new Paging(fbcservice.fbcCount(fbcomment.getFbnum()), cpageNum, 20, 10);  // 페이징
		fbcomment.setStartRow(cpaging.getStartRow());  // 시작
		fbcomment.setEndRow(cpaging.getEndRow());  // 종료
		model.addAttribute("fbcList", fbcservice.fbcList(fbcomment));
		model.addAttribute("cpaging", cpaging);
		/* System.out.println(fbcomment.toString()); */
		return "FbComment/fbclistView";  // fbclistView.jsp로
	}

	/*
	 * @RequestMapping(value = "fbcWriteView") public String fbcWriteView() { return
	 * "FbComment/fbcWriteView"; }
	 */

	@RequestMapping(value = "fbcWrite")
	@ResponseBody
	public int fbcWrite(FbComment fbComment, String cpageNum, Model model) {
		System.out.println(fbComment.toString());
		int result =fbcservice.fbcWrite(fbComment);
		model.addAttribute("fbcWrite", fbComment);
		return result;
	}

	@RequestMapping(value = "fbcDelete")
	public String fbcDelete(FbComment fbcomment) {
		fbcservice.fbcDelete(fbcomment);
		return "redirect:fbcList.do";
	}

}
