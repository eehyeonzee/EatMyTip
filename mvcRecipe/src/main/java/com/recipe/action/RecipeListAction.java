package com.recipe.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.recipe.dao.RecipeDAO;
import com.recipe.vo.RecipeVO;
import com.util.PagingUtil;

/**
 * @Package Name   : com.recipe.action
 * @FileName  : RecipeListAction.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 오상준
 * @프로그램 설명 : 모두의 레시피 액션 클래스
 */

public class RecipeListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
		
		// 검색 조건 체크를 위해 변수 할당
		String search = request.getParameter("search");
		String division = request.getParameter("division");
		
		// 전송된 데이터 타입
		request.setCharacterEncoding("utf-8");
		
		request.setAttribute("search", search);
		request.setAttribute("division", division);
		request.setAttribute("mem_num", mem_num);
		
		// 검색 조건 체크 null이라면 일반 페이지 처리
		if(division == null) {
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) pageNum = "1";
			
			RecipeDAO dao = RecipeDAO.getInstance();
			int count = dao.getRecipeCount();	// 총 레코드 수
			
			// 페이지 처리
			// currentPage, count, rowCount, pageCount, url
			PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 6, 5,"recipeList.do");
			
			List<RecipeVO> list = null;
			
			// 총 레코드가 0이 아닐 때 list에 값을 담는다
			if(count > 0) {
				list = dao.getTotalRecipeList(page.getStartCount(), page.getEndCount());
			}
			
			// list와 총 페이지, 페이지 하단부분 넘겨주기
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("pagingHtml", page.getPagingHtml());
			
			// 모두의 레시피로 이동
			return "/WEB-INF/views/recipe/recipeList.jsp";
			
			// 검새조건이 제목인 경우
		}else if(division.equals("제목")) {
				
				String pageNum = request.getParameter("pageNum");
				if(pageNum==null) pageNum = "1";
					
				RecipeDAO dao = RecipeDAO.getInstance();
				int count = dao.getRecipeCount(division, search);	// 검색조건에 부합한 총 레코드 수
						
				// 페이지 처리
				// currentPage, count, rowCount, pageCount, url
				PagingUtil page = new PagingUtil(search,division, Integer.parseInt(pageNum), count, 6, 5,"recipeList.do");
						
				List<RecipeVO> list = null;
						
				// 총 레코드가 0이 아닐 때 list에 값을 담는다
				if(count > 0) {
					list = dao.getSearchlRecipeList(page.getStartCount(), page.getEndCount(), division, search);
				}
						
				// list와 총 페이지, 페이지 하단부분 넘겨주기
				request.setAttribute("count", count);
				request.setAttribute("list", list);
				request.setAttribute("pagingHtml", page.getPagingHtml());
						
				// 모두의 레시피로 이동		
				
				return "/WEB-INF/views/recipe/recipeList.jsp";
				
				// 검색조건이 내용인 경우
			}else if(division.equals("내용")) {
			
				String pageNum = request.getParameter("pageNum");
				if(pageNum==null) pageNum = "1";
					
				RecipeDAO dao = RecipeDAO.getInstance();
				int count = dao.getRecipeCount(division, search);	// 검색조건에 부합한 총 레코드 수
						
				// 페이지 처리
				// currentPage, count, rowCount, pageCount, url
				PagingUtil page = new PagingUtil(search,division,Integer.parseInt(pageNum), count, 6, 5,"recipeList.do");
						
				List<RecipeVO> list = null;
						
				// 총 레코드가 0이 아닐 때 list에 값을 담는다
				if(count > 0) {
					list = dao.getSearchlRecipeList(page.getStartCount(), page.getEndCount(), division, search);
				}
						
				// list와 총 페이지, 페이지 하단부분 넘겨주기
				request.setAttribute("count", count);
				request.setAttribute("list", list);
				request.setAttribute("pagingHtml", page.getPagingHtml());
						
				// 모두의 레시피로 이동		
				
				return "/WEB-INF/views/recipe/recipeList.jsp";
				
				// 검색조건이 작성자인 경우
			}else {
				String pageNum = request.getParameter("pageNum");
				if(pageNum==null) pageNum = "1";
					
				RecipeDAO dao = RecipeDAO.getInstance();
				int count = dao.getRecipeCount(division, search);	// 검색조건에 부합한 총 레코드 수
						
				// 페이지 처리
				// currentPage, count, rowCount, pageCount, url
				PagingUtil page = new PagingUtil(search,division,Integer.parseInt(pageNum), count, 6, 5,"recipeList.do?search="+search+"&category="+division);
						
				List<RecipeVO> list = null;
						
				// 총 레코드가 0이 아닐 때 list에 값을 담는다
				if(count > 0) {
					list = dao.getSearchlRecipeList(page.getStartCount(), page.getEndCount(), division, search);
				}
						
				// list와 총 페이지, 페이지 하단부분 넘겨주기
				request.setAttribute("count", count);
				request.setAttribute("list", list);
				request.setAttribute("pagingHtml", page.getPagingHtml());
				request.setAttribute("division", division);
				request.setAttribute("search", search);
				// 모두의 레시피로 이동	
				return "/WEB-INF/views/recipe/recipeList.jsp";
			}
	}

}
