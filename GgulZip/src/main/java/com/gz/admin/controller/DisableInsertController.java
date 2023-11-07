package com.gz.admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gz.admin.model.service.AdminService;
import com.gz.member.model.vo.Member;

/**
 * Servlet implementation class DisableInsertController
 */
@WebServlet("/disableInsert.ad")
public class DisableInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisableInsertController() {
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
		
		//정지회원 정지사유 추가 및 업데이트 후 조회 
		String memberId = request.getParameter("memberId2");
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
		Date enrolldate = Date(request.getParameter("enrolldate"));
		String reason = request.getParameter("reason2");//정지사유
		
		Member d = new Member(memberId,memberName,email,enrolldate,reason);
		
		Member updateM = new AdminService().insertDisable(d);
		
		HttpSession session = request.getSession(); 
		
		if(updateM != null) {
			
			session.setAttribute("alertMsg", "수정성공");
			response.sendRedirect(request.getContextPath()+"/disable.ad");
			
		}else {
			request.setAttribute("errorMsg", "수정실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			System.out.println(memberId);
			System.out.println(memberName);
			System.out.println(email);
			System.out.println(enrolldate);
			System.out.println(reason);
			
		}
	}

	private Date Date(String parameter) {
		// TODO Auto-generated method stub
		return null;
	}
}
