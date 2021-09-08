package com.qnaboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;

/**
 * @Package Name   : com.qnaboard.action
 * @FileName  : WriteFormAction.java
 * @작성일       : 2021. 9. 6. 
 * @작성자       : 나윤경
 * @프로그램 설명 : 고객센터 게시판 글 작성(폼)
 */
public class QnaWriteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
		
		//JSP 경로 반환
		return "/WEB-INF/views/qnaboard/QnaWriteForm.jsp";
	}

}
