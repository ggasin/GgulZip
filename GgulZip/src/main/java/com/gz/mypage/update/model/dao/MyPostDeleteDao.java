package com.gz.mypage.update.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.gz.common.JDBCTemplate;



public class MyPostDeleteDao {
	private Properties prop = new Properties();
	
	public MyPostDeleteDao() {
		String filePath = MyPostDeleteDao.class.getResource("/db/sql/mypage-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//내가 쓴 글 삭제 메소드
	public int deleteLike(Connection conn, int mno, String[] postNoArr) {
		PreparedStatement pstmt = null;
		int result = 1;
		String sql = prop.getProperty("deleteMyPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<postNoArr.length;i++) {
				pstmt.setInt(1, mno);
				pstmt.setInt(2, Integer.parseInt(postNoArr[i]));
				result *=pstmt.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
}
