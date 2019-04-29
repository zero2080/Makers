package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Admin;
import com.tj.makers.model.Cart;

@Repository
public class CartDaoImpl implements CartDao {
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public List<Cart> cartView(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("cartView",cart);
	}

	@Override
	public int cartInsert(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("cartInsert",cart);
	}

	@Override
	public int cartCnt(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("cartCnt",cart);
	}

	@Override
	public Cart cartChk(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("cartChk",cart);
	}

	@Override
	public int cartCountUp(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("cartCountUp",cart);
	}

	@Override
	public int cartDelete(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("cartDelete",cart);
	}

	@Override
	public int cartDeleteAll(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("cartDeleteAll",cart);
	}

	@Override
	public Cart cartSelect(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("cartSelect",cart);
	}

	@Override
	public int cartOver(int ctnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("cartOver",ctnum);
	}

	@Override
	public List<Cart> cartGet(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("cartGet", cart);
	}

	@Override
	public Cart cartGetToNum(int ctnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("cartGetToNum",ctnum);
	}

	@Override
	public List<Cart> cartGetNum3(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("cartGetNum3",cart);
	}

	@Override
	public Cart cartSameChk(Cart cart) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("cartSameChk",cart);
	}

	@Override
	public int cartChangeNum(int ctnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("cartChangeNum",ctnum);
	}

	@Override
	public int cartNum3DeleteAll() {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("cartNum3DeleteAll");
	}
	
	

}
