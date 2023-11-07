package com.gz.post.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.gz.post.model.service.PostService;
import com.gz.post.model.vo.Attachment;
import com.gz.post.model.vo.MyFileRenamePolicy;
import com.gz.post.model.vo.Post;
import com.oreilly.servlet.MultipartRequest;

//추천 게시판 작성 컨트롤러
@WebServlet("/RecommInsert.bo")
public class Insert_RecommController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/insert/RecommInsertForm.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	
			int categoryNo = Integer.parseInt(multiRequest.getParameter("categoryNo"));
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			//작성자 정보
			//int memberNo = ((Member)session.getAttribute("세션에 담긴 로그인정보 키값")).getMemberNo();
			int memberNo = 1;
			Post p = new Post();
			p.setMemberNo(memberNo);
			p.setContent(content);
			p.setTitle(title);
			p.setCategoryNo(categoryNo);
			
			System.out.println(categoryNo);
			System.out.println(title);
			System.out.println(content);
			
			
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("uploadFile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("uploadFile"));
				at.setChangeName(multiRequest.getFilesystemName("uploadFile"));
				at.setFilePath("/resources/uploadFiles/");
			}
			
			int result = new PostService().insertPost(p, at);
			
			if (result > 0) {
				session.setAttribute("alertMsg", "게시글 등록 성공");
				
				response.sendRedirect(request.getContextPath() + "/list.bo?currentPage=1");
			} else {
				session.setAttribute("alertMsg", "게시글 등록 실패");
				
				response.sendRedirect(request.getContextPath() + "/list.bo?currentPage=1");
				
			}
		}
	}
}