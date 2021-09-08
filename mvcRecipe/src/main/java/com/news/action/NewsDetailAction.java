/**
 * 
 */
package com.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.news.dao.NewsDAO;
import com.news.vo.NewsVO;

/**
 * @Package Name   : com.news.action
 * @FileName  : NewsDetailAction.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 신혜지
 * @프로그램 설명 : 뉴스 본문을 보여줌
 */
public class NewsDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer auth =(Integer)session.getAttribute("auth");
		int num = Integer.parseInt(request.getParameter("news_num"));
		NewsDAO dao=NewsDAO.getInstance();
		dao.updateCount(num);
		NewsVO news=dao.getNews(num);
		request.setAttribute("news", news);
		request.setAttribute("auth", auth);
		return "/WEB-INF/views/news/newsDetail.jsp";
	}

}
