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
		// TODO ? μ²΄λ³΄κΈ?
		return sessionTemplate.selectList("itemBoardList",itemBoard);
	}

	@Override
	public ItemBoard itemBoardView(int ibnum) {
		// TODO ??Έλ³΄κΈ°
		return sessionTemplate.selectOne("itemBoardView",ibnum);
	}

	@Override
	public int itemBoardCnt(ItemBoard itemBoard) {
		// TODO ? μ²? κ°μ
		return sessionTemplate.selectOne("itemBoardCnt",itemBoard);
	}

	@Override
	public int itemBoardWrite(ItemBoard itemBoard) {
		// TODO κΈ??°κΈ?
		return sessionTemplate.insert("itemBoardWrite", itemBoard);
	}

	@Override
	public int itemBoardModify(ItemBoard itemBoard) {
		// TODO ?? ?κΈ?
		return sessionTemplate.update("itemBoardModify",itemBoard);
	}

	@Override
	public int itemBoardFin(int ibnum) {
		// TODO ?±λ‘μλ£?
		return sessionTemplate.update("itemBoardFin", ibnum);
	}

	@Override
	public int itemBoardTrans(int ibnum) {
		// TODO ?­? (?±λ‘μλ£μ)
		return sessionTemplate.update("itemBoardTrans",ibnum);
	}

	@Override
	public int itemBoardDelete(int ibnum) {
		// TODO ?­? (?? ?­? )
		return sessionTemplate.delete("itemBoardDelete",ibnum);
	}

}
