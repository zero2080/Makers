package com.tj.makers.service;

import java.util.List;

import com.tj.makers.model.FbComment;

public interface FbCommentService {
	
	public List<FbComment> fbcList(FbComment fbcomment);
	public int fbcWrite(FbComment fbcomment);
	public int fbcCount(int fbnum);
	public int fbcDelete(FbComment fbcomment);

}
