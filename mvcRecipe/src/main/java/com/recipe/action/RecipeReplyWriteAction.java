package com.recipe.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;

public class RecipeReplyWriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, String> mapAjax = new HashMap<String, String>();
		
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
		if(mem_num == null) {	// 로그인이 안된 경우
			mapAjax.put("result", "logout");
		}else {	// 로그인 된 경우
		
		}
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
