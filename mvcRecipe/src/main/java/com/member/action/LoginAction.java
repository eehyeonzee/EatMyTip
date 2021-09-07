package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.member.dao.MemberDAO;
import com.member.vo.MemberVO;

public class LoginAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			request.setCharacterEncoding("UTF-8");
				
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
				
			MemberDAO dao = MemberDAO.getInstance();
			MemberVO member = dao.checkMember(id);
			boolean check = false;
				
			if(member != null) {
				check = member.isCheckedPassword(passwd);
			}
			if(check) {
				HttpSession session = request.getSession();
				session.setAttribute("mem_num", member.getMem_num());
				session.setAttribute("id", member.getId());
				session.setAttribute("auth", member.getAuth());
					
				return "redirect:/main/main.do";
			}
				
			return "/WEB-INF/views/member/login.jsp";
	}

}
