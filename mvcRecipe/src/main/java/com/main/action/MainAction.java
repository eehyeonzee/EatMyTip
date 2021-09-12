package com.main.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.recipe.dao.RecipeDAO;
import com.recipe.vo.RecipeVO;
import com.util.PagingUtil;

/**
 * @Package Name   : com.main.action
 * @FileName  : MainAction.java
 * @작성일       : 2021. 9. 12. 
 * @작성자       :
 * @프로그램 설명 : 메인화면 액션 클래스
 */

public class MainAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 체크
		HttpSession session = request.getSession();
		Integer mem_num = (Integer) session.getAttribute("mem_num");
		
		// 메인페이지 섹션 中 모두의레시피, 베스트레시피 게시판 조건 체크를 위해 변수 할당
		String division = request.getParameter("divison");
		
		// 전송된 데이터 인코딩
		request.setCharacterEncoding("utf-8");
		
		request.setAttribute("mem_num", mem_num);
		request.setAttribute("division", division);
		
		// DAO 호출
		RecipeDAO dao = RecipeDAO.getInstance();
		int count = dao.getRecipeCount(); // 총 레코드 수
		
		// 모두의레시피, 베스트레시피. 공지사항 게시판 출력
		// 조건 체크가 null일 경우 모두의레시피 페이지 처리
		if(division == null) {
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) pageNum = "1";
			
			dao = RecipeDAO.getInstance();
			
			// 페이지 처리
			// currentPage, count, rowCount, pageCount, url
			PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 3, 5, "recipeList.do");
			
			List<RecipeVO> list = null;
			
			// 총 레코드가 0이 아닐 경우 list에 값 담음
			if(count > 0) {
				list = dao.getTotalRecipeList(page.getStartCount(), page.getEndCount());
			}
			
			// list와 총 페이지, 페이지 하단부분 넘겨주기
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("pagingHtml", page.getPagingHtml());
			
		// 조건 체크가 추천순일 경우 B레시피 페이지 처리
		}else if(division.equals("추천순")) {
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null) pageNum = "1";
			
			dao = RecipeDAO.getInstance();
			
			// 페이지 처리
			// currentPage, count, rowCount, pageCount, url
			PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 4, 5, "bestRecipeList.do?division=추천순");
			
			List<RecipeVO> list = null;
			
			// 총 레코드가 0이 아닐 경우 list에 값 담음
			if(count > 0) {
				list = dao.getRecommTotalRecipeList(page.getStartCount(), page.getEndCount());
			}
			
			// list와 총 페이지, 페이지 하단부분 넘겨주기
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("pagingHtml", page.getPagingHtml());
		
		// 공지사항 페이지 처리
		}else {
			
		}
		
		// 메인 JSP 경로 반환
		return "/WEB-INF/views/main/main.jsp";
	}
	
}
