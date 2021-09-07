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
	}

}
