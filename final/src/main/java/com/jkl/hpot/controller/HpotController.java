package com.jkl.hpot.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jkl.hpot.entity.UploadFile;
import com.jkl.hpot.service.BoardService;
/*import com.jkl.hpot.service.ImageService;*/
import com.jkl.hpot.service.MemberService;
import com.jkl.hpot.util.MediaUtils;
import com.jkl.hpot.vo.BoardVO;
import com.jkl.hpot.vo.CommentVO;
import com.jkl.hpot.vo.MemberVO;


@Controller
public class HpotController {

	@Autowired
	private BoardService bs;
	private ModelAndView mav;
	
	/*@Autowired
    private ImageService is;*/
	
	@Autowired
	private MemberService ms;

	@Autowired
	private BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/Livechat", method = RequestMethod.GET)
	public String liveChat() {

		return "chat2";
	}
		
	
	@RequestMapping(value = "/follow", method = { RequestMethod.GET, RequestMethod.POST })
	public void follow(HttpServletResponse response, @RequestParam("id") String followId, HttpSession session) throws Exception {
		ms.follow(followId, response, session);
	}
	@RequestMapping(value = "/followCheck", method = { RequestMethod.GET, RequestMethod.POST })
	public void followCheck(HttpServletResponse response, @RequestParam("id") String followId, HttpSession session) throws Exception {
		ms.followCheck(followId, response, session);
	}
	/*@RequestMapping(value = "/memberInfo", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberInfo(@RequestParam("id") String id) {
		mav = new ModelAndView();
		mav = ms.memberInfo(id);
		return mav;
	}*/

	/*
	 * @RequestMapping(value = "/boardList", method = RequestMethod.GET) public
	 * ModelAndView myBoard(HttpServletRequest request, HttpServletResponse
	 * response, @ModelAttribute BoardVO boardVO) {
	 * response.setContentType("text/html;charset=UTF-8"); mav = new ModelAndView();
	 * int page=1; int limit=12; String category = request.getParameter("category");
	 * System.out.println(request.getParameter("array")); if
	 * (request.getParameter("page") != null) { page =
	 * Integer.parseInt(request.getParameter("page")); }
	 * if(request.getParameter("search")!=null) { String option =
	 * request.getParameter("option"); String search =
	 * request.getParameter("search"); if(option.equals("제목")) {
	 * boardVO.setbSubject(search); boardVO.setSearchValue(search);
	 * boardVO.setColumn("BSUBJECT"); boardVO.setInSearch(1); }else
	 * if(option.equals("태그")) { boardVO.setbTag(search);
	 * boardVO.setSearchValue(search); boardVO.setColumn("BTAG");
	 * boardVO.setInSearch(2); }else if(option.equals("작성자")) {
	 * boardVO.setId(search); System.out.println(boardVO.getId());
	 * boardVO.setSearchValue(search); boardVO.setColumn("ID");
	 * boardVO.setInSearch(3); }else { boardVO.setbContent(search);
	 * boardVO.setSearchValue(search); boardVO.setColumn("BCONTENT");
	 * boardVO.setInSearch(4); }
	 * System.out.println("컬럼= "+boardVO.getColumn()+" 검색값 ="+boardVO.getSearchValue
	 * ()); mav = bs.boardList(boardVO,page,limit); } if
	 * (request.getParameter("array")!=null) {
	 * if(request.getParameter("array").equals("평점")) { boardVO.setInArray(1); }else
	 * if(request.getParameter("array").equals("조회")) { boardVO.setInArray(2); }else
	 * if(request.getParameter("array").equals("추천")){ boardVO.setInArray(3); }else
	 * { boardVO.setInArray(4); } } if (category!=null) {
	 * boardVO.setbCategory(request.getParameter("category"));
	 * System.out.println("array = "+boardVO.getInArray()); boardVO.setInCate(1);
	 * System.out.println(boardVO.getInCate()); String which =
	 * request.getParameter("which"); System.out.println(which);
	 * boardVO.setbWhich(which); mav = bs.boardList(boardVO,page,limit); }else
	 * if(request.getParameter("option")==null){
	 * System.out.println(request.getParameter("array"));
	 * System.out.println("array = "+boardVO.getInArray());
	 * System.out.println(boardVO.getInCate()); String which =
	 * request.getParameter("which"); System.out.println(which);
	 * boardVO.setbWhich(which); mav = bs.boardList(boardVO,page,limit); } return
	 * mav; }
	 */

