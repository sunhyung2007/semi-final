<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<input type = "button" value = "로그인하자" onclick ="script:window.location.href='loginform'">
<input type = "button" value  = "회원가입하자" onclick = "script:window.location.href='signupform'">
</body>
</html>
