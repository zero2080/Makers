package com.tj.makers.service;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;

public class SendMail {
	private String mname;
	private String mid;
	@Autowired
	private JavaMailSender mailSender;
	public SendMail() {
		// TODO Auto-generated constructor stub
	}
	public int sendMail(final String mid, final String mname) {
		int result = 0;
			
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "<h1>"+mname+"님께서 질문하신 질문의 답변이 완료되었습니다.</h1>";
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// TODO Auto-generated method stub
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mid));;
				mimeMessage.setFrom(new InternetAddress("hybrid190501@gmail.com"));
				mimeMessage.setSubject(mname+"님께서 작성하신 QnA글의 답변이 완료되었습니다.");
				mimeMessage.setText(content,"utf-8","html");
			}
		};
		mailSender.send(message);
		result=1;
		
		return result;
	}
}
