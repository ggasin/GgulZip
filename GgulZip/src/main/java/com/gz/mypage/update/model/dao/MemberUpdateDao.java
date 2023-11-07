package com.gz.mypage.update.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.gz.common.JDBCTemplate;

public class MemberUpdateDao {
	private Properties prop = new Properties();
	
	public MemberUpdateDao() {
		String filePath = MemberUpdateDao.class.getResource("/db/sql/mypage-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//멤버 정보 업데이트
	public int updateMember(Connection conn,String userId, String userName, String userNickName, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userName);
			pstmt.setString(2, userNickName);
			pstmt.setString(3, email);
			pstmt.setString(4, email);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
