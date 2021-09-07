package com.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.news.dao.NewsDAO;
import com.news.vo.NewsVO;

/**
 * @Package Name   : com.news.action
 * @FileName  : NewsWriteAction.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 신혜지
 * @프로그램 설명 : 잇마이팁액션클래스
 */
public class NewsWriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
		Integer auth =(Integer)session.getAttribute("auth");
		if(mem_num == null || auth != 3) {//로그인 되지 않은 경우, 권한이 3이 아닌 경우
			return "redirect:/member/loginForm.do";
		}
		
		request.setCharacterEncoding("utf-8");
		//String news_title=request.getParameter("title")
		NewsVO news= new NewsVO();
		news.setNews_title(request.getParameter("title"));
		news.setNews_content(request.getParameter("content"));
		news.setMem_num(mem_num);
		
		NewsDAO dao= NewsDAO.getInstance();
		dao.insertNews(news);
		return "/WEB-INF/views/news/newsWrite.jsp";
	}

}
