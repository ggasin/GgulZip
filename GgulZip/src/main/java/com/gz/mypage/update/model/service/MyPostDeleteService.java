package com.gz.mypage.update.model.service;

import java.sql.Connection;

import com.gz.common.JDBCTemplate;
import com.gz.mypage.update.model.dao.MyPostDeleteDao;

public class MyPostDeleteService {

	//내가 쓴 글 삭제 메소드
	public int deleteLike(int mno, String[] postNoArr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MyPostDeleteDao().deleteLike(conn,mno,postNoArr);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
