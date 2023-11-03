package com.gz.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gz.member.model.service.MemberService;
import com.gz.member.model.vo.Member;

/**
 * Servlet implementation class userLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		String saveId = request.getParameter("saveId");
		
		Cookie cookie = null;
		
		if(saveId != null && saveId.equals("on")) {
			//쿠키의 이름과 값을 넣어서 생성하기 
			cookie = new Cookie("memberId",memberId);
			//쿠키의 수명을 정해서 추가한다 
			cookie.setMaxAge(60*60*24); //하루 : 60*60*24  (초단위)
			//응답객체인 response에 쿠키 추가하기 
			response.addCookie(cookie);
		}else { //체크가 되지 않았다면 
			//쿠키 지워주기 
			cookie = new Cookie("memberId",null);
			//수명을 0으로 만들어주기 
			cookie.setMaxAge(0);
			//응답객체에 쿠키 담기 
			response.addCookie(cookie);
			
		}
		
		Member loginMember = new MemberService().loginMember(memberId,memberPwd);

		HttpSession session = request.getSession();
				
		String before = request.getHeader("referer");
		
		if (loginMember == null) {
			
			session.setAttribute("alertMsg", "로그인 실패");
			
			response.sendRedirect(before);
			
		} else {
			session.setAttribute("loginMember", loginMember); 
			session.setAttribute("alertMsg", "로그인 성공");
			response.sendRedirect(before);
		}
		
		
	}

}
