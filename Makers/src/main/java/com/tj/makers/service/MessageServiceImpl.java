package com.tj.makers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.makers.dao.MessageDao;
import com.tj.makers.model.Member;
import com.tj.makers.model.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDao msgDao;

	@Override
	public int msgTotCnt(Message msg) {
		return msgDao.msgTotCnt(msg);
	}
	
	@Override
	public List<Message> msgListView(Message msg) {
		return msgDao.msgListView(msg);
	}

	@Override
	public int deleteMessage(int msnum) {
		return msgDao.deleteMessage(msnum);
	}

	@Override
	public Message getTMessage(int msnum) {
		return msgDao.getTMessage(msnum);
	}
	
	@Override
	public Message getMessage(int msnum) {
		return msgDao.getMessage(msnum);
	}
	
	@Override
	public int sendMessage(Message message) {
		return msgDao.sendMessage(message);
	}
	
	@Override
	public int fdelMsg(int msnum) {
		return msgDao.fdelMsg(msnum);
	}
	@Override
	public int tdelMsg(int msnum) {
		return msgDao.tdelMsg(msnum);
	}
}
