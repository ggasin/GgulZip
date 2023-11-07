package com.gz.mypage.update.model.service;

import java.sql.Connection;

import org.apache.tomcat.dbcp.dbcp2.Jdbc41Bridge;

import com.gz.common.JDBCTemplate;
import com.gz.mypage.update.model.dao.MemberUpdateDao;

public class MemberUpdateService {

	public int updateMember(String userId, String userName, String userNickName, String email) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberUpdateDao().updateMember(conn,userId,userName,userNickName,email);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
