package com.gz.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gz.admin.model.service.AdminService;
import com.gz.admin.model.vo.Disable;

/**
 * Servlet implementation class DisableInsertController2
 */
@WebServlet("/insertDisable2")
public class DisableInsertController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisableInsertController2() {
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
		
		int MemberNo = Integer.parseInt(request.getParameter("memberNo"));
		String reason = request.getParameter("reason");
		
		Disable dis = new Disable();
		dis.setMemberNo(MemberNo);
		dis.setReason(reason);
		
		int result = new AdminService().insertDisable2(dis);
		
		HttpSession session = request.getSession();
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/selectUser.ad?currentPage=1");
			
		}else {
			session.setAttribute("errorMsg", "회원 정보 수정 성공");
			response.sendRedirect(request.getContextPath()+"/selectUser.ad?currentPage=1");
			
		}
		
	}

}
