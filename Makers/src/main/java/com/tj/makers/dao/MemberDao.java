package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.Member;

public interface MemberDao {
	public List<Member> getMemberList();
	public Member getMember(String mid);
	public int searchId(String mid);
	public int joinMember(Member member);
	public int nickNameResult(String mname);
	public int updatetempPw(Member member);
	public int updateMemberInfo(Member member);
	public int quitMember(Member member);
	public List<Member> midList(String mid);
}