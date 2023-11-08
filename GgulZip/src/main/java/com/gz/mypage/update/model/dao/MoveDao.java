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
import com.gz.mypage.folder.model.vo.Folder;

public class MoveDao {
private Properties prop = new Properties();
	
	public MoveDao() {
		String filePath = MoveDao.class.getResource("/db/sql/mypage-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//폴더 리스트 가져오기
	public ArrayList<Folder> selectFolderList(Connection conn, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Folder> list = new ArrayList<>();
		//가장 맨 위에 있는 폴더 번호 불러오기
		String sql = prop.getProperty("selectMyFolders");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Folder(rset.getInt("FOLDER_NO")
								   ,rset.getString("FOLDER_NAME")
								   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}
	
	//폴더/게시글 이동
	public int moveFolder(Connection conn, int mno,int targetFolderNo, String[] folderNoArr, String[] postNoArr) {
		PreparedStatement pstmt = null;
		int result = 1;
		int result2 = 1;
		String selectMyFolders = prop.getProperty("selectMyFolders");
		String folderMoveSql = prop.getProperty("folderMove");
		String postMoveSql = prop.getProperty("postMove");
		
		
		
		try {
			//이동할 폴더가 있다면
			if(folderNoArr != null) {
				
					pstmt = conn.prepareStatement(folderMoveSql);
					for(int i=0;i<folderNoArr.length;i++) {
						//만약 타겟 폴더 번호가 0이라면 (최상단) null로 바꿔서 up_folder_no에 넣어줘야함
						if(targetFolderNo == 0) {
							pstmt.setString(1, null);
							pstmt.setInt(2,mno);
							pstmt.setInt(3, Integer.parseInt(folderNoArr[i]));
						} else {
							pstmt.setInt(1, targetFolderNo);
							pstmt.setInt(2,mno);
							pstmt.setInt(3, Integer.parseInt(folderNoArr[i]));
						}
						result *= pstmt.executeUpdate();
						System.out.println("result : "+result);
					}
				
			}
			//이동할 게시글이 있다면
			if(postNoArr != null) {
				
					pstmt = conn.prepareStatement(postMoveSql);
					for(int i=0;i<postNoArr.length;i++) {
						//만약 타겟 폴더 번호가 0이라면 (최상단) null로 바꿔서 up_folder_no에 넣어줘야함
						if(targetFolderNo == 0) {
							pstmt.setString(1, null);
							pstmt.setInt(2,mno);
							pstmt.setInt(3, Integer.parseInt(postNoArr[i]));
						} else {
							pstmt.setInt(1, targetFolderNo);
							pstmt.setInt(2,mno);
							pstmt.setInt(3, Integer.parseInt(postNoArr[i]));
						}
						result2 *= pstmt.executeUpdate();
						System.out.println("result2 : "+result2);
					}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result*result2;
	}
	
	

}
