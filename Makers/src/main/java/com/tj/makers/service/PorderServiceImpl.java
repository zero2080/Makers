package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.PorderDao;
import com.tj.makers.model.Porder;
@Service
public class PorderServiceImpl implements PorderService {
	@Autowired
	private PorderDao porderDao;
	@Override
	public List<Porder> porderList(Porder porder) {
		// TODO Auto-generated method stub
		return porderDao.porderList(porder);
	}

	@Override
	public int porderInsert(Porder porder) {
		// TODO Auto-generated method stub
		return porderDao.porderInsert(porder);
	}

	@Override
	public int porderWrite(Porder porder) {
		// TODO Auto-generated method stub
		return porderDao.porderWrite(porder);
	}

	@Override
	public int porderOver(Porder porder) {
		// TODO Auto-generated method stub
		return porderDao.porderOver(porder);
	}

	@Override
	public int porderListCnt(Porder porder) {
		// TODO Auto-generated method stub
		return porderDao.porderListCnt(porder);
	}

	@Override
	public Porder porderSelect(Porder porder) {
		// TODO Auto-generated method stub
		return porderDao.porderSelect(porder);
	}

	@Override
	public Porder porderView(int ornum) {
		// TODO Auto-generated method stub
		return porderDao.porderView(ornum);
	}

}
