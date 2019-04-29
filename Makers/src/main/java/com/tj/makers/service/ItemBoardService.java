package com.tj.makers.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.ItemBoard;

public interface ItemBoardService {
	public List<ItemBoard> itemBoardList(ItemBoard itemBoard);
	public ItemBoard itemBoardView(int ibnum);
	public int itemBoardCnt(ItemBoard itemBoard);
	public int itemBoardWrite(MultipartHttpServletRequest mRequest, ItemBoard itemBoard);
	public int itemBoardModify(MultipartHttpServletRequest mRequest,ItemBoard itemBoard);
	public int itemBoardFin(int ibnum);
	public int itemBoardTrans(int ibnum);
	public int itemBoardDelete(int ibnum);
}
