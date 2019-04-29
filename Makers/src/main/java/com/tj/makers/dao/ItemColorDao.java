package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.ItemBoard;
import com.tj.makers.model.ItemColor;

public interface ItemColorDao {
	public List<ItemColor> itemColorList(int ibnum);
	public int chkSeq();
	public int itemColorWrite(ItemColor itemColor);

	public int itemColorDelete(int ibnum);

}
