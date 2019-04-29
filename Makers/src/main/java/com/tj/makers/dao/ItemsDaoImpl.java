package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Items;
@Repository
public class ItemsDaoImpl implements ItemsDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Items> itemsList(Items items) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("itemsList", items);
	}

	@Override
	public Items itemsView(int itnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("itemsView", itnum);
	}

	@Override
	public int itemsCnt(Items items) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("itemsCnt",items);
	}

	@Override
	public int itemsWrite(Items items) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("itemsWrite", items);
	}

	@Override
	public int itemsModify(Items items) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("itemsModify",items);
	}

	@Override
	public int itemsDelete(int itnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("itemsDelete", itnum);
	}

}
