<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.pj4a.MemberDAO, com.example.pj4a.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
	<style>
		body {
			font-family: 'Arial', sans-serif;
			background-color: #f4f4f4;
			margin: 0;
			padding: 0;
		}

		h1 {
			color: #3498db;
			text-align: center;
		}

		form {
			width: 50%;
			margin: 0 auto;
			background-color: #fff;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		table {
			width: 100%;
		}

		table td {
			padding: 10px;
		}

		input[type="text"],
		textarea {
			width: 100%;
			padding: 8px;
			margin: 5px 0;
			box-sizing: border-box;
		}

		input[type="submit"],
		input[type="button"] {
			background-color: #3498db;
			color: white;
			padding: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			margin-right: 5px;
		}

		input[type="submit"]:hover,
		input[type="button"]:hover {
			background-color: #2980b9;
		}
	</style>
</head>
<body>

<%
	MemberDAO MemberDAO = new MemberDAO();
	String id = request.getParameter("id");
	MemberVO u = MemberDAO.getMember(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post">
	<input type="hidden" name="sid" value="<%=u.getSid() %>"/>
	<table>
		<tr><td>UserID:</td><td><input type="text" name="userid" value="<%= u.getUserid()%>"/></td></tr>
		<tr><td>Password:</td><td><input type="text" name="password" value="<%= u.getPassword()%>" /></td></tr>
		<tr><td>UserName:</td><td><input type="text" name="username" value="<%= u.getUsername()%>" /></td></tr>
		<tr><td>Email:</td><td><input type="text" name="email" value="<%= u.getEmail()%>" /></td></tr>
		<tr><td>sex:</td><td><input type="text" name="sex" value="<%= u.getsex()%>" /></td></tr>
		<tr><td>Detail:</td><td><textarea cols="50" rows="5" name="detail"><%= u.getDetail()%></textarea></td></tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Edit Post"/>
				<input type="button" value="Cancel" onclick="history.back()"/>
			</td>
		</tr>
	</table>
</form>

</body>
</html>
