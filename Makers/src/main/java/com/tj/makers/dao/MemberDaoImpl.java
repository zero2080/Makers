package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public List<Member> getMemberList() {
		// TODO 회원리스트 
		return sessionTemplate.selectList("memberListAll");
	}
	@Override
	public Member getMember(String mid) {
		return sessionTemplate.selectOne("getMember",mid);
	}
	
	@Override
	public int searchId(String mid) {
		return sessionTemplate.selectOne("searchId",mid);
	}
	
	@Override
	public int joinMember(Member member) {
		return sessionTemplate.insert("joinMember",member);
	}
	@Override
	public int nickNameResult(String mname) {
		return sessionTemplate.selectOne("searchMname",mname);
	}
	@Override
	public int updatetempPw(Member member) {
		return sessionTemplate.update("tempPw",member);
	}
	@Override
	public int updateMemberInfo(Member member) {
		return sessionTemplate.update("updateMemberInfo",member);
	}
	@Override
	public int quitMember(Member member) {
		return sessionTemplate.update("quitMember",member);
	}
	@Override
	public List<Member> midList(String mid) {
		System.out.println("memberDao/midList : "+mid);
		return sessionTemplate.selectList("idList",mid);
	}
}