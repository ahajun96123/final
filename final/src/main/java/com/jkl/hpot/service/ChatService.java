package com.jkl.hpot.service;

import java.util.List;

import com.jkl.hpot.vo.ChatMemberVO;
import com.jkl.hpot.vo.ChatVO;

public interface ChatService {

public ChatVO checkRoom(String name) throws Exception;
	
	public void createChatRoom(ChatVO vo) throws Exception;
	
	public List<ChatVO> getRoomList() throws Exception;
	
	public void addRoomMember(ChatMemberVO mem) throws Exception;
	
	public ChatMemberVO getRoomMember(ChatMemberVO mem) throws Exception;
	
	public List<ChatMemberVO> sameRoomList(ChatMemberVO mem) throws Exception;
	
	public void updateRoomMember(ChatMemberVO mem) throws Exception;
	
	public void deleteRoomMember(ChatMemberVO mem) throws Exception;
	
	public void updateChatCountInc(ChatVO vo) throws Exception;
	
	public void updateChatCountDec(ChatVO vo) throws Exception;
	
	public void deleteChat() throws Exception;
	
	public List<ChatVO> searchRoomList(String name) throws Exception;
	
}
