package com.tj.makers.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Admin;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public Admin getAdmin(String aid) {
		return sessionTemplate.selectOne("getAdmin",aid);
	}

}
