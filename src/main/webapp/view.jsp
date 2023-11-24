<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.pj4a.MemberDAO, com.example.pj4a.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member Information</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        td:first-child {
            width: 30%;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%

    String memberId = request.getParameter("id");

    MemberDAO memberDAO = new MemberDAO();
    MemberVO member = memberDAO.getMember(Integer.parseInt(memberId));

%>
<h1>Member Information</h1>
<table>
    <tr>
        <td>User ID:</td>
        <td><%= member.getUserid() %></td>
    </tr>
    <tr>
        <td>User Name:</td>
        <td><%= member.getUsername() %></td>
    </tr>
    <tr>
        <td>Email:</td>
        <td><%= member.getEmail() %></td>
    </tr>
    <tr>
        <td>Sex:</td>
        <td><%= member.getsex() %></td>
    </tr>
    <tr>
        <td>Registered Date:</td>
        <td><%= member.getRegdate() %></td>
    </tr>
    <tr>
        <td>Detail:</td>
        <td><%= member.getDetail() %></td>
    </tr>
</table>
</body>
</html>
