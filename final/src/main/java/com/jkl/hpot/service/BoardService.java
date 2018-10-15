package com.jkl.hpot.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jkl.hpot.dao.BoardDAO;
import com.jkl.hpot.entity.UploadFile;
import com.jkl.hpot.repository.FileRepository;
import com.jkl.hpot.util.UploadFileUtils;
import com.jkl.hpot.vo.BoardVO;
import com.jkl.hpot.vo.CommentVO;
import com.jkl.hpot.vo.MemberVO;
import com.jkl.hpot.vo.PageInfo;



@Service
public class BoardService {

	private ModelAndView mav;
	@Autowired
	private BoardDAO boardDAO;
	private BoardVO boardVO;
	private PageInfo pageInfo;
	private CommentVO commentVO;
		
	@Autowired
	private HttpSession session;

	public String boardWrite(BoardVO boardVO) {
		boardVO.setbNum(1);
		int maxBnum = boardDAO.boardMAX_Bnum();
		boardVO.setbNum(maxBnum);
		System.out.println("MAX_bNum ="+boardVO.getbNum());
		if(boardVO.getbNum()>=1) {
			boardVO.setbNum(boardVO.getbNum()+1);
		}else {
			boardVO.setbNum(1);
		}
		boardDAO.boardWrite(boardVO);
		return "redirect:/boardList?which="+boardVO.getbWhich();
	}
	
	public ModelAndView boardList(BoardVO boardVO,int page,int limit){
		mav = new ModelAndView();
		pageInfo = new PageInfo();
		int startrow = (page - 1) * limit + 1;
		int endrow = page * limit;
		boardVO.setStart(startrow);
		boardVO.setEnd(endrow);
		System.out.println(boardVO.getStart());
		System.out.println(boardVO.getEnd());
		System.out.println(boardVO.getbWhich());
		if(boardVO.getInCate()==1) {
			List<BoardVO> boardList = new ArrayList<BoardVO>();
			if(boardVO.getInArray()==1) {
				boardList = boardDAO.boardListCateGrade(boardVO);
			}else if (boardVO.getInArray()==2) {
				boardList = boardDAO.boardListCateView(boardVO);
			}else if (boardVO.getInArray()==3) {
				boardList = boardDAO.boardListCateRecommend(boardVO);
			}else if (boardVO.getInArray()==4) {
				boardList = boardDAO.boardListCateBest(boardVO);
			}else {
				boardList = boardDAO.boardListCate(boardVO);
			}
			System.out.println("boardList size ="+boardList.size());
			int listCateCount = boardDAO.listCateCount(boardVO);
			if(boardVO.getInArray()==4) {
				listCateCount = boardDAO.boardBestCateCount(boardVO);
			}
			// 페이지 계산을 위한 부분
			// 최대로 필요한 페이지 개수 계산
			int maxPage = (int) ((double) listCateCount / limit + 1);
			// 현재 페이지에 보여줄 시작페이지 번호
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

			int endPage = startPage + 10 - 1;
			if (endPage > maxPage) {
				endPage = maxPage;
			}
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setListCount(listCateCount);
			System.out.println(boardVO.getbWhich());
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("boardList", boardList);
			mav.addObject("which", boardVO.getbWhich());			
		}else {
			List<BoardVO> boardList = new ArrayList<BoardVO>();
			if(boardVO.getInArray()==1) {
				boardList = boardDAO.boardListGrade(boardVO);
			}else if (boardVO.getInArray()==2) {
				boardList = boardDAO.boardListView(boardVO);
			}else if (boardVO.getInArray()==3) {
				boardList = boardDAO.boardListRecommend(boardVO);
			}else if (boardVO.getInArray()==4) {
				boardList = boardDAO.boardListBest(boardVO);
			}else if(boardVO.getInSearch()==1) {
				boardList = boardDAO.boardSearchSubject(boardVO);
			}else if(boardVO.getInSearch()==2) {
				boardList = boardDAO.boardSearchTag(boardVO);
			}else if(boardVO.getInSearch()==3) {
				boardList = boardDAO.boardSearchId(boardVO);
			}else if(boardVO.getInSearch()==4) {
				boardList = boardDAO.boardSearchContent(boardVO);
			}else {
				boardList = boardDAO.boardList(boardVO);
			}
			int listCount = boardDAO.listCount(boardVO);
			if(boardVO.getInSearch()>=1) {
				listCount = boardDAO.listSearchCount(boardVO);
			}
			if(boardVO.getInArray()==4) {
				listCount = boardDAO.boardBestCount(boardVO);
			}
			System.out.println("boardList size ="+boardList.size());
			System.out.println("listCount = " + listCount);
			/*if(boardList.size()<1) {
				mav.addObject("msg","해당 게시물이 없습니다.");
				mav.setViewName("ListCheck");
			}*/
			// 페이지 계산을 위한 부분
			// 최대로 필요한 페이지 개수 계산
			int maxPage = (int) ((double) listCount / limit + 1);
			// 현재 페이지에 보여줄 시작페이지 번호
			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

			int endPage = startPage + 10 - 1;
			if (endPage > maxPage) {
				endPage = maxPage;
			}
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setListCount(listCount);
			System.out.println(boardVO.getbWhich());
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("boardList", boardList);
			mav.addObject("which", boardVO.getbWhich());
			if(boardList.size()<1) {
				mav.addObject("msg","해당 게시물이 없습니다.");
				mav.setViewName("ListCheck");
			}
		}
		mav.addObject("array", boardVO.getInArray());
		mav.addObject("category", boardVO.getbCategory());
		mav.addObject("search",boardVO.getSearchValue());
		mav.setViewName("List");
		return mav;
	}

