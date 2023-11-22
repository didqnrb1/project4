<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.pj4a.MemberDAO	, com.example.pj4a.MemberVO"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MemberVO u = new MemberVO();
		u.setSid(id);
		MemberVO member= new MemberVO();
		member	.deleteMember(u);
	}
	response.sendRedirect("posts.jsp");
%>