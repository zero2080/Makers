package com.tj.makers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.makers.model.Message;
import com.tj.makers.service.MemberInfoService;
import com.tj.makers.service.MessageService;
import com.tj.makers.service.Paging;

@Controller
public class MessageController {
	
	@Autowired
	MemberInfoService memberInfoService;
	
	@Autowired
	MessageService msgService;
	
	//TODO --------------------------------------메세지
		@RequestMapping(value="msgListView")
		public String msgListView(String pageNum, Message msg, Model model) {
			System.out.println("msgController : "+msg.toString());
			if(msg.getMid()==null) {							//받은 쪽지 함
				System.out.println("msgController : "+msg.getMid());
				Paging paging = new Paging(msgService.msgTotCnt(msg),pageNum, 5,10);
				msg.setStartRow(paging.getStartRow());
				msg.setEndRow(paging.getEndRow());
				model.addAttribute("msgList",msgService.msgListView(msg));
				model.addAttribute("paging",paging);
			}else {
				Paging paging = new Paging(msgService.msgTotCnt(msg),pageNum, 5,10);
				msg.setStartRow(paging.getStartRow());
				msg.setEndRow(paging.getEndRow());
				model.addAttribute("msgList",msgService.msgListView(msg));
				model.addAttribute("paging",paging);
			}
				return "member/myMsgList";
		}
		
		@RequestMapping(value="msgWriteView")
		public String msgWriteView() {
			return "member/writeMsg";
		}
		
		@RequestMapping(value="msgView")
		public String getMessage(int msnum, Model model) {
			model.addAttribute("message",msgService.getMessage(msnum));
			return "member/msgDetail";
		}
		
		@RequestMapping(value="msgTView")
		public String getTMessage(int msnum, Model model) {
			model.addAttribute("message",msgService.getTMessage(msnum));
			return "member/msgDetail";
		}
		
		@RequestMapping(value="msgDelete")
		public String deleteMessage(int msnum,String mid,String mid2) {
			int result = 0;
			System.out.println("msgDelete:"+msnum+" / " + mid+" / " + mid2);
			Message message = msgService.getMessage(msnum);
			if(mid2!=null) {
				mid=mid2;
			}
			if(message.getMid().equals(mid)) {						// 보낸사람 ID 쪽지 상태값 변경
				result = msgService.fdelMsg(msnum);
				message.setMsfromstatus(2);
				
			}else if(message.getMid2().equals(mid)){				// 받은사람 ID 쪽지 상태값 변경
				result = msgService.tdelMsg(msnum);
				message.setMstostatus(2);
			}
			if(message.getMsfromstatus()==2 && 2==message.getMstostatus()) {		//최종 DB삭제
				result = msgService.deleteMessage(msnum)==1?2:1;
			}
			System.out.println(result==1?"삭제 상태 변경 완료":(result==2)?"완전 삭제성공":"삭제 실패");
			return "every/mailSend";
		}
		
		@RequestMapping(value="msgSend")
		public String sendMessage(Message message) {
			int result = msgService.sendMessage(message);
			System.out.println(result==1?"전송 성공":"전송 실패");
			return "every/mailSend";
		}
		
		@RequestMapping(value="msgsDel")
		public String sendMessage(int[] msnums,String mid,String mid2) {
			int result = 0;
			int chstat = 0;
			if(mid2!=null) {
				mid=mid2;
			}
			for(int i = 0; i< msnums.length; i++) {
				Message message = msgService.getMessage(msnums[i]);
				System.out.println(message.toString());
				if(message.getMid().equals(mid)) {						// 보낸사람 ID 쪽지 상태값 변경
					System.out.println("mid: in");
					chstat += msgService.fdelMsg(msnums[i]);
					message.setMsfromstatus(2);
				}else if(message.getMid2().equals(mid)){				// 받은사람 ID 쪽지 상태값 변경
					System.out.println("mid2: in");
					chstat += msgService.tdelMsg(msnums[i]);
					message.setMstostatus(2);
				}
				if(message.getMsfromstatus()==2 && 2==message.getMstostatus()) {		//최종 DB삭제
					result += msgService.deleteMessage(msnums[i]);
				}
			}
			System.out.println("delMsg - 상태변경  : "+chstat+"개 완료 / 완전삭제 : "+result+"개");
			return "every/mailSend";
		}
}
