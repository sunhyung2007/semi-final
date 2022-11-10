<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="/resources/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/css/cockinfo.css">
<link rel="stylesheet" href="/resources/css/menu.css">

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>나만의 칵테일 게시판 목록</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
 <script src="https://kit.fontawesome.com/d99a4f7016.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Ramaraja&family=Roboto+Condensed:wght@700&display=swap" rel="stylesheet">
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents" style="justify-content: space-between;">
				<h3>나만의 칵테일 게시판</h3>
				<div
					style="justify-content: space-between; flex-wrap: wrap; display: flex;">
					<c:forEach var="mycocktailboardlist" items="${mycocktailboardlist}">
						
						<div class="card"
							style="width: 30%; float: left; margin-bottom: 5%; cursor: pointer"
							onclick="location.href='/mycocktailboard/detail?mycocktailNum=${mycocktailboardlist.mycocktailNum}';">

							<img class="card-img-top"
								src="<spring:url value='/resources/images/mycocktailImagefolder/${mycocktailboardlist.mycocktailImgName}.jpg'/>"
								width=350px, height=230px alt="Card image cap">

							<div class="card-body">
								<span>
									<c:out value="${mycocktailboardlist.mycocktailTitle}" />
								</span>
								<span style="float: right;">	
								
									<c:out value="좋아요 "/>
									<i class="fa fa-heart" aria-hidden="true" id="olike" style="margin-top: 3px; color: red;"></i>
									<c:out value="${mycocktailboardlist.mycocktailLikeNum}" />
								</span>
								
								<p class="card-text">
									<c:out value="${mycocktailboardlist.mycocktailRecipe}" />
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>