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



public class InterestDeleteDao {
	private Properties prop = new Properties();
	
	public InterestDeleteDao() {
		String filePath = InterestDeleteDao.class.getResource("/db/sql/mypage-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//관심글 삭제 메소드
	public int deleteInterest(Connection conn, int mno, String[] folderNoArr, String[] postNoArr) {
		PreparedStatement pstmt = null;
		int result = 1;
		int result2 = 1;
		ResultSet rset = null;
		String selectDeleteFolder = prop.getProperty("selectDeleteFolder");
		String deleteInterestFolder = prop.getProperty("deleteInterestFolder");
		String deleteInterestPost = prop.getProperty("deleteInterestPost");
		ArrayList<Integer> toDeleteFolderNo = new ArrayList<>();
		
		if(folderNoArr != null) {
			for(int i=0;i<folderNoArr.length;i++) {
				toDeleteFolderNo.add(Integer.parseInt(folderNoArr[i]));
			}
		}
		
		System.out.println(toDeleteFolderNo);
		try {
			if(!toDeleteFolderNo.isEmpty()) {
				//-----------------------삭제할 폴더를 찾아오는 sql문----------------------
				pstmt = conn.prepareStatement(selectDeleteFolder);
				ArrayList<Integer> tempArr = new ArrayList<Integer>();
				findFolder(rset,toDeleteFolderNo,tempArr,toDeleteFolderNo,pstmt,mno);
		
				System.out.println(toDeleteFolderNo);
				//-----------------------삭제할 폴더를 찾아온 뒤 폴더 삭제를 진행하는 sql문----------------------
				pstmt = conn.prepareStatement(deleteInterestFolder);
				for(int i=0;i<toDeleteFolderNo.size();i++) {
					pstmt.setInt(1, mno);
					pstmt.setInt(2, toDeleteFolderNo.get(i));
					result *= pstmt.executeUpdate();
					System.out.println("result : "+result);
				}
			}
			
			if(postNoArr != null) {
				//-----------------------게시글 삭제를 진행하는 sql문----------------------
				pstmt = conn.prepareStatement(deleteInterestPost);
				for(int i=0;i<postNoArr.length;i++) {
					pstmt.setInt(1, mno);
					pstmt.setInt(2, Integer.parseInt(postNoArr[i]));
					result2 *= pstmt.executeUpdate();
					System.out.println("result2 : "+result2);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		System.out.println("result*result2 : "+result*result2);
		return result*result2;
	}
	
	//재귀적으로 하위 폴더를 탐색하기 위한 함수
	public void findFolder(ResultSet rset,ArrayList<Integer> arr,ArrayList<Integer> tempArr,ArrayList<Integer> toDeleteFolderNo,PreparedStatement pstmt, int mno) {
		try {
			tempArr.clear();
			
			for(int i=0;i<arr.size();i++) {
				pstmt.setInt(1, arr.get(i));
				pstmt.setInt(2, mno);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					tempArr.add(rset.getInt("FOLDER_NO"));
				}
			}
			ArrayList<Integer> cloneTemp = new ArrayList<Integer>();
			//tempArr를 깊은복사로 복사해놓음.
			cloneTemp.addAll(tempArr);
			//최종적으로 삭제할 폴더를 담아놓음
			toDeleteFolderNo.addAll(tempArr);
			
			//만약에 tempArr가 비어있으면, 하위폴더가 없다는 의미.
			//tempArr에 값이 있으면 arr내의 값을 up_folder_no으로 가지고 있는 folder가 있다는 의미이므로 다시 함수를 불러옴.
			if(!tempArr.isEmpty()) {
				findFolder(rset,cloneTemp,tempArr,toDeleteFolderNo,pstmt,mno);	
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