	public ModelAndView boardView(BoardVO boardVO, CommentVO commentVO) {
	      mav = new ModelAndView();
	      BoardVO viewBoard = boardDAO.boardView(boardVO);
	      System.out.println(commentVO.getbNum());
	      List<CommentVO> commentList = boardDAO.boardCommentList(commentVO);
	      int gradeCount = boardDAO.boardGradeCount(boardVO);
	      BoardVO result = boardDAO.boardGradeCheck(boardVO);
	      BoardVO report = boardDAO.boardReportCheck(boardVO);
	      if(viewBoard.getbWhich().equals("지름")) {
	      	result = boardDAO.boardLikeCheck(boardVO);
	      }
	      if(!boardVO.getbCategory().equals("핫딜")) {
	    	  boardDAO.boardReadCount(boardVO);
	      }
	      boardVO.setId(viewBoard.getId());
	      boardVO.setbNum(viewBoard.getbNum());
	      boardVO.setbCategory(viewBoard.getbCategory());
	      boardDAO.bigData(boardVO);
	      mav.addObject("reportValue", report);
	      mav.addObject("gradeCount", gradeCount);
	      mav.addObject("gradeValue",result);
	      mav.addObject("likeValue",result);
	      mav.addObject("view", viewBoard);
	      mav.addObject("commentList",commentList);
	      mav.addObject("commentcount",commentList.size());
	      mav.setViewName("View");
	      return mav;
	   }

	public ModelAndView modifyForm(BoardVO boardVO) {
		mav = new ModelAndView();
		BoardVO modify = boardDAO.boardView(boardVO);
		mav.addObject("modify", modify);
		mav.setViewName("Modify");
		return mav;
	}

	public String boardModify(BoardVO boardVO) {
		boardDAO.boardModify(boardVO);
		return "redirect:/boardView?bNum="+boardVO.getbNum()+"&id="+session.getAttribute("id");
	}

	public ModelAndView boardDelete(BoardVO boardVO) {
		mav = new ModelAndView();
		int result = boardDAO.boardDelete(boardVO);
		return mav;
	}

	public ModelAndView boardComment(CommentVO commentVO) {
		mav = new ModelAndView();
		boardDAO.boardComment(commentVO);
		return mav;
	}

	public ModelAndView myBoard(BoardVO boardVO) {
		mav = new ModelAndView();
		List<BoardVO> BV = boardDAO.myBoard(boardVO);
		mav.addObject("myBoardList", BV);
		mav.addObject("idInfo", boardVO);
		mav.setViewName("myBoardList");
		return mav;
	}
	
	public void bookCheck(int bNum, HttpServletResponse response, HttpSession session2) throws IOException {
		boardVO = new BoardVO();
		boardVO.setbNum(bNum);
		String id = (String) session.getAttribute("id");
		boardVO.setId(id);
		/*북마크 여부 확인*/
		/*안되어있으면*/
		if(boardDAO.ifBooked(boardVO)==null) {
			response.getWriter().print("1");
			if (id == "") {
				response.getWriter().print("0");
			}
		/*되어있으면*/
		} else {
			response.getWriter().print("0");	
		}
		
	}

	public void bookMark(int bNum, HttpServletResponse response, HttpSession session2) throws IOException {
		System.out.println("follow아이디 : " + bNum);
		boardVO = new BoardVO();
		boardVO.setbNum(bNum);
		String id = (String) session.getAttribute("id");
		boardVO.setId(id);
		/*북마크 여부 확인*/
		/*안되어있으면*/
		if(boardDAO.ifBooked(boardVO)==null) {
			/*북마크하고*/
			boardDAO.book(boardVO);
			response.getWriter().print("1");
			if (id == "") {
				response.getWriter().print("0");
			}
		/*되어있으면*/
		} else {
			/*북마크 취소(삭제)*/
			boardDAO.deleteBooked(boardVO);
			response.getWriter().print("0");	
		}
	}
	
	public String boardGrade(BoardVO boardVO) {
		int result = boardDAO.boardGrade(boardVO);
		if(result != 0) {
			double avg = boardDAO.boardGradeAvg(boardVO).getGrade();
			System.out.println(avg);
			boardVO.setGradeavg(avg);
			System.out.println(boardVO.getGradeavg());
			boardDAO.boardGradeUpdate(boardVO);
		}
		return "redirect:/boardView?bNum="+boardVO.getbNum()+"&id="+session.getAttribute("id");
	}

	public void boardLike(BoardVO boardVO) {
		int result = boardDAO.boardLike(boardVO);
		if(result != 0) {
			boardDAO.boardLikeUpdate(boardVO);
		}
	}

	public void boardReport(BoardVO boardVO) {
		int result = boardDAO.boardReport(boardVO);
		if(result != 0) {
			boardDAO.boardReportUpdate(boardVO);
			int reportCount = boardDAO.boardReportCount(boardVO);
			if(reportCount >= 3) {
				boardDAO.boardBlindUpdate(boardVO);
			}
		}
	}

	public ModelAndView boardmain(BoardVO boardVO) {
		mav = new ModelAndView();
		List<BoardVO> boardList = boardDAO.boardBest();
		String category = boardDAO.boardFit(boardVO).getbCategory();
		boardVO.setbCategory(category);
		List<BoardVO> fitList = boardDAO.boardFitList(boardVO);
		System.out.println(boardList.size());
		mav.addObject("fitList", fitList);
		mav.addObject("bestmain", boardList);
		mav.setViewName("main");
		return mav;
	}
	
}