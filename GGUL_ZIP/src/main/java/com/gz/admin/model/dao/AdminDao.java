package com.gz.admin.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.gz.admin.model.vo.Member;
import com.gz.common.JDBCTemplate;
import com.gz.common.model.vo.SelectPageInfo;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String filePath = AdminDao.class.getResource("/db/sql/admin-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//회원 개수 조회
	public int listCount(Connection conn) {
		int count = 0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return count;
	}
	
	//회원 목록 조회
	public ArrayList<Member> selectUserList(Connection conn, SelectPageInfo pi) {

		ArrayList<Member> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectUserList");
		
		int startRow = (pi.getCurrentPage()-1)*pi.getSelectLimit()+1;
		int endRow = pi.getCurrentPage()*pi.getSelectLimit();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
				
			while(rset.next()) {
				
				list.add(new Member(rset.getInt("MEMBER_NO")
									,rset.getString("MEMBER_ID")
									,rset.getString("MEMBER_NAME")
									,rset.getString("MEMBER_NICKNAME")
									,rset.getString("MEMBER_EMAIL")
									,rset.getDate("MEMBER_ENROLL_DATE")
									,rset.getString("MEMBER_GRADE")
									,rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
}
