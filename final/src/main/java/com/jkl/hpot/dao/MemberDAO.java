package com.jkl.hpot.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jkl.hpot.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int memberJoin(MemberVO memberVO) {
		return sqlSession.insert("Member.memberjoin", memberVO);
	}

	public MemberVO memberLogin(MemberVO memberVO) {
		return sqlSession.selectOne("Member.memberlogin", memberVO);
	}

	public MemberVO memberInfo(MemberVO memberVO) {
		return sqlSession.selectOne("Member.memberinfo", memberVO);
	}

	public List<MemberVO> memberList(MemberVO memberVO) {
		return sqlSession.selectList("Member.memberlist", memberVO);
	}

	public void memberDelete(String id) {
		sqlSession.selectOne("Member.memberdelete", id);
	}

	public MemberVO memberAlter(MemberVO memberVO) {
		return sqlSession.selectOne("Member.memberalter", memberVO);
	}

	public MemberVO idOverlap(String id) {
		return sqlSession.selectOne("Member.idOverlap", id);
	}

	public List<MemberVO> idFind(MemberVO memberVO) {
		return sqlSession.selectList("Member.idfind", memberVO);
	}

	public MemberVO pwFind(MemberVO memberVO) {
		return sqlSession.selectOne("Member.pwfind", memberVO);
	}

	@Transactional
	public MemberVO approval_member(MemberVO memberVO){
		return sqlSession.selectOne("Member.approval_member", memberVO);
	}
	@Transactional
	public int pwAlter(MemberVO memberVO) throws Exception{
		return sqlSession.update("Member.pwalter", memberVO);
	}

	public MemberVO ifFollow(MemberVO memberVO) {
		return sqlSession.selectOne("Member.ifFollow", memberVO);
	}
	
	public int follow(MemberVO memberVO) {
		return sqlSession.insert("Member.follow", memberVO);
	}

	public void deleteFollow(MemberVO memberVO) {
		sqlSession.delete("Member.deleteFollow", memberVO);
	}

	public List<MemberVO> followingList(MemberVO memberVO) {
		return sqlSession.selectList("Member.followingList", memberVO);
	}

	
}
