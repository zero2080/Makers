package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.ItemColorDao;
import com.tj.makers.model.ItemColor;
@Service
public class ItemColorServiceImpl implements ItemColorService {
	
	@Autowired
	private ItemColorDao itcDao;
	
	
	
	@Override
	public List<ItemColor> itemColorList(int ibnum) {
		// TODO Auto-generated method stub
		return itcDao.itemColorList(ibnum);
	}
	

	@Override
	public int itemColorWrite(ItemColor itemColor) {
		// TODO Auto-generated method stub
		return itcDao.itemColorWrite(itemColor);
	}


	@Override
	public int itemColorDelete(int ibnum) {
		// TODO Auto-generated method stub
		return itcDao.itemColorDelete(ibnum);
	}


	@Override
	public int chkSeq() {
		// TODO Auto-generated method stub
		return itcDao.chkSeq();
	}



}
