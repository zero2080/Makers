package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.ItemBoard;
import com.tj.makers.model.Items;
import com.tj.makers.service.ItemsService;

public interface ItemsDao {
	public List<Items> itemsList(Items items);
	public Items itemsView(int itnum);
	public int itemsCnt(Items items);
	public int itemsWrite(Items items);
	public int itemsModify(Items items);
	public int itemsDelete(int itnum);
	


}
