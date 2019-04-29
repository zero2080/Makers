package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.FreeBoard;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao {

	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public List<FreeBoard> fbList(FreeBoard freeboard) {
		return sessionTemplate.selectList("fbList", freeboard);
	}

	@Override
	public List<FreeBoard> ntList(FreeBoard freeboard) {
		return sessionTemplate.selectList("ntList", freeboard);
	}

	@Override
	public int fbWrite(FreeBoard freeboard) {
		return sessionTemplate.insert("fbWrite", freeboard);
	}

	@Override
	public int fbCount() {
		return sessionTemplate.selectOne("fbCount");
	}

	@Override
	public int fbReadcountUp(int fbnum) {
		return sessionTemplate.update("fbReadcountUp", fbnum);
	}

	@Override
	public FreeBoard fbContentRead(FreeBoard freeboard) {
		return sessionTemplate.selectOne("fbContentRead", freeboard.getFbnum());
	}

	@Override
	public int fbModify(FreeBoard freeboard) {
		return sessionTemplate.update("fbModify", freeboard);
	}

	@Override
	public int fbDelete(FreeBoard freeboard) {
		return sessionTemplate.delete("fbDelete", freeboard);
	}

}
