<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<link rel="stylesheet" href="/resources/css/modifyLayout_freeb.css" />
<title>나만의 칵테일</title>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>글수정</h3>
				
				
				
				<form action="/mycocktailboard/modify" id="modifyForm" method="post">
					<div class="btn_wrap" style="float: right;">
						<button type="submit" class="btn btn-dark" id="list_btn">목록</button>
						<button type="submit" class="btn btn-dark" id="modifty_btn">수정</button>
						<button type="submit" class="btn btn-dark" id="delete_btn"
							onclick="loaction.href='delete'" formaction="/mycocktailboard/delete" formmethod="post">삭제</button>
					</div>


					<div class="layout_all">
						<div class="layout_title">
							<div>
								<input type="text" class="form-control" id="mycocktailNum" name="mycocktailNum"	value="<c:out value= '${pagemodify.mycocktailNum}'/>" readonly style="border: none">
							</div>
							<div class="title">
								<input type="text" name="mycocktailTitle" class="form-control" id="exampleTextarea" value="<c:out value='${pagemodify.mycocktailTitle}' />" >
							</div>
						</div>	
						<hr/>		
								
						<div class="layout_middle">		
								<div class="text-secondary" id="writer">
									<input type="text" class="form-control"	id="mycocktailWriter" name="mycocktailWriter" value="<c:out value= '${pagemodify.mycocktailWriter}'/>" readonly style="border: none">
								</div>
								<div>
									<fmt:formatDate pattern="yyyy.MM.dd" value="${pagemodify.mycocktailDate}" />
								</div>
								<div>
									<input type="text" class="form-control" id="mycocktailReadcount" name="mycocktailReadcount" value="<c:out value="${pagemodify.mycocktailReadcount}" />"	readonly style="border: none">
								</div>
							</div>
						</div>
					
					
						<div class="layout_content">
							<textarea name="mycocktailContent" class="form-control" id="exampleTextarea" rows="15"><c:out value="${pagemodify.mycocktailContent}" /></textarea>
							<label>칵테일 레시피</label>
							<textarea name="mycocktailRecipe" class="form-control" id="exampleTextarea2" rows="5"><c:out value="${pagemodify.mycocktailRecipe }" /></textarea>
						</div>
				</form>


				<form id="detailForm" action="/mycocktailboard/modify" method="get">
					<input type="hidden" id="mycocktailNum" name="mycocktailNum"
						value="<c:out value= '${pagemodify.mycocktailNum}'/>">
				</form>


			</div>
			<!-- main contents end -->
		</div>
		<!-- contents end -->
	</div>
	<!-- wrapper end -->


	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>