package com.qnaboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.qnaboard.vo.QnaBoardVO;
import com.util.DBUtil;

public class QnaBoardDAO {
	//싱글턴 패턴
	private static QnaBoardDAO instance = new QnaBoardDAO();
	
	public static QnaBoardDAO getInstance() {
		return instance;
	}
	
	private QnaBoardDAO() {}
	
	//context.xml에서 설정 정보를 읽어들여 커넥션풀로부터 커넥션을 할당
	private Connection getConnection()throws Exception{
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/xe");
		return ds.getConnection();
	}
	//자원정리
	private void executeClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if(rs!=null)try {rs.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		if(conn!=null)try {conn.close();}catch(SQLException e) {}
	}
	

	/**
	 * @Method 메소드명  : write
	 * @작성일     : 2021. 9. 6. 
	 * @작성자     : 나윤경
	 * @Method 설명 : 고객센터 게시판 글 작성
	 */
	public void write(QnaBoardVO qnaboard)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = getConnection();
			
			//SQL문 작성
			sql = "INSERT INTO qna_board (qna_num, qna_title, qna_content, qna_id, qna_passwd, qna_ip, qna_date) "
					+ "VALUES (qna_board_seq.nextval,?,?,?,?,?,SYSDATE)";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, qnaboard.getQna_title());
			pstmt.setString(2, qnaboard.getQna_content());
			pstmt.setString(3, qnaboard.getQna_id());
			pstmt.setString(4, qnaboard.getQna_passwd());
			pstmt.setString(5, qnaboard.getQna_ip());
			
			//SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			executeClose(null, pstmt, conn);
		}
	}
	
	/**
	 * @Method 메소드명  : getCount
	 * @작성일     : 2021. 9. 6. 
	 * @작성자     : 나윤경
	 * @Method 설명 : 고객센터 게시판 총 레코드 수
	 */
	public int getCount()throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = getConnection();
			
			//SQL문 작성
			sql="SELECT COUNT(*) FROM qna_board";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//SQL문을 실행해서 결과행을 ResultSet에 담음
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원 정리
			executeClose(rs, pstmt, conn);
		}
		return count;
	}

	
	/**
	 * @Method 메소드명  : getList
	 * @작성일     : 2021. 9. 6. 
	 * @작성자     : 나윤경
	 * @Method 설명 : 고객센터 게시판 글 목록
	 */
	public List<QnaBoardVO> getListBoard(int startRow, int endRow)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<QnaBoardVO> list = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = getConnection();
			
			//SQL문 작성
			sql = "SELECT * FROM (SELECT a.*, rownum rnum FROM (SELECT * FROM qnaboard "
					+ "ORDER BY num DESC)a) WHERE rnum >= ? AND rnum <= ?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			//SQL문을 실행하고 결과행을 ResultSet에 담음
			rs=pstmt.executeQuery();
			list = new ArrayList<QnaBoardVO>();
			while(rs.next()) {
				QnaBoardVO qnaboardVO = new QnaBoardVO();
				qnaboardVO.setQna_num(rs.getInt("qna_num"));
				qnaboardVO.setQna_title(rs.getString("qna_title"));
				qnaboardVO.setQna_id(rs.getString("qna_id"));
				qnaboardVO.setQna_date(rs.getDate("qna_date"));
				
				//자바빈(VO)을 ArrayList에 저장
				list.add(qnaboardVO);
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
		
	}
	
	
	//글 상세
	
	//글 수정
	
	//글 삭제
	
}
