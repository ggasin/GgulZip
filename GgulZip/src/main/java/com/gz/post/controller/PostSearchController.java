package com.gz.post.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gz.post.model.service.PostService;
import com.gz.post.model.vo.Post;


/**
 * Servlet implementation class BoardSearchController
 */
@WebServlet("/pSearch.po")
public class PostSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Post> listPost;
		String searchCondition = request.getParameter("searchCondition"); // 검색 조건
		String searchValue = request.getParameter("searchValue"); // 검색값
		// 검색 결과
		listPost = new PostService().selectPost(searchCondition, searchValue);
		
		if (listPost != null) {
			request.setAttribute("listPost", listPost);
			request.getRequestDispatcher("/views/post/postListView.jsp").forward(request, response);;
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}