package com.news.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.news.dao.NewsDAO;
import com.news.vo.NewsVO;
import com.util.PagingUtil;

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
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null)pageNum = "1";
		NewsDAO dao = NewsDAO.getInstance();
		int count = dao.getNewsCount();
		HttpSession session = request.getSession();
		Integer auth =(Integer)session.getAttribute("auth");
		
		PagingUtil page = new PagingUtil(Integer.parseInt(pageNum),count,20,10,"NewsList.do");
		List<NewsVO> list =null;
		if(count > 0) {
			list = dao.getNewsList(page.getStartCount(), page.getEndCount());
		}
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		request.setAttribute("auth",auth);
		return "/WEB-INF/views/news/newsList.jsp";
	}

}
