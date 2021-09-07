package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Action;

public class RegisterMemberFormAction implements Action{

	// È¸¿øµî·Ï Æû Action
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "/WEB-INF/views/member/registerMemberForm.jsp";
	}
	
}
