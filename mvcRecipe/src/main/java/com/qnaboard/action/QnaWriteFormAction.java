package com.qnaboard.action;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.member.dao.MemberDAO;
import com.member.vo.MemberVO;

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
		int mem_num = (Integer)session.getAttribute("mem_num");
		
		//멤버객체 생성
		MemberVO member = new MemberVO();
		MemberDAO dao = MemberDAO.getInstance();
		member = dao.getMember(mem_num);
		
		//request에 데이터를 담기
		String mem_id=member.getId();
		request.setAttribute("mem_id", mem_id);
		request.setAttribute("mem_num", mem_num);
		
		
		//JSP 경로 반환
		return "/WEB-INF/views/qnaboard/qnaWriteForm.jsp";
	}

}
