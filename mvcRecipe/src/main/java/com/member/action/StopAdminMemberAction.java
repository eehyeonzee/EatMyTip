package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;
import com.member.dao.MemberDAO;

/**
 * @Package Name   : com.member.action
 * @FileName  : StopAdminMemberAction.java
 * @작성일       : 2021. 9. 11. 
 * @작성자       : 박용복
 * @프로그램 설명 : 관리자가 회원 정지를 하게 해주는 Action
 */

public class StopAdminMemberAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String[] checked = request.getParameterValues("value_list");
		
		MemberDAO dao = MemberDAO.getInstance();
		
		for(int i = 0; i < checked.length; i++) {
			dao.stopAdminMember(i);
		}

		return "/WEB-INF/views/member/adminMemberView";
	}

}
