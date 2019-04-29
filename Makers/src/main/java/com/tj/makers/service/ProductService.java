package com.tj.makers.service;

import java.util.List;

import com.tj.makers.model.Product;

public interface ProductService {
	public List<Product> productList(Product product);
	public Product productView(Product product);
	public int productCnt();
	public int productWrite(Product product);
	public int changeCnt(Product product);
	public int productModify(Product product);
	public int CntUp(int pnum);
	public int productDelete(int pnum);
	public int productTrans(int pnum);
}
