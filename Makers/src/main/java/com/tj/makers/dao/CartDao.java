package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.Cart;

public interface CartDao {
	public List<Cart> cartView(Cart cart);
	public int cartInsert(Cart cart);
	public int cartCnt(Cart cart);
	public Cart cartChk(Cart cart);
	public int cartCountUp(Cart cart);
	public int cartDelete(Cart cart);
	public int cartDeleteAll(Cart cart);
	public Cart cartSelect(Cart cart);
	public int cartOver(int ctnum);
	public List<Cart> cartGet(Cart cart);
	public Cart cartGetToNum(int ctnum);
	public List<Cart> cartGetNum3(Cart cart);
	public Cart cartSameChk(Cart cart);
	public int cartChangeNum(int ctnum);
	public int cartNum3DeleteAll();
 }
