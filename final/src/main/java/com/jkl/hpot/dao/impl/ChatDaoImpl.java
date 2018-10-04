package com.jkl.hpot.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jkl.hpot.dao.ChatDAO;
import com.jkl.hpot.vo.ChatMemberVO;
import com.jkl.hpot.vo.ChatVO;

@Repository
public class ChatDaoImpl implements ChatDAO {

	@Autowired
	SqlSession sqlSession;
	
	private String ns = "Chat.";

	@Override
	public ChatVO checkRoom(String name) throws Exception {
		return sqlSession.selectOne(ns+"getRoom", name);
	}

	@Override
	public void createChatRoom(ChatVO vo) throws Exception {
		sqlSession.insert(ns+"createChatRoom", vo);
	}

	@Override
	public List<ChatVO> getRoomList() throws Exception {
		return sqlSession.selectList(ns+"getRoomList");
	}

	@Override
	public void addRoomMember(ChatMemberVO mem) throws Exception {
		sqlSession.insert(ns+"addRoomMember",mem);
	}

	@Override
	public ChatMemberVO getRoomMember(ChatMemberVO mem) throws Exception {
		return sqlSession.selectOne(ns+"getRoomMember", mem);
	}

	@Override
	public List<ChatMemberVO> sameRoomList(ChatMemberVO mem) throws Exception {
		return sqlSession.selectList(ns+"sameRoomList",mem);
	}

	@Override
	public void updateRoomMember(ChatMemberVO mem) throws Exception {
		sqlSession.update(ns+"updateRoomMember", mem);
	}

	@Override
	public void deleteRoomMember(ChatMemberVO mem) throws Exception {
		sqlSession.delete(ns+"deleteRoomMember", mem);
	}

	@Override
	public void updateChatCountInc(ChatVO vo) throws Exception {
		sqlSession.update(ns+"updateChatCountInc", vo);
	}

	@Override
	public void updateChatCountDec(ChatVO vo) throws Exception {
		sqlSession.update(ns+"updateChatCountDec", vo);
	}

	@Override
	public void deleteChat() throws Exception {
		sqlSession.delete(ns+"deleteChat");
	}

	@Override
	public List<ChatVO> searchRoomList(String name) throws Exception {
		return sqlSession.selectList(ns+"searchRoomList", name);
	}
	
	
	
}
