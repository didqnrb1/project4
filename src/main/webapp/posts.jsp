<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.example.pj4a.MemberDAO, com.example.pj4a.MemberVO, java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>free board</title>
	<style>
		#list {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}
		#list td, #list th {
			border: 1px solid #ddd;
			padding: 8px;
			text-align:center;
		}
		#list tr:nth-child(even){background-color: #f2f2f2;}
		#list tr:hover {background-color: #ddd;}
		#list th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			background-color: #006bb3;
			color: white;
		}

		.button {
			display: inline-block;
			padding: 8px 16px;
			background-color: greenyellow;
			color: white;
			text-decoration: none;
			border-radius: 4px;
			transition: background-color 0.3s;
		}

		.button:hover {
			background-color: #004080;
		}

		.button1 {
			padding: 10px 15px;
			background-color: #3498db;
			color: white;
			text-decoration: none;
			border-radius: 5px;
		}

		.button1:hover {
			background-color: #2980b9;
		}

	</style>
	<script>
		function delete_ok(id){
			var a = confirm("정말로 삭제하겠습니까?");
			if(a) location.href='deletepost.jsp?id=' + id;
		}
	</script>
</head>
<body>
<h1>Member 목록</h1>
<%
	MemberDAO boardDAO = new MemberDAO();
	List<MemberVO> list = boardDAO.getList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
	<tr>
		<th>No</th>
		<th>userID</th>
		<th>userName</th>
		<th>Email</th>
		<th>sex</th>
		<th>Registed date</th>
		<th class="action-column">Action</th>
	</tr>
	<c:forEach items="${list}" var="u">
		<tr>
			<td>${u.getSid()}</td>
			<td>${u.getUserid()}</td>
			<td>${u.getUsername()}</td>
			<td>${u.getEmail()}</td>
			<td>${u.getsex()}</td>
			<td>${u.getRegdate()}</td>

			<td class="action-column">
				<a class="button" href="editform.jsp?id=${u.getSid()}">Edit</a>
				<a class="button" href="view.jsp?id=${u.getSid()}">View</a>
				<a class="button" href="javascript:delete_ok('${u.getSid()}')">Delete</a>
			</td>
		</tr>
	</c:forEach>
</table>
<br/>
<a class="button1" href="addpostform.jsp">Add New Post</a>
</body>
</html>
