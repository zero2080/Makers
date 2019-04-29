package com.tj.makers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Product;
@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Product> productList(Product product) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("productList",product);
	}

	@Override
	public Product productView(Product product) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("productView",product);
	}

	@Override
	public int productCnt() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("productCnt");
	}

	@Override
	public int productWrite(Product product) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("productWrite",product);
	}

	@Override
	public int changeCnt(Product product) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("changeCnt",product);
	}

	@Override
	public int productModify(Product product) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("productModify",product);
	}

	@Override
	public int CntUp(int pnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("CntUp",pnum);
	}

	@Override
	public int productDelete(int pnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("productDelete",pnum);
	}

	@Override
	public int productTrans(int pnum) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("productTrans",pnum);
	}
	
}
