package com.gz.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gz.admin.model.service.CategoryService;

/**
 * Servlet implementation class CategoryDeleteController
 */
@WebServlet("/deleteCategory.ad")
public class CategoryDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryDeleteController() {
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
		
		String categoryName = request.getParameter("name2");
		int categoryNo = Integer.parseInt(request.getParameter("no2"));
		
		int result = new CategoryService().deleteCategory(categoryName,categoryNo);
		
		System.out.println(categoryName);
		System.out.println(categoryNo);
		
		if(result>0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "카테고리 삭제 성공 !");
			response.sendRedirect(request.getContextPath()+"/category.ad");
		}else {
			request.setAttribute("errorMsg", "카테고리 삭제 실패 !");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

}
