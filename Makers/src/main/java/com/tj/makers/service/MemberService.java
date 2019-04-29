package com.tj.makers.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.Member;

public interface MemberService {
	public List<Member> getMemberList();
	public Member getMember(String mid);
	public int searchId(String mid);
	public int joinMember(MultipartHttpServletRequest mRequest, Member member);
	public int nickNameResult(String mname);
	public List<Member> midList(String mid);
}
