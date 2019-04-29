package com.tj.makers.controller;


import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.QnA;
import com.tj.makers.service.Paging;
import com.tj.makers.service.QnAService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("QnA")
public class QnAController {
	private boolean chkWrite= false;
	private boolean chkReply= false;
	private boolean chkModify= false;
	@Autowired
	private QnAService qService;
	@Autowired
	private JavaMailSender mailSender;
	@RequestMapping(value="qnaList")
	public String qnaList(QnA qna,String pageNum,Model model) {
		//TODO:?��체보�?
		Paging paging ;
		System.out.println("pageNum : "+pageNum+" choose : "+qna.getChoose());
		model.addAttribute("insert", qna.getInsert());
		model.addAttribute("choose",qna.getChoose());
		
		if(qna.getChoose() == null || qna.getChoose().equals("")) {																//TODO: ?��체보�?
			System.out.println("qnaList ?�� ?��?��?�� pageNum : "+pageNum+" choose : "+qna.getChoose());
			paging = new Paging(qService.qnaCnt(), pageNum, 10, 10);
			model.addAttribute("qnaList",qService.qnaList(qna));
			qna.setStartRow(paging.getStartRow());
			qna.setEndRow(paging.getEndRow());
			model.addAttribute("paging",paging);
			
		}else if(qna.getChoose().equals("1") || qna.getChoose().equals("2")) {													//TODO: �??��
			System.out.println("qnaSearch ?�� ?��?��?�� pageNum : "+pageNum+" choose : "+qna.getChoose()+" insert : "+qna.getInsert());
			paging = new Paging(qService.qnaSearchCnt(qna), pageNum, 10, 10);
			qna.setStartRow(paging.getStartRow());
			qna.setEndRow(paging.getEndRow());
			model.addAttribute("paging",paging);
		}else if(qna.getChoose().equals("3")) {																					//TODO: ?�� �?보기
			System.out.println("qnaSearchMine ?�� ?��?��?�� pageNum : "+pageNum+" choose : "+qna.getChoose());
			paging = new Paging(qService.qnaSearchCnt(qna), pageNum, 10, 10);
			qna.setStartRow(paging.getStartRow());
			qna.setEndRow(paging.getEndRow());
			model.addAttribute("paging",paging);
		}
		model.addAttribute("qnaList",qService.qnaList(qna));
		return "qna/qnaList";
	}
	@RequestMapping(value="qnaWrite" ,method=RequestMethod.POST)
	public String qnaWrite( QnA qna,MultipartHttpServletRequest mRequest) {
		//TODO:�??���?
		if(!chkWrite) {
			System.out.println("qnaWrite ?��?��?��" +mRequest.getFileNames());
			qService.qnaWrite(mRequest, qna);
			chkWrite = true;								//?��?��?�� ?��로�?�? 방�?
		}else {
			chkWrite=false;
		}
		return "redirect:qnaList.do";
	}
	@RequestMapping(value="qnaWriteView")
	public String qnaWriteView() {
		//TODO:�??���? ?��?���? ?��?��
		return "qna/qnaWriteView";
	}
	@RequestMapping(value="qnaView")
	public String qnaView(String choose,String insert,int qnum,Model model,String pageNum,String result) {
		//TODO:?��?��보기
		System.out.println(choose+", "+insert);
		QnA qna = qService.qnaView(qnum);
		if(qna !=null) {
			qService.qnaCntUp(qnum);
		}
		model.addAttribute("insert", insert);
		model.addAttribute("choose", choose);
		model.addAttribute("list", qna);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		return "qna/qnaView";
	}
	@RequestMapping(value="qnaReplyView")
	public String qnaReplyView(int qnum,String pageNum,Model model) {
		//TODO: ?���??��기페?���??��?��
		QnA qna = qService.qnaView(qnum);
		model.addAttribute("list", qna);
		model.addAttribute("pageNum",pageNum);
		return "qna/qnaReplyView";
	}
	@RequestMapping(value="qnaReply",method=RequestMethod.POST)
	public String qnaReply(QnA qna,MultipartHttpServletRequest mRequest,String pageNum) {
		//TODO: ?���??���?
		String path;
		if(!chkReply) {
			qService.qnaReply(mRequest, qna);
			qService.qnaFin(qna.getQgroup());
			path = "redirect:mail.do?mid=gkdldkdl@gmail.com&mname=?��?��&pageNum="+pageNum; //qna.getmid,
			chkReply = true;
		}else{
			chkReply = false;
			path = "redirect:qna/qnaList.do?pageNum="+pageNum;
		}
		return path;
	}
	@RequestMapping(value="qnaModifyView")
	public String qnaModifyView(int qnum,String pageNum,Model model) {
		//TODO:�??��?�� ?��?���? ?��?��
		model.addAttribute("qnum",qnum);
		model.addAttribute("list", qService.qnaView(qnum));
		model.addAttribute("pageNum",pageNum);
		return "qna/qnaModifyView";
	}
	
	@RequestMapping(value="qnaModify" ,method=RequestMethod.POST)
	public String qnaModify(String pageNum, QnA qna,MultipartHttpServletRequest mRequest) {
		//TODO:�??��?��
		int qnum = qna.getQnum();
		int result =0;
		if(!chkModify) {
			System.out.println("qnaModify ?��?��?��");
			result = qService.qnaModify(mRequest,qna);
			chkModify = true;
		}else {
			chkModify = false;
		}
		return "redirect:qnaView.do?qnum="+qnum+"&pageNum="+pageNum+"&result="+result;
	}
	@RequestMapping(value="qnaMView")
	public String qnaMView(int qnum,String pageNum,Model model) {
		//TODO:�??���? ?��?�� ?�� �? �? ?��?��
		QnA qna = qService.qnaView(qnum);
		model.addAttribute("list", qna);
		model.addAttribute("pageNum", pageNum);
		
		return "qna/qnaView";
		
	}
	@RequestMapping(value="qnaDelete" ,method=RequestMethod.GET)
	public String qnaDelete(int qnum,int qstep) {
		//TODO:�??��?��
		System.out.println("qnaDelete ?��?��?��");
		
		int result = qService.qnaChkReply(qnum);
		if(result ==0 || qstep>=1) {
			qService.qnaDelete(qnum);
		}else {
			qService.qnaTrans(qnum);
		}
		return "redirect:qnaList.do?result="+result;
	}
	

	
	
	
	
	
	
	@RequestMapping(value="mail", method = RequestMethod.GET)
	public String mail(final String mname, final String mid,String pageNum, Model model){
		System.out.println("메일발송 ?��?��?��");
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = 
					"  <h1>"+mname+"?��?�� 질문�??�� ?���??�� ?��료되?��?��?��?��.</h1>";
				
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, 
						new InternetAddress(mid));
				mimeMessage.setFrom(new InternetAddress("hybrid190501@gmail.com "));
				mimeMessage.setSubject(mname+"?��  ?���??�� ?��료되?��?��?��?��.");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		model.addAttribute("sendResult", "?���??���?");
		return "redirect:qnaList.do?pageNum="+pageNum;
	}


	
}
