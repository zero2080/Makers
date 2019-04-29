package com.tj.makers.service;

import java.util.List;

import com.tj.makers.model.Member;
import com.tj.makers.model.Message;

public interface MessageService {
	public List<Message> msgListView(Message msg);
	public int sendMessage(Message message);
	public Message getTMessage(int msnum);
	public Message getMessage(int msnum);
	public int deleteMessage(int msnum);
	public int msgTotCnt(Message msg);
	public int tdelMsg(int msnum);
	public int fdelMsg(int msnum);
}
