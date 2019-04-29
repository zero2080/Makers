package com.tj.makers.service;

import java.util.List;

import com.tj.makers.model.ItemColor;

public interface ItemColorService {
	public List<ItemColor> itemColorList(int ibnum);
	public int chkSeq();
	public int itemColorWrite(ItemColor itemColor);

	public int itemColorDelete(int ibnum);
}
