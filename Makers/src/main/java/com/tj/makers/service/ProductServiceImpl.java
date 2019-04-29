package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.ProductDao;
import com.tj.makers.model.Product;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao pDao;

	@Override
	public List<Product> productList(Product product) {
		// TODO Auto-generated method stub
		return pDao.productList(product);
	}

	@Override
	public Product productView(Product product) {
		// TODO Auto-generated method stub
		return pDao.productView(product);
	}

	@Override
	public int productCnt() {
		// TODO Auto-generated method stub
		return pDao.productCnt();
	}

	@Override
	public int productWrite(Product product) {
		// TODO Auto-generated method stub
		return pDao.productWrite(product);
	}

	@Override
	public int changeCnt(Product product) {
		// TODO Auto-generated method stub
		return pDao.changeCnt(product);
	}

	@Override
	public int productModify(Product product) {
		// TODO Auto-generated method stub
		return pDao.productModify(product);
	}

	@Override
	public int CntUp(int pnum) {
		// TODO Auto-generated method stub
		return pDao.CntUp(pnum);
	}

	@Override
	public int productDelete(int pnum) {
		// TODO Auto-generated method stub
		return pDao.productDelete(pnum);
	}

	@Override
	public int productTrans(int pnum) {
		// TODO Auto-generated method stub
		return pDao.productTrans(pnum);
	}

}
