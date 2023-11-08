package com.gz.post.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.gz.comment.model.vo.Comment;
import com.gz.common.JDBCTemplate;
import com.gz.common.model.vo.PageInfo;
import com.gz.member.model.vo.Member;
import com.gz.post.model.vo.Attachment;
import com.gz.post.model.vo.Post;

public class PostDao {

	private Properties prop = new Properties();
	
	public PostDao() {
	
		try {
			String filePath = PostDao.class.getResource("/db/sql/post-mapper.xml").getPath();
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
	      }
	}
	
	// 게시글 개수 조회 메소드
	public int listCount(Connection conn) {
		
		int count = 0;
	    ResultSet rset = null; 
	    Statement stmt = null; 

	    String sql = prop.getProperty("listCount");

		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			  if (rset.next()) {
		            // 조회된 게시글 개수
		            count = rset.getInt("COUNT");
		         }
		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      } finally {
		         JDBCTemplate.close(rset);
		         JDBCTemplate.close(stmt);
		      }
		      return count;

		   }

	//게시글 목록 조회메소드
	public ArrayList<Post> selectList(Connection conn, PageInfo pi) {
		
		  ArrayList<Post> list = new ArrayList<>();
	      ResultSet rset = null;
	      PreparedStatement pstmt = null;

	      String sql = prop.getProperty("selectList");
	      
	      
	      int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
	      int endRow = pi.getCurrentPage() * pi.getBoardLimit();

	      try {
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, startRow);
	         pstmt.setInt(2, endRow);

	         rset = pstmt.executeQuery();
	         while (rset.next()) {
	        	    Post post = new Post(
	        	        rset.getInt("POST_NO"),
	        	        rset.getString("CATEGORY_NAME"),
	        	        rset.getString("TITLE"),
	        	        rset.getString("CONTENT"),
	        	        rset.getInt("COUNT"),
	        	        rset.getString("MEMBER_NICKNAME"),
	        	        rset.getDate("POST_DATE")
	        	    );
	        	    
	             // Member 정보를 가져와서 post 객체에 설정
	             Member member = new Member();
	             // 여기에서 Member 정보를 ResultSet로부터 읽어와서 member 객체에 설정하는 코드를 작성

	             // post 객체에 member 정보 설정
	             post.setMember(member);

	             // 리스트에 post 객체 추가
	             list.add(post);
	         }

	     } catch (SQLException e) {
	         e.printStackTrace();
	     } finally {
	         JDBCTemplate.close(rset);
	         JDBCTemplate.close(pstmt);
	     }

	     return list;
	}

	//조회수 증가메소드
	public int increaseCount(int postNo, Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, postNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public Post selectPost(Connection conn, int postNo) {

		Post p = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			 
			if(rset.next()) {
				p = new Post(rset.getInt("POST_NO")
							, rset.getString("CATEGORY_NAME")
							, rset.getString("TITLE")
							, rset.getString("CONTENT")
							, rset.getInt("REF_BNO")
							, rset.getInt("COUNT")
							, rset.getString("MEMBER_NICKNAME")
							, rset.getDate("POST_DATE")
							, rset.getInt("INTEREST_COUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
	
		return p;
	}
	
	
	// 댓글 작성 메소드
	public int insertComment(Connection conn, Comment c) {
	    int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("insertComment");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        
	        pstmt.setInt(1, c.getPostNo());
	        pstmt.setString(2, c.getWriterNo());
	        pstmt.setString(3, c.getContent());
	        
	        result = pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCTemplate.close(pstmt);
	    }
	    
	    return result;
	}

	// 댓글 목록 조회 메소드
	public ArrayList<Comment> selectCommentList(Connection conn, int postNo) {

		ResultSet rset = null;
		ArrayList<Comment> clist = new ArrayList<>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				clist.add(new Comment(rset.getInt("COMMENT_NO")
									, rset.getString("COMMENT_CONTENT")
									, rset.getString("MEMBER_NICKNAME")
									, rset.getDate("COMMENT_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return clist;
	}
	
	
	// 게시글 등록 메소드
	   public int insertPost(Connection conn, Post p) {
		    int result = 0;
		    PreparedStatement pstmt = null;
		    String sql = prop.getProperty("insertPost");
		    try {
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, p.getMemberNo()); // MEMBER_NO
		        pstmt.setInt(2, p.getCategoryNo()); // CATEGORY_NO
		        pstmt.setString(3, p.getTitle());
		        pstmt.setString(4, p.getContent());
		      
		        result = pstmt.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        JDBCTemplate.close(pstmt);
		    }
		    return result;
		}

	   public int insertAttachment(Connection conn, Attachment at) {
	        int result = 0;
	        PreparedStatement pstmt = null;
	        String sql = prop.getProperty("insertAttachment");
	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, at.getOriginName());
	            pstmt.setString(2, at.getChangeName());
	            pstmt.setString(3, at.getFilePath());
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } finally {
	            JDBCTemplate.close(pstmt);
	        }
	        return result;
	    }
	   
	   public ArrayList<Post> selectPost(Connection conn, String searchCondition, String searchValue) {
		    PreparedStatement pstmt = null;
		    ResultSet rset = null;
		    ArrayList<Post> listPost = new ArrayList<Post>();
		    String sql = prop.getProperty("selectPost"); // 목록 조회

		    if (searchCondition.equals("title")) {
		        sql = prop.getProperty("selectTitlePost");
		    } else if (searchCondition.equals("content")) {
		        sql = prop.getProperty("selectContentPost");
		    } else if (searchCondition.equals("nickname")) {
		        sql = prop.getProperty("selectNicknamePost");
		    } else if (searchCondition.equals("titlecontent")) {
		        sql = prop.getProperty("selectTitleContentPost");
		    }

		    try {
		        pstmt = conn.prepareStatement(sql);
		        if (searchCondition.equals("title") || searchCondition.equals("content") || searchCondition.equals("nickname")) {
		            pstmt.setString(1, "%" + searchValue + "%");
		        } else if (searchCondition.equals("titlecontent")) {
		            pstmt.setString(1, "%" + searchValue + "%");
		            pstmt.setString(2, "%" + searchValue + "%");
		        }

		        rset = pstmt.executeQuery();

		        while (rset.next()) {
		            listPost.add(new Post(
		                rset.getInt("POST_NO"),
		                rset.getString("CATEGORY_NAME"),
		                rset.getString("TITLE"),
		                rset.getString("CONTENT"),
		                rset.getInt("COUNT"),
		                rset.getString("MEMBER_NICKNAME"),
		                rset.getDate("POST_DATE")
		            ));
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        JDBCTemplate.close(rset);
		        JDBCTemplate.close(pstmt);
		    }

		    return listPost;
		}
	}

