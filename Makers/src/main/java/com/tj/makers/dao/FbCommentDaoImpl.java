package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.FbComment;

@Repository
public class FbCommentDaoImpl implements FbCommentDao {

	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public List<FbComment> fbcList(FbComment fbcomment) {
		return sessionTemplate.selectList("fbcList", fbcomment);
	}

	@Override
	public int fbcWrite(FbComment fbcomment) {
		return sessionTemplate.insert("fbcWrite", fbcomment);
	}

	@Override
	public int fbcCount(int fbnum) {
		return sessionTemplate.selectOne("fbcCount", fbnum);
	}

	@Override
	public int fbcDelete(FbComment fbcomment) {
		return sessionTemplate.delete("fbcDelete", fbcomment);
	}

}
