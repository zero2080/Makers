package com.tj.makers.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.makers.model.Message;

@Repository
public class MessageDaoImpl implements MessageDao {
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public int msgTotCnt(Message msg) {
		return sessionTemplate.selectOne("msgTotCnt",msg);
	}
	
	@Override
	public List<Message> msgListView(Message msg) {
		return sessionTemplate.selectList("getMessageList",msg);
	}

	@Override
	public int sendMessage(Message message) {
		return sessionTemplate.insert("sendMessage",message);
	}

	@Override
	public Message getTMessage(int msnum) {			//받은사람이 메세지 확인 시
		sessionTemplate.update("confirmMsg",msnum);	//확인상태 전환
		return sessionTemplate.selectOne("getMessage",msnum);
	}

	@Override
	public Message getMessage(int msnum) {			//보낸사람이 메세지 확인 시
		return sessionTemplate.selectOne("getMessage",msnum);
	}
	
	@Override
	public int fdelMsg(int msnum) {
		return sessionTemplate.update("fdelMsg",msnum);
	}
	
	@Override
	public int tdelMsg(int msnum) {
		return sessionTemplate.update("tdelMsg",msnum);
	}
	
	@Override
	public int deleteMessage(int msnum) {
		return sessionTemplate.delete("deleteMessage",msnum);
	}

}
