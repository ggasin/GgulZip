package com.gz.post.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gz.comment.model.vo.Comment;
import com.gz.common.JDBCTemplate;
import com.gz.common.model.vo.PageInfo;
import com.gz.post.model.dao.PostDao;
import com.gz.post.model.vo.Attachment;
import com.gz.post.model.vo.Post;

public class PostService {
	private PostDao postDao = new PostDao();

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
	public int increaseCount(int postNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new PostDao().increaseCount(postNo, conn);
		
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


	public int insertComment(Comment c) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new PostDao().insertComment(conn,c);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	//댓글 목록 조회 메소드
	public ArrayList<Comment> selectCommentList(int postNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Comment> clist = new PostDao().selectCommentList(conn, postNo);
		
		JDBCTemplate.close(conn);
		
		return clist;
	}


	 public int insertPost(Post p, Attachment at) {
	        
	        Connection conn = JDBCTemplate.getConnection();
	        
	        int result = new PostDao().insertPost(conn,p);
	        
	        int result2 = 1; 
	        
	        if(at!=null) {
	            result2 = new PostDao().insertAttachment(conn,at); 
	        }
	        
	        if(result*result2>0) { 
	            
	            JDBCTemplate.commit(conn);
	        }else { 
	            JDBCTemplate.rollback(conn);
	        }
	        
	        return result*result2;
	    }

			public ArrayList<Post> selectPost(String searchCondition, String searchValue) {
				
				Connection conn = JDBCTemplate.getConnection();
				
				ArrayList<Post> listPost = new PostDao().selectPost(conn, searchCondition, searchValue);
				
				JDBCTemplate.close(conn);
				
				return listPost;
			}
			
	 }
