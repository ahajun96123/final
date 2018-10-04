package com.jkl.hpot.dao;

import java.util.List;

import com.jkl.hpot.vo.ChatMemberVO;
import com.jkl.hpot.vo.ChatVO;

public interface ChatDAO {

	// 중복확인
	public ChatVO checkRoom(String name) throws Exception;

	// 방만들기
	public void createChatRoom(ChatVO vo) throws Exception;

	// 방정보리스트
	public List<ChatVO> getRoomList() throws Exception;

	// 현재 유저 지정한 방에 입장
	public void addRoomMember(ChatMemberVO mem) throws Exception;

	// 현재 유저가 어떤방에 있는지 확인
	public ChatMemberVO getRoomMember(ChatMemberVO mem) throws Exception;

	// 같은방에 존재하는 사람정보 모두가져오기
	public List<ChatMemberVO> sameRoomList(ChatMemberVO mem) throws Exception;

	// 유저의 방정보 수정
	public void updateRoomMember(ChatMemberVO mem) throws Exception;

	// 유저의 방정보 삭제
	public void deleteRoomMember(ChatMemberVO mem) throws Exception;

	// remainCount 증가
	public void updateChatCountInc(ChatVO vo) throws Exception;

	// remainCount 감소
	public void updateChatCountDec(ChatVO vo) throws Exception;

	// 방삭제
	public void deleteChat() throws Exception;

	// 방검색
	public List<ChatVO> searchRoomList(String name) throws Exception;

}
