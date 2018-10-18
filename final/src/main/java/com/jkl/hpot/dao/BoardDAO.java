package com.jkl.hpot.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.jkl.hpot.entity.UploadFile;
import com.jkl.hpot.vo.BoardVO;
import com.jkl.hpot.vo.CommentVO;
import com.jkl.hpot.vo.PageInfo;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int boardWrite(BoardVO boardVO) {
		return sqlSession.insert("Board.boardWrite", boardVO);
	}

	public List<BoardVO> boardList(BoardVO boardVO) {
		System.out.println(boardVO.getStart());
		System.out.println(boardVO.getEnd());
		return sqlSession.selectList("Board.boardList", boardVO);
	}

	public int boardMAX_Bnum() {
		return sqlSession.selectOne("Board.MaxBnum");

	}

	public int listCount(BoardVO boardVO) {
		return sqlSession.selectOne("Board.listCount", boardVO);
	}

	public List<BoardVO> boardListCate(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListCate", boardVO);
	}

	public int listCateCount(BoardVO boardVO) {
		return sqlSession.selectOne("Board.listCateCount", boardVO);
	}

	public List<BoardVO> boardListCateGrade(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListCateGrade", boardVO);
	}

	public List<BoardVO> boardListCateView(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListCateView", boardVO);
	}

	public List<BoardVO> boardListCateRecommend(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListCateRecommend", boardVO);
	}

	public List<BoardVO> boardListCateBest(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListCateBest", boardVO);
	}

	public List<BoardVO> boardListGrade(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListGrade", boardVO);
	}

	public List<BoardVO> boardListView(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListView", boardVO);
	}

	public List<BoardVO> boardListRecommend(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListRecommend", boardVO);
	}

	public List<BoardVO> boardListBest(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardListBest", boardVO);
	}

	public List<BoardVO> boardSearchSubject(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardSearchSubject", boardVO);
	}

	public List<BoardVO> boardSearchTag(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardSearchTag", boardVO);
	}

	public List<BoardVO> boardSearchId(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardSearchId", boardVO);
	}

	public List<BoardVO> boardSearchContent(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardSearchContent", boardVO);
	}

	public int listSearchCount(BoardVO boardVO) {
		return sqlSession.selectOne("Board.listSearchCount", boardVO);
	}

	public BoardVO boardView(BoardVO boardVO) {
		return sqlSession.selectOne("Board.boardView", boardVO);
	}

	public List<CommentVO> boardCommentList(CommentVO commentVO) {
		return sqlSession.selectList("Board.boardCommentList", commentVO);
	}

	public int boardModify(BoardVO boardVO) {
		return sqlSession.update("Board.boardModify", boardVO);

	}

	public int boardDelete(BoardVO boardVO) {
		return sqlSession.delete("Board.boardDelete", boardVO);
	}

	public int boardComment(CommentVO commentVO) {
		return sqlSession.insert("Board.boardComment", commentVO);
	}

	public int boardReadCount(BoardVO boardVO) {
		return sqlSession.update("Board.boardReadCount", boardVO);
	}

	public int bigData(BoardVO boardVO) {
		return sqlSession.insert("Board.bigData", boardVO);
	}

	public List<BoardVO> myBoard(BoardVO boardVO) {
		return sqlSession.selectList("Board.myBoard", boardVO);		
	}

	public BoardVO ifBooked(BoardVO boardVO) {
		return sqlSession.selectOne("Board.ifBooked", boardVO);
	}

	public int book(BoardVO boardVO) {
		System.out.println("test아위디"+boardVO.getId());
		return sqlSession.insert("Board.book", boardVO);
	}

	public void deleteBooked(BoardVO boardVO) {
		sqlSession.delete("Board.deleteBooked", boardVO);
	}
	
	public int boardGrade(BoardVO boardVO) {
		return sqlSession.insert("Board.boardGrade", boardVO);
	}

	public int boardGradeUpdate(BoardVO boardVO) {
		return sqlSession.update("Board.boardGradeUpdate", boardVO);
	}

	public BoardVO boardGradeAvg(BoardVO boardVO) {
		return sqlSession.selectOne("Board.boardGradeAvg", boardVO);
	}

	public BoardVO boardGradeCheck(BoardVO boardVO) {
		return sqlSession.selectOne("Board.boardGradeCheck", boardVO);
	}

	public int boardBestCount(BoardVO boardVO) {
		return sqlSession.selectOne("Board.listBestCount", boardVO);
	}
	public int boardBestCateCount(BoardVO boardVO) {
		return sqlSession.selectOne("Board.listBestCateCount", boardVO);
	}

	public int boardGradeCount(BoardVO boardVO) {
		return sqlSession.selectOne("Board.gradeCount", boardVO);
	}

	public int boardLike(BoardVO boardVO) {
		return sqlSession.insert("Board.boardLike", boardVO);
	}
	public int boardLikeUpdate(BoardVO boardVO) {
		return sqlSession.update("Board.boardLikeUpdate", boardVO);
	}

	public BoardVO boardLikeCheck(BoardVO boardVO) {
		return sqlSession.selectOne("Board.boardLikeCheck", boardVO);
	}

	public int boardReport(BoardVO boardVO) {
		return sqlSession.insert("Board.boardReport", boardVO);
	}

	public int boardReportUpdate(BoardVO boardVO) {
		return sqlSession.update("Board.boardReportUpdate", boardVO);
	}

	public int boardReportCount(BoardVO boardVO) {
		return sqlSession.selectOne("Board.reportCount", boardVO);
	}

	public int boardBlindUpdate(BoardVO boardVO) {
		return sqlSession.update("Board.boardBlindUpdate", boardVO);
	}

	public BoardVO boardReportCheck(BoardVO boardVO) {
		return sqlSession.selectOne("Board.boardReportCheck", boardVO);
	}
	//followingBoard 리스트 불러오는 건데 myBoard sql문이랑 같아서 myBoard 씀
	public List<BoardVO> getfollowingBoard(String id) {
		return sqlSession.selectList("Board.myBoard", id);
	}

	public List<BoardVO> bookNum(BoardVO boardVO) {
		return sqlSession.selectList("Board.bookNum", boardVO);
	}

	public BoardVO bookBoard(int bNum) {
		return sqlSession.selectOne("Board.bookBoard", bNum);
	}

	public List<BoardVO> boardBest() {
		return sqlSession.selectList("Board.boardBest");
	}

	public List<BoardVO> boardFitList(BoardVO boardVO) {
		return sqlSession.selectList("Board.boardFitList",boardVO);
	}

	public BoardVO boardFit(BoardVO boardVO) {
		BoardVO bv = new BoardVO();
		bv = sqlSession.selectOne("Board.boardFit", boardVO);
		if(bv!=null) {
			return bv;
		} else {
			bv = new BoardVO();
			bv.setbCategory("ko");
			return bv;
		}
	}

	public List<BoardVO> blindList() {
		return sqlSession.selectList("Board.blindList");
	}

	public List<BoardVO> reportList() {
		return sqlSession.selectList("Board.reportList");
	}

	public int blindRelease(BoardVO boardVO) {
		return sqlSession.update("Board.blindRelease", boardVO);
	}

	
	/*public int imgUpload(UploadFile saveFile) {
		return sqlSession.insert("Board.imgUpload",saveFile);
		
	}*/

}