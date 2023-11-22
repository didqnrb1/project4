<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.pj4a.MemberVO"%>
<%@ page import="com.example.pj4a.MemberDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.pj4a.MemberVO" />
<jsp:setProperty property="*" name="u"/>

<%
	MemberDAO a = new MemberDAO();
	int i = a.insertMember(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>