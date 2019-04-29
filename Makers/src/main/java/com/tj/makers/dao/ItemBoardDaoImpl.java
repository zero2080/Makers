package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.ItemBoard;
@Repository
public class ItemBoardDaoImpl implements ItemBoardDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<ItemBoard> itemBoardList(ItemBoard itemBoard) {
		// TODO ? „ì²´ë³´ê¸?
		return sessionTemplate.selectList("itemBoardList",itemBoard);
	}

	@Override
	public ItemBoard itemBoardView(int ibnum) {
		// TODO ?ƒ?„¸ë³´ê¸°
		return sessionTemplate.selectOne("itemBoardView",ibnum);
	}

	@Override
	public int itemBoardCnt(ItemBoard itemBoard) {
		// TODO ? „ì²? ê°œìˆ˜
		return sessionTemplate.selectOne("itemBoardCnt",itemBoard);
	}

	@Override
	public int itemBoardWrite(ItemBoard itemBoard) {
		// TODO ê¸??“°ê¸?
		return sessionTemplate.insert("itemBoardWrite", itemBoard);
	}

	@Override
	public int itemBoardModify(ItemBoard itemBoard) {
		// TODO ?ˆ˜? •?•˜ê¸?
		return sessionTemplate.update("itemBoardModify",itemBoard);
	}

	@Override
	public int itemBoardFin(int ibnum) {
		// TODO ?“±ë¡ì™„ë£?
		return sessionTemplate.update("itemBoardFin", ibnum);
	}

	@Override
	public int itemBoardTrans(int ibnum) {
		// TODO ?‚­? œ(?“±ë¡ì™„ë£Œì‹œ)
		return sessionTemplate.update("itemBoardTrans",ibnum);
	}

	@Override
	public int itemBoardDelete(int ibnum) {
		// TODO ?‚­? œ(?™„? „?‚­? œ)
		return sessionTemplate.delete("itemBoardDelete",ibnum);
	}

}
