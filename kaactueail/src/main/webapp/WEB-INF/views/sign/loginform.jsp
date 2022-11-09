<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>로그인</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
<!-- header삽입 -->
<%@ include file="../layout/header.jsp"%>
	
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h2>로그인</h2>


				<form action="login" method="post">
					<input type="text" name="mId" style=${css }> <br />
					${Message } <input type="password" name="mPwd"> <br /> <input
						type="submit" value="로그인"><br />
					<button>
						<a href="/findform">아이디/비밀번호찾기</a>
					</button>

				</form>














			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>