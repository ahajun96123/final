package com.jkl.hpot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jkl.hpot.dao.ChatDAO;
import com.jkl.hpot.service.ChatService;
import com.jkl.hpot.vo.ChatMemberVO;
import com.jkl.hpot.vo.ChatVO;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	ChatDAO chatDao;

	@Override
	public ChatVO checkRoom(String name) throws Exception {
		return chatDao.checkRoom(name);
	}

	@Override
	public void createChatRoom(ChatVO vo) throws Exception {
		chatDao.createChatRoom(vo);
	}

	@Override
	public List<ChatVO> getRoomList() throws Exception {
		return chatDao.getRoomList();
	}

	@Override
	public void addRoomMember(ChatMemberVO mem) throws Exception {
		chatDao.addRoomMember(mem);
	}

	@Override
	public ChatMemberVO getRoomMember(ChatMemberVO mem) throws Exception {
		return chatDao.getRoomMember(mem);
	}

	@Override
	public List<ChatMemberVO> sameRoomList(ChatMemberVO mem) throws Exception {
		return chatDao.sameRoomList(mem);
	}

	@Override
	public void updateRoomMember(ChatMemberVO mem) throws Exception {
		chatDao.updateRoomMember(mem);
	}

	@Override
	public void deleteRoomMember(ChatMemberVO mem) throws Exception {
		chatDao.deleteRoomMember(mem);
	}

	@Override
	public void updateChatCountInc(ChatVO vo) throws Exception {
		chatDao.updateChatCountInc(vo);
	}

	@Override
	public void updateChatCountDec(ChatVO vo) throws Exception {
		chatDao.updateChatCountDec(vo);
	}

	@Override
	public void deleteChat() throws Exception {
		chatDao.deleteChat();
	}

	@Override
	public List<ChatVO> searchRoomList(String name) throws Exception {
		return chatDao.searchRoomList(name);
	}
}
