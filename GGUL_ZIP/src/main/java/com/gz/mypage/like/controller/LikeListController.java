package com.gz.mypage.like.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.gz.mypage.like.model.service.LikeService;
import com.gz.mypage.like.model.vo.Like;
import com.gz.mypage.like.model.vo.LikePageInfo;

@WebServlet("/likeList.ll")
public class LikeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LikeListController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int mno = Integer.parseInt(request.getParameter("mno"));



		// 게시글 목록 조회하기(페이징처리된)
		ArrayList<Like> list = new LikeService().selectList(mno);
		//System.out.println(list);
		// 페이징정보랑 게시글 목록을 담는 list
//		ArrayList totalList = new ArrayList();
//		totalList.add(list);
//		totalList.add(pi);
		System.out.println("dsd");

		 //응답 
		response.setContentType("json/application; charset=UTF-8"); //한번에 처리
		 //(gson을 이용한 list 전달) 
		 new Gson().toJson(list,response.getWriter());
		 

//		request.setAttribute("likeList", list);
//		request.setAttribute("pi", pi);
//		request.getRequestDispatcher("views/mypage/likeTabe.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
