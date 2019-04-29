package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.FbCommentDao;
import com.tj.makers.model.FbComment;

@Service
public class FbCommentServiceImpl implements FbCommentService {
	
	@Autowired
	private FbCommentDao fbcommentDao;

	@Override
	public int fbcWrite(FbComment fbcomment) {
		return fbcommentDao.fbcWrite(fbcomment);
	}

	@Override
	public List<FbComment> fbcList(FbComment fbcomment) {
		return fbcommentDao.fbcList(fbcomment);
	}

	@Override
	public int fbcCount(int fbnum) {
		return fbcommentDao.fbcCount(fbnum);
	}

	@Override
	public int fbcDelete(FbComment fbcomment) {
		return fbcommentDao.fbcDelete(fbcomment);
	}

}
