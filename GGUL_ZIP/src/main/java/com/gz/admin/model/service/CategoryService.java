package com.gz.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gz.admin.model.dao.CategoryDao;
import com.gz.admin.model.vo.Category;
import com.gz.common.JDBCTemplate;

public class CategoryService {
	
	//카테고리 목록 조회
	public ArrayList<Category> selectClist() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Category> clist = new CategoryDao().selectClist(conn);
		
		return clist;
	}
	
	//카테고리 추가
	public int insertCategpry(Category c) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new CategoryDao().insertCategpry(conn, c);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	
}
