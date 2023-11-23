<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.pj4a.MemberVO"%>
<%@ page import="com.example.pj4a.MemberDAO"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*"%>

<%
	String sid = request.getParameter("id");
	if (sid != null && !sid.isEmpty()) {
		int id = Integer.parseInt(sid);
		MemberVO u = new MemberVO();
		u.setSid(id);
		MemberDAO member = new MemberDAO();
		member.deleteMember(u);
	}
	response.sendRedirect("posts.jsp");
%>
