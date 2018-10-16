package com.jkl.hpot.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.jkl.hpot.dao.BoardDAO;
import com.jkl.hpot.dao.MemberDAO;
import com.jkl.hpot.vo.BoardVO;
import com.jkl.hpot.vo.MemberVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private BoardDAO bdao;

	private ModelAndView mav;

	private MemberVO memberVO;
	@Autowired
	private HttpSession session;

	@Autowired
	private BCryptPasswordEncoder passEncoder;

	public ModelAndView memberJoin(MemberVO memberVO) throws Exception {
		mav = new ModelAndView();
		memberVO.setApprovalkey(create_key());
		int result = mdao.memberJoin(memberVO);
		if (result == 0) {
			mav.addObject("msg", "회원가입실패");
			mav.setViewName("login");

		} else {
			mav.addObject("msg", "회원가입");
			session.setAttribute("id", memberVO.getId());
			mav.setViewName("main");
		}

		return mav;
	}

	public String memberLogin(MemberVO memberVO, HttpServletResponse response ,HttpServletRequest request) throws IOException {
		MemberVO mv = mdao.memberLogin(memberVO);
		String url=null;
		/*mav.addObject("info", mv);*/
		request.setAttribute("info", mv);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (mv != null) {
			if (passEncoder.matches(memberVO.getPassword(), mv.getPassword())) {
				session.setAttribute("id", memberVO.getId());
				url="redirect:/main";
			} else {
				out.println("<script>");
				out.println("alert('아이디 또는 비밀번호를 확인해주세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				url= "redirect:/login";
			}
		} else {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호를 확인해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			url= "redirect:/login";
		}

		return url;
	}

	public ModelAndView memberLogout(MemberVO memberVO) {
		mav = new ModelAndView();
		session.invalidate();
		mav.addObject("logout", "로그아웃");
		mav.setViewName("redirect:/login");
		return mav;
	}

	public ModelAndView memberList(MemberVO memberVO) {
		mav = new ModelAndView();
		List<MemberVO> mv = mdao.memberList(memberVO);
		mav.addObject("list", mv);
		mav.setViewName("memberList");
		return mav;
	}

	public ModelAndView memberInfo(MemberVO memberVO) {
		mav = new ModelAndView();
		MemberVO mv = new MemberVO();
		mv = mdao.memberInfo(memberVO);
		mav.addObject("info", mv);
		mav.setViewName("memberInfo");
		return mav;
	}

	public void memberDelete(String id) {
		mdao.memberDelete(id);
	}

	public ModelAndView memberalter(MemberVO memberVO) {
		mav = new ModelAndView();
		memberVO = mdao.memberAlter(memberVO);
		mav.addObject("info", memberVO);
		mav.setViewName("redirect:/memberinfomation");
		return mav;
	}

	public ModelAndView idfind(MemberVO memberVO) {
		mav = new ModelAndView();
		List<MemberVO> mv = mdao.idFind(memberVO);
		mav.addObject("idfind", mv);
		mav.setViewName("idFind2");
		return mav;
	}

	public ModelAndView pwfind(MemberVO memberVO) throws Exception {
		mav = new ModelAndView();
		MemberVO mv = new MemberVO();
		mv = mdao.pwFind(memberVO);
		if (mv != null) {
			mav.addObject("pwfind", mv);
			mav.addObject("msg3", "인증이 완료되었습니다. 비밀번호를 변경해주세요");
			if (mv.getApprovalstatus().equals("true")) {
				mav.setViewName("pwFind3");
			} else {
				send_mail(mv);
				mav.setViewName("pwFind2");
			}
		} else {
			mav.addObject("iderror", "입력한 아이디가 존재하지 않습니다");
			mav.setViewName("pwFind");
		}

		return mav;
	}

	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	// 이메일 발송
	public void send_mail(MemberVO memberVO) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "bcno2008";
		String hostSMTPpwd = "a8728824";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "bcno2008@naver.com";
		String fromName = "HoneyPot";
		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "HoneyPot의 비밀번호 변경 본인인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += memberVO.getId() + "님의 비밀번호 변경이 요청되어 인증메일이 전송됬습니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 인증이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://192.168.0.147:8040/hpot/approvalmember'>";
		msg += "<input type='hidden' name='id' value='" + memberVO.getId() + "'>";
		msg += "<input type='hidden' name='email' value='" + memberVO.getEmail() + "'>";
		msg += "<input type='hidden' name='approvalkey' value='" + memberVO.getApprovalkey() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		System.out.println(memberVO.getEmail());
		String mail = memberVO.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 회원 인증
	public ModelAndView approval_member(MemberVO memberVO) {
		mav = new ModelAndView();
		memberVO = mdao.approval_member(memberVO);
		return mav;
	}

	public void pwalter(MemberVO memberVO, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (mdao.pwAlter(memberVO) == 0) {
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('변경이 완료되었습니다. 처음부터 로그인해주세요');");
			out.println("location.href='login'");
			out.println("</script>");
			out.close();
		}
	}

	public void idOverlap(String id, HttpServletResponse response) throws Exception {
		System.out.println("아이디 : " + id);
		memberVO = new MemberVO();
		memberVO = mdao.idOverlap(id);
		if (memberVO == null) {
			response.getWriter().print("1");
			if (id == "") {
				response.getWriter().print("0");
			}
		} else {
			response.getWriter().print("0");
		}
	}
	
	//팔로우 메소드
	public void follow(String followId, HttpServletResponse response, HttpSession session) throws Exception { 
		System.out.println("follow아이디 : " + followId);
		memberVO = new MemberVO();
		memberVO.setFollowId(followId);
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);
		/*팔로우 여부 확인*/
		/*안되어있으면*/
		if(mdao.ifFollow(memberVO)==null) {
			/*팔로우하고*/
			mdao.follow(memberVO);
			response.getWriter().print("1");
			if (id == "") {
				response.getWriter().print("0");
			}
		/*되어있으면*/
		} else {
			/*팔로우 취소(삭제)*/
			mdao.deleteFollow(memberVO);
			response.getWriter().print("0");	
		}
	}

	//팔로우 여부 확인 메소드
	public void followCheck(String followId, HttpServletResponse response, HttpSession session2) throws IOException {
		memberVO = new MemberVO();
		memberVO.setFollowId(followId);
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);
		/*팔로우 여부 확인*/
		/*안되어있으면*/
		if(mdao.ifFollow(memberVO)==null) {
			response.getWriter().print("1");
			if (id == "") {
				response.getWriter().print("0");
			}
		/*되어있으면*/
		} else {
			response.getWriter().print("0");	
		}
	}
	
	public ModelAndView following(MemberVO memberVO) {
		mav = new ModelAndView();
		//팔로우중인 사람들 리스트 불러오기
		List<MemberVO> mv = mdao.followingList(memberVO);
		List<BoardVO> bv = null;
		List<List<BoardVO>> st = new ArrayList<List<BoardVO>>();
		
		System.out.println("설마 안들어감?");
		for(MemberVO fl : mv) {
			System.out.println("testid    :     "+fl.getFollowId());
			bv = new ArrayList<BoardVO>();
			bv = bdao.getfollowingBoard(fl.getFollowId());
			st.add(bv);
		}
		
		mav.addObject("followingList", mv);
		mav.addObject("BoardList", st);
		mav.addObject("idInfo", memberVO.getId());
		mav.setViewName("followingList");
		return mav;
	}

}
