<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/header.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
		<div class="header">
			<div class="navbar_logo">
				<a href="/main"><img class="logo" src="/resources/images/LOGO.png" /></a>
			</div>
			<div class="navbar_left">
				<ul class="left">
					<li><a class="menu_left" href="/infoboard/list">칵테일 소개</a></li>
					<li><a class="menu_left" href="/mycocktailboard/list">나만의 칵테일</a></li>
					<li><a class="menu_left" href="/freeboard/list">자유게시판</a></li>
					<li><a class="menu_left" href="#">스토어</a></li>
				</ul>
			</div>

			<div class="search-box">
				<form action="." method="post">
					<input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" />
					<button class="search-btn" type="submit">찾기</button>
				</form>
			</div>
			<div>
				<ul class="right">
					 <li><span class="material-icons" style="color: white; cursor: pointer;" onclick="location.href='/bucketlist/list'">shopping_cart</span></li>
					 <li><span class="material-icons" style="color: white; cursor: pointer;" onclick="location.href='#'">person</span></li>
				<!-- 로그인 안 했을 경우 -->
				<c:if test="${ mId == null }">
					<li><a href="/loginform">로그인</a></li>
				</c:if>
				<c:if test="${ mId != null }">
					<li><a href="/logout">로그아웃</a></li>
				</c:if>
					<li><a href="/signupform">회원가입</a></li>
				
				</ul>
			</div>
		</div>

		<div class="main_bar">
			<img class="img_bar" src="/resources/images/Bar_main.jpg" />
		</div>

	
</body>
</html>