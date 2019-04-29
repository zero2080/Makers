package com.tj.makers.controller;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.Admin;
import com.tj.makers.model.Member;
import com.tj.makers.service.AdminService;
import com.tj.makers.service.MemberInfoService;
import com.tj.makers.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private MemberInfoService memberInfoService;
	
	@RequestMapping(value="main")
	public String goMain() {
		return "main/main";
	}
	
	@RequestMapping(value = "memberListView")
	public String home(Model model) {
		model.addAttribute("memberList",memberService.getMemberList());
		return "admin/memberList";
	}
	
	//TODO 로그인 관련----------------------------------------------------------------------관리자 and 이용자 통합 로그인
	@RequestMapping(value="loginView")
	public String loginView(HttpSession session) {
		if(session.getAttribute("member")==null) {
			return "every/loginView";
		}else {
			return "main/main";	
		}
	}
	
	@RequestMapping(value="login")
	public String login(String id, String pw, HttpSession session, Member member, Admin admin, Model model) {
		System.out.println(id);
		System.out.println(pw);
		if(!id.contains("@")) {								//파라미터에 @체크 후 없으면 admin			
			admin = adminService.getAdmin(id);
			if(admin!=null && admin.getApw().equals(pw)) {
				System.out.println(admin.toString());
				session.setAttribute("adm", admin);
				model.addAttribute("admin",admin);
				return "main/main";
			}else {
				session.invalidate();
				model.addAttribute("admin",null);
				model.addAttribute("loginFail", 0);				
				return "main/main";
			}
		}else {
			member = memberService.getMember(id);
			if(member!=null && member.getMpw().equals(pw)) {//id로 멤버 정보 불러온 후 비번 비교
				if(member.getMstatus()==-1) {		// 자진탈퇴 회원 
					member=null;					// 넘어온 리퀘스트 멤버객체 null처리
					model.addAttribute("member",member);	//null값을 가진 멤버객체 model에 담기
					model.addAttribute("mstatus",-1);		//탈퇴회원 구분 인자 설정
					return "main/main";
				}else {										//TODO 로그인 성공
					System.out.println(member.toString());
					session.setAttribute("mem",member);
					model.addAttribute("member",member);
					return "main/main";
				}
			}else {
				session.invalidate();
				model.addAttribute("member",null);
				model.addAttribute("loginFail", 0);				
				return "main/main";
			}
		}
	}
	
	
	//TODO 회원가입 관련----------------------------------------------------------------------회원가입 페이지 
	@RequestMapping(value="joinView")
	public String joinView() {
		return "every/joinMemberView";
	}
	
	//TODO 아이디(email)유효성 검사
	@RequestMapping(value="searchId")
	public String searchId(String mid,Model model) {
		int result = memberService.searchId(mid);
		model.addAttribute("result",result);
		return "every/searchId";
	}
	
	@RequestMapping(value="midList")
	public String midList(String mid,Model model){
		System.out.println("memberService/midList : "+mid);
		if(mid==null || mid=="") {
			mid=" ";
		}
		model.addAttribute("midList",memberService.midList(mid));
		return "member/idList";
	}
	
	//TODO 이메일 발송(보안코드)
	@RequestMapping(value="mailSend")
	public String randomMailSend(Model model, HttpSession session,final String mid, String reason) {
		MimeMessagePreparator message;
		final String code = code();
		if(reason.equals("join")) {
			session.setAttribute("randomCode",code);
			System.out.println("randomCode :"+code);
			message = new MimeMessagePreparator() {
				String content = 
						"<h1> 보안코드 : " + code + "</h1>" +
						"<br>" +
						"<hr>" +
						"<h1>보안코드를 입력하고 가입을 계속 진행해 주세요.";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mid));
					mimeMessage.setSubject("Makers 회원가입 보안문자(HTML)");
					mimeMessage.setFrom(new InternetAddress("blackbear2080@gmail.com"));
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
		}else if(reason.equals("findPw")){				//TODO 비밀번호 찾기 --------------------------------------비번찾기
			Member member = new Member();
			session.setAttribute("mid",mid);
			member.setMid(mid);
			member.setMpw(code);						//임시비밀번호 6자리 생성
			int result = memberInfoService.updatetempPw(member);
			System.out.println(result==1?"임시번호로 변경완료":"임시번호로 변경실패");
			message = new MimeMessagePreparator() {
				String content ="<h1>임시비밀번호 입니다.</h1><hr><br><h1>"+code+"</h1><hr><br><h2>로그인 후 비밀번호를 꼭 변경해 주세요";
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mid));
					mimeMessage.setSubject("Makers 임시비밀번호(HTML)");
					mimeMessage.setFrom(new InternetAddress("blackbear2080@gmail.com"));
					mimeMessage.setText(content, "utf-8", "html");
				}
			};
			mailSender.send(message);
		}
		return "every/mailSend";
	}
	
	private String code() {	//보안코드 생성 메소드
		int random[]=new int[6];
		String code = "";
		for(int i=0; i<random.length; i++) {
			random[i]=(int)(Math.random()*9);
			code+=random[i];
		}
		return code;
	}
	@RequestMapping(value="joinMember")
	public String joinMember(Member member,MultipartHttpServletRequest mRequest) {
		memberService.joinMember(mRequest,member);
		return "main/main";
	}
	
	@RequestMapping(value="codeConfirm")					//보안번호 확인용 ajax페이지
	public String codeConfirm(String code, Model model) {
		model.addAttribute("code",code);
		return "every/codeConfirm";
	}
	
	@RequestMapping(value="nickNameResult")					//닉네임 유효성 검사
	public String nickNameResult(String mname,Model model) {
		int result = memberService.nickNameResult(mname);
		model.addAttribute("result",result);
		return "every/nickNameResult";
	}
	
	//TODO 회원정보 관련 --------------------------------------------정보수정 / 탈퇴 등
	
	@RequestMapping(value="findPwView")			// 비번찾기페이지
	public String findPwView() {
		return "every/findPwView";
	}
	
	@RequestMapping(value="logout")				// 로그아웃
	public String logout(HttpSession session) {
		System.out.println("들어옮:로그아웃");
		session.invalidate();
		
		return "main/main";		
	}
	
	@RequestMapping(value="myInfoView")			// 마이페이지 이동
	public String myInfoView() {
		return "member/myinfoView";
	}
	
	@RequestMapping(value="modifyView")			//수정페이지 이동
	public String modifyView() {
		return "member/modifyView";
	}
	
	@RequestMapping(value="modifyInfo")			//수정
	public String modifyInfo(Member member,MultipartHttpServletRequest mRequest,HttpSession session) {
		memberInfoService.updateMemberInfo(mRequest,member);
		session.setAttribute("mem",member);
		return "main/main";
	}

	@RequestMapping(value="quitMember")			//탈퇴
	public String quitMember(Member member) {
		memberInfoService.quitMember(member);
		return "redirect:logout.do";
	}
}