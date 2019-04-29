package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.ItemsDao;
import com.tj.makers.model.Items;
@Service
public class ItemsServiceImpl implements ItemsService {
	@Autowired
	private ItemsDao itDao;

	@Override
	public List<Items> itemsList(Items items) {
		// TODO Auto-generated method stub
		return itDao.itemsList(items);
	}

	@Override
	public Items itemsView(int itnum) {
		// TODO Auto-generated method stub
		return itDao.itemsView(itnum);
	}

	@Override
	public int itemsCnt(Items items) {
		// TODO Auto-generated method stub
		return itDao.itemsCnt(items);
	}

	@Override
	public int itemsWrite(Items items) {
		// TODO Auto-generated method stub
		return itDao.itemsWrite(items);
	}

	@Override
	public int itemsModify(Items items) {
		// TODO Auto-generated method stub
		return itDao.itemsModify(items);
	}

	@Override
	public int itemsDelete(int itnum) {
		// TODO Auto-generated method stub
		return itDao.itemsDelete(itnum);
	}
	
}
