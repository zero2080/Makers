package com.tj.makers.dao;

import java.util.List;

import com.tj.makers.model.Message;

public interface MessageDao {
	public List<Message> msgListView(Message msg);
	public int sendMessage(Message message);
	public Message getTMessage(int msnum);
	public Message getMessage(int msnum);
	public int deleteMessage(int msnum);
	public int msgTotCnt(Message msg);
	public int fdelMsg(int msnum);
	public int tdelMsg(int msnum);
}
