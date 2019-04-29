package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Porder;
@Repository

public class PorderDaoImpl implements PorderDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Porder> porderList(Porder porder) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("porderList",porder);
	}

	
	@Override
	public int porderInsert(Porder porder) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("porderInsert",porder);
	}

	@Override
	public int porderWrite(Porder porder) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("porderWrite",porder);
	}

	@Override
	public int porderOver(Porder porder) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("porderOver",porder);
	}

	@Override
	public int porderListCnt(Porder porder) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("porderListCnt",porder);
	}

	@Override
	public Porder porderSelect(Porder porder) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("porderSelect",porder);
	}


	@Override
	public Porder porderView(int ornum) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("porderView",ornum);
	}
	
}
