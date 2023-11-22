<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.pj4a.MemberDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.pj4a.MemberVO" />
<jsp:setProperty property="*" name="u"/>

<%
	MemberDAO boardDAO = new MemberDAO();
	int i=boardDAO.updateBoard(u);
	response.sendRedirect("posts.jsp");
%>