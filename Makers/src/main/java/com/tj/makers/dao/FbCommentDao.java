package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.FbComment;

public interface FbCommentDao {
	
	public List<FbComment> fbcList(FbComment fbcomment);
	public int fbcWrite(FbComment fbcomment);
	public int fbcCount(int fbnum);
	public int fbcDelete(FbComment fbcomment);

}
