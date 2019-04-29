package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.MakeOrder;

@Repository
public class MakeOrderDaoImpl implements MakeOrderDao {
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public List<MakeOrder> getMorderAllPaging(MakeOrder mo) {
		return sessionTemplate.selectList("getMorderAllPaging",mo);
	}

	@Override
	public MakeOrder getMorder(int mrnum) {
		return sessionTemplate.selectOne("getMorder",mrnum);
	}

	@Override
	public int insertOrder(MakeOrder mo) {
		return sessionTemplate.insert("insertOrder",mo);
	}

	@Override
	public int cancelOrder(MakeOrder mo) {
		return sessionTemplate.update("dropOrder",mo);
	}
	@Override
	public int totMorderCnt() {
		return sessionTemplate.selectOne("totMorderCnt");
	}
	@Override
	public List<MakeOrder> myMorderList(MakeOrder mo) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("myMorderList",mo);
	}

	@Override
	public int myCntMorder(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("myCntMorder",mid);
	}
	
	
}
