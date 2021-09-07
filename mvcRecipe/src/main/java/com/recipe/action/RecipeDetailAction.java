package com.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.recipe.dao.RecipeDAO;
import com.recipe.vo.RecipeVO;

/**
 * @Package Name   : com.recipe.action
 * @FileName  : RecipeDetailAction.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 오상준
 * @프로그램 설명 : 레시피 디테일 액션 한건의 레코드 처리
 */
public class RecipeDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 글 번호 반환
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		RecipeDAO dao = RecipeDAO.getInstance();
		
		// 조회수 증가
		
		// 한건의 레코드 받기
		RecipeVO recipe = dao.getRecipeBoard(board_num);
		
		// HTML을 허용하지 않음
		
		// HTML을 허용하지 않으면서 줄바꿈 처리
		
		// 한건의 레코드 반환
		request.setAttribute("recipe", recipe);
		
		// 디테일 페이지로 이동
		return "/WEB-INF/views/recipe/recipeDetail.jsp";
	}

}
