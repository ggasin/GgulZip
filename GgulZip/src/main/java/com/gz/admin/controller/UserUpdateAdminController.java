package com.gz.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gz.admin.model.service.AdminService;
import com.gz.member.model.vo.Member;

/**
 * Servlet implementation class UserUpdateAdminController
 */
@WebServlet("/update.ad")
public class UserUpdateAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String grade = request.getParameter("grade");
		String status = request.getParameter("status");
		String reason = request.getParameter("reason");
//		Member m = new Member();
//		//회원번호로 disable 테이블에 memberNo가 있는지 확인 후 있으면 지금 넘겨받은 status랑 확인후 같은지 다른지에 따라 처리하기
//		int count = new AdminService().selectDisable(memberNo);
//		
//		
//		//정지회원일떄
//		if(count>0) {
//			if(status.equals("Y")) {//status 변경되었으면 
//				
//			}else {//변경되지않았으면
//				
//			}
//			
//		}else {//정지회원 아닐떄 
//			if(status.equals("N")) {//정지되면 
//				
//			}
//		}
//		
		
		Member m = new Member(memberNo,grade,status,reason);
		
		int result = new AdminService().updateMember(m);
		
		HttpSession session = request.getSession();
		if(result>0) {
				session.setAttribute("alertMsg", "회원 정보 수정 성공");
				response.sendRedirect(request.getContextPath()+"/selectUser.ad?currentPage=1");
		}else {
			session.setAttribute("alertMsg", "회원 정보 수정 실패.");
			response.sendRedirect(request.getContextPath()+"/selectUser.ad?currentPage=1");
		}
	}
}