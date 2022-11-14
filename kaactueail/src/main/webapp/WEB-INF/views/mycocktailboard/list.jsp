<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>나만의 칵테일</title>

</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents" style="justify-content: space-between;">
				<h3>나만의 칵테일</h3>
				<!--  회원이라면 글쓰기가 보임 -->
				<div style="text-align: right;">
					<c:if test="${ mRole != null }">
						<button type="submit" class="btn btn-dark" id="write_btn"
							onclick="location.href='write'">글쓰기</button>
					</c:if>
				</div>
				
				<div style="justify-content: space-between; flex-wrap: wrap; display: flex;">
					<c:forEach var="mycocktailboardlist" items="${mycocktailboardlist}">

						<div class="card"
							style="width: 30%; float: left; margin-bottom: 5%; cursor: pointer"
							onclick="location.href='/mycocktailboard/detail?mycocktailNum=${mycocktailboardlist.mycocktailNum}'">

							<img class="card-img-top"
								src="<spring:url value='/resources/images/mycocktailImagefolder/${mycocktailboardlist.mycocktailImgName}'/>"
								width=350px, height=230px alt="Card image cap">

							<div class="card-body">
								<span> <c:out
										value="${mycocktailboardlist.mycocktailTitle}" />
								</span> <span style="float: right;"> <c:out value="좋아요 " /> <i
									class="fa fa-heart" aria-hidden="true" id="olike"
									style="margin-top: 3px; color: red;"></i> <c:out
										value="${mycocktailboardlist.mycocktailLikeNum}" />
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