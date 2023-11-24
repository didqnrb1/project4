<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Post</title>
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

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }

        a:hover {
            color: #2980b9;
        }
    </style>
</head>
<body>

<h1>Add New Post</h1>
<form action="addpost.jsp" method="post">
    <table>
        <tr><td>UserId:</td><td><input type="text" name="userid"/></td></tr>
        <tr><td>Password:</td><td><input type="text" name="password"/></td></tr>
        <tr><td>Username:</td><td><input type="text" name="username"/></td></tr>
        <tr><td>Email:</td><td><input type="text" name="email"/></td></tr>
        <tr><td>sex:</td><td><input type="text" name="sex"/></td></tr>
        <tr><td>Content:</td><td><textarea cols="50" rows="5" name="detail"></textarea></td></tr>
        <tr>
            <td><a href="posts.jsp">View All Records</a></td>
            <td align="right"><input type="submit" value="Add Post"/></td>
        </tr>
    </table>
</form>

</body>
</html>
