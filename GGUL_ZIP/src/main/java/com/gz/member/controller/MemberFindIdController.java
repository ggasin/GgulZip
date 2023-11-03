package com.gz.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gz.member.model.service.MemberService;

/**
 * Servlet implementation class UserFindIdController
 */
@WebServlet("/findId.me")
public class MemberFindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/memberFindIdForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		String memberId = new MemberService().findId(memberName,email);
		
		System.out.println(memberId);
		
		if (memberId != null) {
			request.setAttribute("memberId", memberId);
			request.getRequestDispatcher("views/common/findId.jsp").forward(request, response); 	
		} else {
			request.setAttribute("errorMsg", "없는 회원이거나 잘못된 회원정보를 입력하셨습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

}