	/////////////////////////////////////////////////////// 영표////////////////////////////////////////////////////

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String start() {

		return "main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return "login";
	}

	/*
	 * @RequestMapping(value = "/main", method = RequestMethod.GET) public String
	 * main() {
	 * 
	 * return "main"; }
	 */

	// 회원가입 처리
	@RequestMapping(value = "/memberjoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(@ModelAttribute MemberVO memberVO) throws Exception {
		mav = new ModelAndView();
		String encPassword = passEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encPassword);
		mav = ms.memberJoin(memberVO);
		return mav;
	}

	// 로그인 처리
	@RequestMapping(value = "/memberlogin", method = RequestMethod.POST)
	public ModelAndView memberLogin(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		mav = ms.memberLogin(memberVO, response);
		return mav;
	}

	// 아이디찾기
	@RequestMapping(value = "/idfind", method = RequestMethod.GET)
	public String idFind() {
		return "idFind";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/pwfind", method = RequestMethod.GET)
	public String pwFind() {
		return "pwFind";
	}

	// 비밀번호 찾기 - 비밀번호변경경로
	@RequestMapping(value = "/pwfind3", method = RequestMethod.GET)
	public String pwFind3() {
		return "pwFind3";
	}

	// 로그아웃 처리
	@RequestMapping(value = "/memberlogout", method = RequestMethod.GET)
	public ModelAndView memberLogout(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		mav = ms.memberLogout(memberVO);
		return mav;
	}

	// 관리자의 회원목록 열람
	@RequestMapping(value = "/memberlist", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberList(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		mav = ms.memberList(memberVO);
		return mav;
	}

	// 회원의 내정보 열람
	@RequestMapping(value = "/memberinfomation", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView memberinfo(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		memberVO.setId((String) session.getAttribute("id"));
		mav = ms.memberInfo(memberVO);
		return mav;
	}
	
	// 다른회원의 내정보 열람
	@RequestMapping(value = "/MI", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView MI(@RequestParam("id") String id) {
		mav = new ModelAndView();
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		mav = ms.memberInfo(memberVO);
		return mav;
	}

	// 관리자의 회원 삭제
	@RequestMapping(value = "/memberdelete", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberdelete(@RequestParam("id") String id) {
		ms.memberDelete(id);
		return "redirect:/memberlist";
	}

	// 회원의 내정보 열람
	@RequestMapping(value = "/memberalter", method = RequestMethod.POST)
	public ModelAndView memberalter(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		String encPassword = passEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encPassword);
		mav = ms.memberalter(memberVO);
		return mav;
	}

	// 아이디찾기
	@RequestMapping(value = "/idfindservice", method = RequestMethod.POST)
	public ModelAndView memberidfindservice(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		mav = ms.idfind(memberVO);
		return mav;
	}

	@RequestMapping(value = "/pwfindservice", method = RequestMethod.POST)
	public ModelAndView memberpwfindservice(@ModelAttribute MemberVO memberVO) throws Exception {
		mav = new ModelAndView();
		mav = ms.pwfind(memberVO);
		return mav;
	}

	// 회원 인증
	@RequestMapping(value = "/approvalmember", method = RequestMethod.POST)
	public ModelAndView approval_member(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		ms.approval_member(memberVO);
		mav.addObject("pwfind", memberVO);
		mav.addObject("msg3", "인증이 완료되었습니다. 비밀번호를 변경해주세요");
		mav.setViewName("pwFind3");
		return mav;
	}

	// 비밀번호 변경
	@RequestMapping(value = "/pwalter", method = RequestMethod.POST)
	public void pwalter(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception {
		String encPassword = passEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encPassword);
		ms.pwalter(memberVO, response);
	}

	// 아이디 중복확인
	@RequestMapping(value = "idOverlap", method = RequestMethod.POST)
	public void idOverlap(HttpServletResponse response, @RequestParam("id") String id) throws Exception {
		ms.idOverlap(id, response);
	}

	/////////////////////////////////////////////////////// 준호////////////////////////////////////////////////////
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(HttpServletRequest request) { String which = null;
	 * request.setAttribute("which", which); return "main"; }
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpSession session) {

		String id = (String) session.getAttribute("id");
		if (id == null) {
			
		} else {
			
		}

		String which = null;
		request.setAttribute("which", which);
		return "main";
	}

	@RequestMapping(value = "/postCheck", method = RequestMethod.GET)
	public ModelAndView post(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		String which = request.getParameter("which");
		if (which.equals("")) {
			mav.addObject("msg", "게시판을 선택해주세요.");
		} else {
			request.setAttribute("which", which);
			mav.setViewName("post");
		}
		return mav;
	}

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute BoardVO boardVO) {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		String which = request.getParameter("which");
		System.out.println(which);
		boardVO.setbWhich(which);
		int page = 1;
		int limit = 12;
		if(which.equals("영화")) {
			limit = 9;
		}else if(which.equals("지름")){
			limit = 20;
		}else {
			limit = 12;
		}
		String category = request.getParameter("category");
		System.out.println(request.getParameter("array"));
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("search") != null) {
			String option = request.getParameter("option");
			String search = request.getParameter("search");
			if (option.equals("제목")) {
				boardVO.setbSubject(search);
				boardVO.setSearchValue(search);
				boardVO.setColumn("BSUBJECT");
				boardVO.setInSearch(1);
			} else if (option.equals("태그")) {
				boardVO.setbTag(search);
				boardVO.setSearchValue(search);
				boardVO.setColumn("BTAG");
				boardVO.setInSearch(2);
			} else if (option.equals("작성자")) {
				boardVO.setId(search);
				System.out.println(boardVO.getId());
				boardVO.setSearchValue(search);
				boardVO.setColumn("ID");
				boardVO.setInSearch(3);
			} else {
				boardVO.setbContent(search);
				boardVO.setSearchValue(search);
				boardVO.setColumn("BCONTENT");
				boardVO.setInSearch(4);
			}
			System.out.println("컬럼= " + boardVO.getColumn() + " 검색값 =" + boardVO.getSearchValue());
			mav = bs.boardList(boardVO, page, limit);
		}
		if (request.getParameter("array") != null) {
			if (request.getParameter("array").equals("평점")) {
				boardVO.setInArray(1);
			} else if (request.getParameter("array").equals("조회")) {
				boardVO.setInArray(2);
			} else if (request.getParameter("array").equals("추천")) {
				boardVO.setInArray(3);
			} else {
				boardVO.setInArray(4);
			}
		}
		if (category != null) {
			boardVO.setbCategory(request.getParameter("category"));
			System.out.println("array = " + boardVO.getInArray());
			boardVO.setInCate(1);
			System.out.println(boardVO.getInCate());
			mav = bs.boardList(boardVO, page, limit);
		} else if (request.getParameter("option") == null) {
			System.out.println(request.getParameter("array"));
			System.out.println("array = " + boardVO.getInArray());
			System.out.println(boardVO.getInCate());
			mav = bs.boardList(boardVO, page, limit);
		}
		return mav;
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	   public String boardWrite(HttpServletRequest request, HttpServletResponse response, @RequestParam("mapu") String mapu, @RequestParam("mapk") String mapk, @ModelAttribute BoardVO boardVO,
	         MultipartFile file) throws IllegalStateException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	      if (boardVO.getbThumb() != null) {
	         MultipartFile bThumb = boardVO.getbThumb();
	         ServletContext context = request.getServletContext();
	         String savePath = context.getRealPath("/resources/img/");
	         /*
	          * "C:\\Users\\user\\Documents\\workspace-sts-3.9.5.RELEASE\\final\\src\\main\\webapp\\resources\\img\\";
	          */

	         String originalFilename = bThumb.getOriginalFilename(); // fileName.jpg
	         String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	         String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg

	         String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
	         String fullPath = savePath + "\\" + rename;
	         if (!bThumb.isEmpty()) {
	            byte[] bytes = bThumb.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	            boardVO.setbThumbname(rename);
	         }
	      }
	      System.out.println(
	            "작성내용:" + boardVO.getbThumb() + "/" + boardVO.getbCategory() + "/" + boardVO.getbThumbname());
	      boardVO.setMapu(mapu);
	      boardVO.setMapk(mapk);
	      bs.boardWrite(boardVO);
	      String which = URLEncoder.encode(boardVO.getbWhich(), "UTF-8");
	      return "redirect:/boardList?which=" + which;
	   }

	public String getCurrentDayTime() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
		return dayTime.format(new Date(time));
	}

	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	public ModelAndView boardView(HttpServletRequest request, @ModelAttribute BoardVO boardVO, @ModelAttribute CommentVO commentVO) {
		mav = new ModelAndView();
		int view = Integer.parseInt(request.getParameter("bNum"));
		boardVO.setId(request.getParameter("id"));
		boardVO.setbNum(view);
		commentVO.setbNum(view);
		mav = bs.boardView(boardVO,commentVO);

		return mav;
	}

	@RequestMapping(value = "/modifyForm", method = RequestMethod.GET)
	public ModelAndView modifyForm(HttpServletRequest request, @ModelAttribute BoardVO boardVO) {
		mav = new ModelAndView();
		int bnum = Integer.parseInt(request.getParameter("bNum"));
		boardVO.setbNum(bnum);
		mav = bs.modifyForm(boardVO);
		return mav;
	}

	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(HttpServletRequest request, HttpServletResponse response, @ModelAttribute BoardVO boardVO)
			throws UnsupportedEncodingException {
		response.setContentType("text/html;charset=UTF-8");
	
		int view = Integer.parseInt(request.getParameter("bNum"));
		boardVO.setbNum(view);
		String which = URLEncoder.encode(request.getParameter("which"), "UTF-8");
		bs.boardDelete(boardVO);
		return "redirect:/boardList?which=" + which;
	}

	@RequestMapping(value = "/boardComment", method = RequestMethod.POST)
	public String boardComment(HttpServletRequest request, @ModelAttribute CommentVO commentVO) {
		bs.boardComment(commentVO);
		return "redirect:/boardView?bNum="+commentVO.getbNum()+"&id="+session.getAttribute("id");
	}
	
	@RequestMapping(value = "/boardModify", method = RequestMethod.POST)
	public String boardModify(@ModelAttribute BoardVO boardVO) {
		bs.boardModify(boardVO);
		return "redirect:/boardView?bNum="+boardVO.getbNum()+"&id="+session.getAttribute("id");
	}
	
	@RequestMapping(value = "/myBoard", method = RequestMethod.POST)
	public ModelAndView myBoard(@RequestParam("id") String id) {
		mav = new ModelAndView();
		BoardVO boardVO = new BoardVO();
		boardVO.setId(id);
		mav = bs.myBoard(boardVO);
		return mav;
	}
	
	@RequestMapping(value = "/boardGrade", method = RequestMethod.POST)
	public String boardGrade(HttpServletRequest request, @ModelAttribute BoardVO boardVO) {
		bs.boardGrade(boardVO);
		return "redirect:/boardView?bNum="+boardVO.getbNum()+"&id="+session.getAttribute("id");
	}

}
