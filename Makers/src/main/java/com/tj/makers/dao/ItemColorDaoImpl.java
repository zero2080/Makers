package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.ItemColor;
@Repository
public class ItemColorDaoImpl implements ItemColorDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<ItemColor> itemColorList(int ibnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("itemColorList", ibnum);
	}



	@Override
	public int itemColorWrite(ItemColor itemColor) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("itemColorWrite",itemColor);
	}



	@Override
	public int itemColorDelete(int ibnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("itemColorDelete", ibnum);
	}



	@Override
	public int chkSeq() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("chkSeq");
	}

}
