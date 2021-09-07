package com.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;

/**
 * @Package Name   : com.news.action
 * @FileName  : NewsListAction.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 신혜지
 * @프로그램 설명 : 잇마이팁 액션 클래스
 */
public class NewsListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "/WEB-INF/views/news/newsList.jsp";
	}

}
