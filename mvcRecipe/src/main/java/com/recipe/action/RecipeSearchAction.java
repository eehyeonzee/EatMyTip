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
 * @FileName  : RecipeSearchAction.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 오상준
 * @프로그램 설명 : 레시피 검색 액션 클래스
 */

public class RecipeSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
		
		// 전송된 데이터 인코딩 처리
//		request.setCharacterEncoding("utf-8");
		
		// 전송된 데이터 반환
		String search = request.getParameter("search");
		String category = request.getParameter("category");
		
		request.setAttribute("search", search);
		request.setAttribute("category", category);
		
//		if(category == null) category = "전체";
		
		// 검새조건이 식사인 경우
		if(category.equals("식사")) {
		
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) pageNum = "1";
				
			RecipeDAO dao = RecipeDAO.getInstance();
			int count = dao.getRecipeCount(category, search);	// 검색조건에 부합한 총 레코드 수
					
			// 페이지 처리
			// currentPage, count, rowCount, pageCount, url
			PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 6, 5,"recipeSearch.do");
					
			List<RecipeVO> list = null;
					
			// 총 레코드가 0이 아닐 때 list에 값을 담는다
			if(count > 0) {
				list = dao.getSearchlRecipeList(page.getStartCount(), page.getEndCount(), category, search);
			}
					
			// list와 총 페이지, 페이지 하단부분 넘겨주기
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("pagingHtml", page.getPagingHtml());
					
			// 모두의 레시피로 이동		
			
			return "/WEB-INF/views/recipe/recipeList.jsp";
			
			// 검색조건이 간식인 경우
		}else if(category.equals("간식")) {
		
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) pageNum = "1";
				
			RecipeDAO dao = RecipeDAO.getInstance();
			int count = dao.getRecipeCount(category, search);	// 검색조건에 부합한 총 레코드 수
					
			// 페이지 처리
			// currentPage, count, rowCount, pageCount, url
			PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 6, 5,"recipeSearch.do");
					
			List<RecipeVO> list = null;
					
			// 총 레코드가 0이 아닐 때 list에 값을 담는다
			if(count > 0) {
				list = dao.getSearchlRecipeList(page.getStartCount(), page.getEndCount(), category, search);
			}
					
			// list와 총 페이지, 페이지 하단부분 넘겨주기
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("pagingHtml", page.getPagingHtml());
					
			// 모두의 레시피로 이동		
			
			return "/WEB-INF/views/recipe/recipeList.jsp";
			
			// 검색조건이 음료인 경우
		}else if(category.equals("음료")) {
		
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) pageNum = "1";
				
			RecipeDAO dao = RecipeDAO.getInstance();
			int count = dao.getRecipeCount(category, search);	// 검색조건에 부합한 총 레코드 수
					
			// 페이지 처리
			// currentPage, count, rowCount, pageCount, url
			PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 6, 5,"recipeSearch.do");
					
			List<RecipeVO> list = null;
					
			// 총 레코드가 0이 아닐 때 list에 값을 담는다
			if(count > 0) {
				list = dao.getSearchlRecipeList(page.getStartCount(), page.getEndCount(), category, search);
			}
					
			// list와 총 페이지, 페이지 하단부분 넘겨주기
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("pagingHtml", page.getPagingHtml());
					
			// 모두의 레시피로 이동		
			
			return "/WEB-INF/views/recipe/recipeList.jsp";
			
			// 검색 조건이 전체인 경우
		}else {
			String pageNum = request.getParameter("pageNum");
			if(pageNum==null) pageNum = "1";
				
			RecipeDAO dao = RecipeDAO.getInstance();
			int count = dao.getRecipeCount(category, search);	// 검색조건에 부합한 총 레코드 수
					
			// 페이지 처리
			// currentPage, count, rowCount, pageCount, url
			PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 6, 5,"recipeSearch.do");
					
			List<RecipeVO> list = null;
					
			// 총 레코드가 0이 아닐 때 list에 값을 담는다
			if(count > 0) {
				list = dao.getSearchlRecipeList(page.getStartCount(), page.getEndCount(), category, search);
			}
					
			// list와 총 페이지, 페이지 하단부분 넘겨주기
			request.setAttribute("count", count);
			request.setAttribute("list", list);
			request.setAttribute("pagingHtml", page.getPagingHtml());
					
			// 모두의 레시피로 이동	
			return "/WEB-INF/views/recipe/recipeList.jsp";
		}
		
	}

}
