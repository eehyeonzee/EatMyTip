package com.recipe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.recipe.dao.RecipeDAO;

/**
 * @Package Name   : com.recipe.action
 * @FileName  : RecipeDeleteAction.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 이현지
 * @프로그램 설명 : 레시피 글삭제 액션 클래스
 */

public class RecipeDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 로그인 체크
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
				
		if(mem_num == null) { // 로그인 하지 않은 경우
			return "redirect:/member/loginForm.do";
		}
		
		// 로그인 한 경우
		// 전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		// 글번호 반환
		int board_num = Integer.parseInt(request.getParameter("board_num"));
				
		// RecipeDAO 호출
		RecipeDAO dao = RecipeDAO.getInstance();
		// 글 삭제
		dao.deleteRecipe(board_num);
				
		// JSP 경로 반환
		return "/WEB-INF/views/recipe/recipeDelete.jsp";
		}
	}
