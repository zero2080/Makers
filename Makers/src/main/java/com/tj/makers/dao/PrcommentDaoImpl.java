package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Prcomment;

@Repository
public class PrcommentDaoImpl implements PrcommentDao {
	
	@Autowired
	SqlSession sessionTemplate;
	
	@Override
	public int prcTotCnt(int pnum) {
		return sessionTemplate.selectOne("prcTotCnt",pnum);
	}

	@Override
	public List<Prcomment> prcPagingList(Prcomment prcomment) {
		return sessionTemplate.selectList("prcPagingList",prcomment);
	}

	@Override
	public int prcWrite(Prcomment prcomment) {
		return sessionTemplate.insert("prcWrite",prcomment);
	}

	@Override
	public int prcReply(Prcomment prcomment) {
		return sessionTemplate.insert("prcReply",prcomment);
	}

	@Override
	public int prcDelrepl(int prcnum) {
		return sessionTemplate.delete("prcDelrepl",prcnum);
	}

	@Override
	public int prcDelOrigin(int prcgroup) {
		return sessionTemplate.delete("prcDelOrigin",prcgroup);
	}
}
