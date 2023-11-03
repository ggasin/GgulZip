package com.gz.post.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gz.common.JDBCTemplate;
import com.gz.common.model.vo.PageInfo;
import com.gz.post.model.dao.PostDao;
import com.gz.post.model.vo.Post;

public class PostService {


	public int listCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new PostDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	
	// 게시글 목록 조회메소드
	public ArrayList<Post> selectList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Post> list = new PostDao().selectList(conn, pi);
		JDBCTemplate.close(conn);
		
		return list;
	}

	// 조회수 증가 메소드
	public int increaseCount(int pNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new PostDao().increaseCount(pNo, conn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	// 게시글 상세조회
	public Post selectPost(int postNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Post p = new PostDao().selectPost(conn, postNo);
		
		JDBCTemplate.close(conn);
		
		return p;
	}

}
