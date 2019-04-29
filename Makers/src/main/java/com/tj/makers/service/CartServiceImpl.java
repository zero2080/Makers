package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.CartDao;
import com.tj.makers.model.Cart;
@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDao cartDao;
	
	@Override
	public List<Cart> cartView(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartView(cart);
	}

	@Override
	public int cartInsert(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartInsert(cart);
	}

	@Override
	public int cartCnt(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartCnt(cart);
	}

	@Override
	public Cart cartChk(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartChk(cart);
	}

	@Override
	public int cartCountUp(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartCountUp(cart);
	}

	@Override
	public int cartDelete(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartDelete(cart);
	}

	@Override
	public int cartDeleteAll(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartDeleteAll(cart);
	}

	@Override
	public Cart cartSelect(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartSelect(cart);
	}

	@Override
	public int cartOver(int ctnum) {
		// TODO Auto-generated method stub
		return cartDao.cartOver(ctnum);
	}

	@Override
	public List<Cart> cartGet(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartGet(cart);
	}

	@Override
	public Cart cartGetToNum(int ctnum) {
		// TODO Auto-generated method stub
		return cartDao.cartGetToNum(ctnum);
	}

	@Override
	public List<Cart> cartGetNum3(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartGetNum3(cart);
	}

	@Override
	public Cart cartSameChk(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.cartSameChk(cart);
	}

	@Override
	public int cartChangeNum(int ctnum) {
		// TODO Auto-generated method stub
		return cartDao.cartChangeNum(ctnum);
	}

	@Override
	public int cartNum3DeleteAll() {
		// TODO Auto-generated method stub
		return cartDao.cartNum3DeleteAll();
	}

}
