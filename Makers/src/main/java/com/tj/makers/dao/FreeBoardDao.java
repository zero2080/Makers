package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.FreeBoard;

public interface FreeBoardDao {
	
	public List<FreeBoard> fbList(FreeBoard freeboard);
	public List<FreeBoard> ntList(FreeBoard freeboard);
	public int fbWrite(FreeBoard freeboard);
	public int fbCount();
	public int fbReadcountUp(int fbnum);
	//public int fbReadcountUp(int fbnum);
	public FreeBoard fbContentRead(FreeBoard freeboard);
	public int fbModify(FreeBoard freeboard);
	public int fbDelete(FreeBoard freeboard);
	
	
}
