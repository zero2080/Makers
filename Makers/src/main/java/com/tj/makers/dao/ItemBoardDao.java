package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.ItemBoard;

public interface ItemBoardDao {
	public List<ItemBoard> itemBoardList(ItemBoard itemBoard);
	public ItemBoard itemBoardView(int ibnum);
	public int itemBoardCnt(ItemBoard itemBoard);
	public int itemBoardWrite(ItemBoard itemBoard);
	public int itemBoardModify(ItemBoard itemBoard);
	public int itemBoardFin(int ibnum);
	public int itemBoardTrans(int ibnum);
	public int itemBoardDelete(int ibnum);

}
