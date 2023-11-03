package com.gz.mypage.like.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.gz.common.JDBCTemplate;
import com.gz.mypage.interest.model.dao.InterestDao;
import com.gz.mypage.like.model.vo.Like;
import com.gz.mypage.like.model.vo.LikePageInfo;

public class LikeDao {
	private Properties prop = new Properties();
	
	public LikeDao() {
		String filePath = LikeDao.class.getResource("/db/sql/my-like-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//좋아요 한 게시글 개수 조회
	public int listCount(Connection conn,int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("listCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return count;
	}
	
	//좋아요한 글 조회해오기
	public ArrayList<Like> selectList(Connection conn, int mno) {
		ArrayList<Like> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {

				list.add(new Like(
							rset.getInt("POST_NO")
						   ,rset.getString("CATEGORY_NAME")
						   ,rset.getString("TITLE")
						   ,rset.getString("MEMBER_NICKNAME")
						   ,rset.getInt("COUNT")
						   ,rset.getDate("POST_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
