package com.tj.makers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.AdminDao;
import com.tj.makers.model.Admin;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
		private AdminDao adminDao;
	@Override
	public Admin getAdmin(String aid) {
		return adminDao.getAdmin(aid);
	}
}
