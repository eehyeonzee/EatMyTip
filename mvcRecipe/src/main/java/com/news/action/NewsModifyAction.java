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
import com.oreilly.servlet.MultipartRequest;
import com.util.FileUtil;

/**
 * @Package Name   : com.news.action
 * @FileName  : NewsModify.java
 * @작성일       : 2021. 9. 7. 
 * @작성자       : 신혜지
 * @프로그램 설명 : 뉴스 수정 폼에서 받아서 뉴스 수정하게 됨 현재 파일 오류나서 지워둠
 */
public class NewsModifyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
		Integer auth =(Integer)session.getAttribute("auth");
		if(mem_num == null || auth != 3) {//로그인 되지 않은 경우, 권한이 3이 아닌 경우
			return "redirect:/member/loginForm.do";
		}
		request.setCharacterEncoding("utf-8");
		NewsVO news= new NewsVO();
		int num = Integer.parseInt(request.getParameter("news_num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		MultipartRequest multi = FileUtil.createFile(request);
		news.setNews_num(num);
		news.setNews_title(title);
		news.setNews_content(content);
		news.setNews_file(multi.getFilesystemName("filename"));
		NewsDAO dao=NewsDAO.getInstance();
		dao.updateNews(news);
		
		return "/WEB-INF/views/news/newsModify.jsp";
	}

}
