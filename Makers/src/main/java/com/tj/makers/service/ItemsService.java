package com.tj.makers.service;

import java.util.List;

import com.tj.makers.model.Items;

public interface ItemsService {
	public List<Items> itemsList(Items items);
	public Items itemsView(int itnum);
	
	public int itemsWrite(Items items);
	public int itemsModify(Items items);
	public int itemsDelete(int itnum);
	public int itemsCnt(Items items);
}
