package com.tj.makers.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.Member;

public interface MemberInfoService {
	public int updatetempPw(Member member);
	public int updateMemberInfo(MultipartHttpServletRequest mRequest, Member member);
	public int quitMember(Member member);
	
}
