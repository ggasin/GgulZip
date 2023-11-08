package com.gz.mypage.update.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gz.mypage.update.model.service.MoveService;


@WebServlet("/moveFolder.my")
public class MoveFolderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MoveFolderController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		int targetFolderNo = Integer.parseInt(request.getParameter("targetFolderNo"));
		String[] folderNoArr = request.getParameterValues("folderNoArr[]");
		String[] postNoArr = request.getParameterValues("postNoArr[]");
		System.out.println(mno);
		System.out.println(targetFolderNo);
		System.out.println(Arrays.toString(folderNoArr));
		System.out.println(Arrays.toString(postNoArr));
		int result = new MoveService().moveFolder(mno,targetFolderNo,folderNoArr,postNoArr);
		
		if(result > 0) {
			response.getWriter().print("success");
		} else {
			response.getWriter().print("fail");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
