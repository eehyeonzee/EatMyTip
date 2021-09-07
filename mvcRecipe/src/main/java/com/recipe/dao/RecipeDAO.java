package com.recipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.recipe.vo.RecipeVO;
import com.util.DBUtil;

public class RecipeDAO {
	// 싱글턴 패턴
	private static RecipeDAO instance = new RecipeDAO();
	
	public static RecipeDAO getInstance() {
		return instance;
	}
	
	private RecipeDAO() {}
	
	
	/**
	 * @Method 메소드명  : insertRecipe
	 * @작성일     : 2021. 9. 7. 
	 * @작성자     : 이현지
	 * @Method 설명 : 글등록
	 */
	public void insertRecipe(RecipeVO recipe) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			// 커넥션풀로부터 커넥션 할당받음
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "INSERT INTO recipe_board (board_num,category,title,content,filename,ip,mem_num) VALUES (recipe_board_seq.nextval,?,?,?,?,?,?)";
						
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setString(1, recipe.getCategory());
			pstmt.setString(2, recipe.getTitle());
			pstmt.setString(3, recipe.getContent());
			pstmt.setString(4, recipe.getFilename());
			pstmt.setString(5, recipe.getIp());
			pstmt.setInt(6, recipe.getMem_num());
						
			// SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		
		}finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	
	/**
	 * @Method 메소드명  : getRecipeCount
	 * @작성일     : 2021. 9. 7. 
	 * @작성자     : 오상준
	 * @Method 설명 : 총레코드 수 추출
	 */
	public int getRecipeCount()throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			// sql문 작성
			sql = "select count(*) from recipe_board b join member m on b.mem_num = m.mem_num";
			
			// pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// rs에 결과행 담기
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return count;
		
		
	}
	
	
	/**
	 * @Method 메소드명  : getRecipeCount
	 * @작성일     : 2021. 9. 7. 
	 * @작성자     : 오상준
	 * @Method 설명 : 총 레코드 수 추출 메소드 오버로딩 (매개변수 카테고리, 검색값)
	 */
	
	public int getRecipeCount(String division, String search)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			// 검색 조건이 제목인 경우
			if(division.equals("제목")) {
				// sql문 작성
				sql = "select count(*) from recipe_board b join member m on b.mem_num = m.mem_num where title LIKE ?";
				
				// pstmt 객체 생성
				pstmt = conn.prepareStatement(sql);
				
				// ?에 데이터 바인딩
				pstmt.setString(1, "%" + search + "%");
			
				
				// 검색 조건이 내용인 경우
			}else if(division.equals("내용")) {
				// sql문 작성
				sql = "select count(*) from recipe_board b join member m on b.mem_num = m.mem_num where content LIKE ?";
				
				// pstmt 객체 생성
				pstmt = conn.prepareStatement(sql);
				
				// ?에 데이터 바인딩
				pstmt.setString(1, "%" + search + "%");
			
				// 검색 조건이 작성자인 경우
			}else {
				// sql문 작성
				sql = "select count(*) from recipe_board b join member m on b.mem_num = m.mem_num where id LIKE ?";
				
				// pstmt 객체 생성
				pstmt = conn.prepareStatement(sql);
				
				// ?에 데이터 바인딩
				pstmt.setString(1, "%" + search + "%");
			}
			
			// rs에 결과행 담기
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return count;
		
		
	}
	
	
	
	/**
	 * @Method 메소드명  : getTotalRecipeList
	 * @작성일     : 2021. 9. 7. 
	 * @작성자     : 오상준
	 * @Method 설명 : 레시피 전체 리스트 추출 메소드
	 */
	public List<RecipeVO> getTotalRecipeList(int start, int end)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<RecipeVO> list = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			// SQL문장 작성
			sql = "select * from (select a.*, rownum rnum from "
					+ "(select * from recipe_board b join member m on b.mem_num = m.mem_num order by b.board_num desc) a) "
					+ "where rnum >=? and rnum <=?";
			
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// ? 에 데이터 바인딩
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			// sql 문을 실행하고 rs에 결과행 담기
			rs = pstmt.executeQuery();
			
			list = new ArrayList<RecipeVO>();
			
			while(rs.next()) {
				RecipeVO recipe = new RecipeVO();
				recipe.setBoard_num(rs.getInt("board_num"));
				recipe.setTitle(rs.getString("title"));
				recipe.setContent(rs.getString("content"));
				recipe.setHits(rs.getInt("hits"));
				recipe.setRecom_count(rs.getInt("recom_count"));
				recipe.setReport_date(rs.getDate("report_date"));
				recipe.setModify_date(rs.getDate("modify_date"));
				recipe.setIp(rs.getString("ip"));
				recipe.setFilename(rs.getString("filename"));
				recipe.setCategory(rs.getString("category"));
				recipe.setMem_num(rs.getInt("mem_num"));
				recipe.setId(rs.getString("id"));
				
				list.add(recipe);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	/**
	 * @Method 메소드명  : getSearchlRecipeList
	 * @작성일     : 2021. 9. 7. 
	 * @작성자     : 오상준
	 * @Method 설명 : 검색값과 카테고리명이 일치하는 전체 값 추출 메소드
	 */
	
	public List<RecipeVO> getSearchlRecipeList(int start, int end, String division, String search)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<RecipeVO> list = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
				// 조건시작
			// SQL문 작성
			// 검색 조건이 제목인 경우
			if(division.equals("제목")) {
				// SQL문장 작성
				sql = "select * from (select a.*, rownum rnum from "
						+ "(select * from recipe_board b join member m on b.mem_num = m.mem_num order by b.board_num desc) a) "
						+ "where rnum >=? and rnum <=? and title LIKE ? ";
				
				// PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				
				// ? 에 데이터 바인딩
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				pstmt.setString(3, "%" + search + "%");
				
				
			// 검색조건이 내용인 경우
			}else if(division.equals("내용")){
				// SQL문장 작성
				sql = "select * from (select a.*, rownum rnum from "
						+ "(select * from recipe_board b join member m on b.mem_num = m.mem_num order by b.board_num desc) a) "
						+ "where rnum >=? and rnum <=? and content LIKE ?";
				
				// PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				
				// ? 에 데이터 바인딩
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				pstmt.setString(3, "%" + search + "%");
			
			// 검색 조건이 작성자인 경우
			}else {
				// SQL문장 작성
				sql = "select * from (select a.*, rownum rnum from "
						+ "(select * from recipe_board b join member m on b.mem_num = m.mem_num order by b.board_num desc) a) "
						+ "where rnum >=? and rnum <=? and id LIKE ?";
				
				// PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				
				// ? 에 데이터 바인딩
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				pstmt.setString(3, "%" + search + "%");
			}
			// 조건문 종료
			
			// sql 문을 실행하고 rs에 결과행 담기
			rs = pstmt.executeQuery();
			
			list = new ArrayList<RecipeVO>();
			
			while(rs.next()) {
				RecipeVO recipe = new RecipeVO();
				recipe.setBoard_num(rs.getInt("board_num"));
				recipe.setTitle(rs.getString("title"));
				recipe.setContent(rs.getString("content"));
				recipe.setHits(rs.getInt("hits"));
				recipe.setRecom_count(rs.getInt("recom_count"));
				recipe.setReport_date(rs.getDate("report_date"));
				recipe.setModify_date(rs.getDate("modify_date"));
				recipe.setIp(rs.getString("ip"));
				recipe.setFilename(rs.getString("filename"));
				recipe.setCategory(rs.getString("category"));
				recipe.setMem_num(rs.getInt("mem_num"));
				recipe.setId(rs.getString("id"));
				
				list.add(recipe);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
	/**
	 * @Method 메소드명  : getRecipeBoard
	 * @작성일     : 2021. 9. 8. 
	 * @작성자     : 오상준
	 * @Method 설명 : 레시피 상세 페이지 출력 메소드
	 */
	public RecipeVO getRecipeBoard(int board_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RecipeVO recipe = null;
		String sql = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "select * from recipe_board b join member m on b.mem_num = m.mem_num where b.board_num=?";
			
			// pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// ?에 데이터 바인딩
			pstmt.setInt(1, board_num);
			
			// SQL문을 실행해서 결과행을 resultSet에 담음
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				recipe = new RecipeVO();
				recipe.setBoard_num(rs.getInt("board_num"));
				recipe.setTitle(rs.getString("title"));
				recipe.setContent(rs.getString("content"));
				recipe.setHits(rs.getInt("hits"));
				recipe.setRecom_count(rs.getInt("recom_count"));	// 추천수
				recipe.setReport_date(rs.getDate("report_date"));
				recipe.setModify_date(rs.getDate("modify_date"));
				recipe.setFilename(rs.getString("filename"));
				recipe.setMem_num(rs.getInt("mem_num"));
				recipe.setIp(rs.getString("ip"));
				recipe.setCategory(rs.getString("category"));
				recipe.setId(rs.getString("id"));
				
				
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원 정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return recipe;
	}
	
	
	/**
	 * @Method 메소드명  : updateHitsCount
	 * @작성일     : 2021. 9. 8. 
	 * @작성자     : 오상준
	 * @Method 설명 : 조회수 업데이트 메소드
	 */
	public void updateHitsCount(int board_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "UPDATE recipe_board set hits=hits+1 where board_num=?";
			
			// pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// ? 에 데이터 바인딩
			pstmt.setInt(1, board_num);
			
			// SQL문 실행
			pstmt.executeUpdate();
					
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원 정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	
	/**
	 * @Method 메소드명  : recomDuplicationCheck
	 * @작성일     : 2021. 9. 8. 
	 * @작성자     : 오상준
	 * @Method 설명 : 회원의 추천수 중복 체크 메소드
	 */
	public int recomDuplicationCheck(int board_num, int mem_num)throws Exception{
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "select count(*) from recommend where board_num = ? and mem_num = ?";
			
			// pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// ? 에 데이터 바인딩
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, mem_num);
			
			// SQL문 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
					
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원 정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	/**
	 * @Method 메소드명  : recomDelete
	 * @작성일     : 2021. 9. 8. 
	 * @작성자     : 오상준
	 * @Method 설명 :  레시피 추천 삭제 메소드
	 */
	public void recomDelete(int board_num, int mem_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			// SQL문 작성
			sql = "delete from recommend where board_num = ? and mem_num = ?";
			
			// pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// ? 에 데이터 바인딩
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, mem_num);
			
			// SQL문 실행
			pstmt.executeUpdate();
					
			// 추천 테이블의 데이터를 삭제하면 레시피 테이블의 추천수도 -1 헤야 한다.
			
			//SQL문 작성
			sql = "update recipe_board set recom_count = recom_count-1 where board_num=?";
			
			// pstmt 객체 생성
			pstmt2 = conn.prepareStatement(sql);
						
			// ? 에 데이터 바인딩
			pstmt2.setInt(1, board_num);
					
			// SQL문 실행
			pstmt2.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원 정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	/**
	 * @Method 메소드명  : recomAdd
	 * @작성일     : 2021. 9. 8. 
	 * @작성자     : 오상준
	 * @Method 설명 : 레시피의 추천수를 1 증가시켜주면서 추천테이블에 추가하는 메소드
	 */
	public void recomAdd(int board_num , int mem_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "update recipe_board set recom_count = recom_count+1 where board_num=?";
			
			// pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// ? 에 데이터 바인딩
			pstmt.setInt(1, board_num);
			
			// SQL문 실행
			pstmt.executeUpdate();
					
			// 추천 테이블의 데이터를 삭제하면 레시피 테이블의 추천수도 -1 헤야 한다.
			
			//SQL문 작성
			sql = "insert into recommend (board_num, mem_num) values (?,?)";
					
			// pstmt 객체 생성
			pstmt2 = conn.prepareStatement(sql);
									
			// ? 에 데이터 바인딩
			pstmt2.setInt(1, board_num);
			pstmt2.setInt(2, mem_num);			
			
			// SQL문 실행
			pstmt2.executeUpdate();			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원 정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	/**
	 * @Method 메소드명  : recomCount
	 * @작성일     : 2021. 9. 8. 
	 * @작성자     : 오상준
	 * @Method 설명 : 현재 레시피의 추천수를 반환하는 메소드
	 */
	public int recomCount(int board_num)throws Exception {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			// 커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			//SQL문 작성
			sql = "select recom_count from recipe_board where board_num = ?";
			
			// pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// ? 에 데이터 바인딩
			pstmt.setInt(1, board_num);
			
			// SQL문 실행
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("recom_count");
			}
					
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			// 자원 정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	// 글수정
	// 글삭제
}
