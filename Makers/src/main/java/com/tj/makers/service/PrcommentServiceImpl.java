package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.PrcommentDao;
import com.tj.makers.model.Prcomment;

@Service
public class PrcommentServiceImpl implements PrcommentService {
	@Autowired
	PrcommentDao prcDao;
	
	@Override
	public int prcTotCnt(int pnum) {
		return prcDao.prcTotCnt(pnum);
	}

	@Override
	public List<Prcomment> prcPagingList(Prcomment prcomment) {
		return prcDao.prcPagingList(prcomment);
	}

	@Override
	public int prcWrite(Prcomment prcomment) {
		return prcDao.prcWrite(prcomment);
	}

	@Override
	public int prcReply(Prcomment prcomment) {
		return prcDao.prcReply(prcomment);
	}

	@Override
	public int prcDelOrigin(int prcgroup) {
		return prcDao.prcDelOrigin(prcgroup);
	}

	@Override
	public int prcDelrepl(int prcnum) {
		return prcDao.prcDelrepl(prcnum);
	}
}
