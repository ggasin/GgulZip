package com.gz.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gz.admin.model.dao.AdminDao;
import com.gz.member.model.vo.Member;
import com.gz.common.JDBCTemplate;
import com.gz.common.model.vo.SelectPageInfo;

public class AdminService {
	
	//회원 개수 조회
	public int listCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new AdminDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	//회원 목록 조회
	public ArrayList<Member> selectUserList(SelectPageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new AdminDao().selectUserList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		
		return list;
	}
}
