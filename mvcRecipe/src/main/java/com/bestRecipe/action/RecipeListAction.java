package com.bestRecipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;

/**
 * @Package Name   : com.bestRecipe.action
 * @FileName  : RecipeListAction.java
 * @작성일       : 2021. 9. 10. 
 * @작성자       : 오상준
 * @프로그램 설명 : 베스트 레시피 액션 클래스
 */
public class RecipeListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		return "/WEB-INF/views/bestRecipe/bestRecipeList.jsp";
	}

}
