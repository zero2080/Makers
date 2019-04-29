package com.tj.makers.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.FreeBoard;

public interface FreeBoardService {
	
	public List<FreeBoard> fbList(FreeBoard freeboard);
	public List<FreeBoard> ntList(FreeBoard freeboard);
	public int fbWrite(MultipartHttpServletRequest mRequest, FreeBoard freeboard); 
	public int fbCount(); 
	public int fbReadcountUp(int fbnum);
	public FreeBoard fbContentRead(FreeBoard freeboard); 
	public int fbModify(MultipartHttpServletRequest mRequest, FreeBoard freeboard); 
	public int fbDelete(FreeBoard freeboard);

}
