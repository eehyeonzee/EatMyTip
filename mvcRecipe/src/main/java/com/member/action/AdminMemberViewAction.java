package com.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.Action;
import com.member.dao.MemberDAO;
import com.member.vo.MemberVO;
import com.util.PagingUtil;

public class AdminMemberViewAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer mem_num = (Integer)session.getAttribute("mem_num");
		Integer auth = (Integer)session.getAttribute("auth");
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null)pageNum = "1";
		
		MemberDAO dao = MemberDAO.getInstance();
		int count = dao.getMemberCount();
		
		PagingUtil page = new PagingUtil(Integer.parseInt(pageNum), count, 20, 10, "adminMemberView.do");
		
		List<MemberVO> list = null;
		if(count > 0) {
			list = dao.getListMember(page.getStartCount(), page.getEndCount());
		}
		
		if(mem_num == null) {
			return "redirect:/member/loginForm.do";
		}
		
		if(auth != 3) {
			return "redirect:/member/loginForm.do";
		}
		
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("pagingHtml", page.getPagingHtml());
		
		return "/WEB-INF/views/member/adminMemberView.jsp";
	}

}
