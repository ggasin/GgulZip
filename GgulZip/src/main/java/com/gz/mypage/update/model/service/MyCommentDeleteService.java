package com.gz.mypage.update.model.service;

import java.sql.Connection;

import com.gz.common.JDBCTemplate;
import com.gz.mypage.update.model.dao.MyCommentDeleteDao;

public class MyCommentDeleteService {

	//내가 쓴 댓글 삭제 메소드
	public int deleteLike(int mno, String[] commentNoArr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MyCommentDeleteDao().deleteLike(conn,mno,commentNoArr);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
