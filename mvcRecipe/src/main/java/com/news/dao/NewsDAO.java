package com.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.news.vo.NewsVO;
import com.util.DBUtil;



/**
 * @Package Name   : com.news.dao
 * @FileName  : NewsDAO.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 신혜지
 * @프로그램 설명 : 
 */
public class NewsDAO {
	private static NewsDAO instance = new NewsDAO();
	
	public static NewsDAO getInstance() {
		return instance;
	}
	
	private NewsDAO() {}

	
	
	
	/**
	 * @Method 메소드명  : insertNews
	 * @작성일     : 2021. 9. 7. 
	 * @작성자     : 신혜지
	 * @Method 설명 : 공지사항에 올라갈 정보를 담고 있습니다.
	 */
	public void insertNews(NewsVO news) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
		conn = DBUtil.getConnection();
		sql="insert into NEWS_BOARD VALUES (NEWS_BOARD_SEQ.nextval, ?, ?, ? , 1, SYSDATE, SYSDATE, null)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,news.getNews_title());
		pstmt.setString(2,news.getNews_content());
		pstmt.setInt(3,news.getMem_num());
		pstmt.executeUpdate();
		}catch(Exception e){
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
