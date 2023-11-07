package com.gz.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.gz.admin.model.dao.AdminDao;
import com.gz.admin.model.vo.Disable;
import com.gz.member.model.vo.Member;
import com.gz.common.JDBCTemplate;
import com.gz.common.model.vo.PageInfo;

public class AdminService {
	
	//회원 개수 조회
	public int listCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new AdminDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		
		return count;
	}

	//회원 목록 조회
	public ArrayList<Member> selectUserList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> list = new AdminDao().selectUserList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	public Member updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			updateMem = new AdminDao().selectUserList2(conn, m.getMemberNo());
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return updateMem;
	}

	//회원 아이디,이름으로 검색 후 조회
	public ArrayList<Member> selectUserList2(String searchText,String searchField) {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> fist = new AdminDao().selectUserList2(conn,searchText,searchField);
		
		JDBCTemplate.close(conn);
		
		return fist;
	}

	//정지회원 조회
	public ArrayList<Member> selectDisableList() {

		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Member> dlist = new AdminDao().selectDisableList(conn);
		
		JDBCTemplate.close(conn);
		
		return dlist;
	}

	//정지회원 정지사유 업데이트 / insert 아니고 update임
	
	public Member insertDisable(Member d) {

		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().insertDisable(conn,d);
		
		Member updateM = null;
		
		if(result>0) {
			
			JDBCTemplate.commit(conn);
			
			updateM = new AdminDao().selectDisable2(conn, d.getMemberId());
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return updateM;
		
	}

	//정지회원 테이블에 status n인 회원 추가하기 service
	public int insertDisable2(Disable dis) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().insertDisable2(conn, dis);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}