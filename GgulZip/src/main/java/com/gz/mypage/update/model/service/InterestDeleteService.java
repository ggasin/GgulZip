package com.gz.mypage.update.model.service;

import java.sql.Connection;

import com.gz.common.JDBCTemplate;
import com.gz.mypage.update.model.dao.InterestDeleteDao;

public class InterestDeleteService {

	
	//관심글 삭제 메소드
	public int deleteInterest(int mno, String[] folderNoArr, String[] postNoArr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new InterestDeleteDao().deleteInterest(conn,mno,folderNoArr,postNoArr);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
		
	}

}
