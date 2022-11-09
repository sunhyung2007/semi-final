<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>ID/비밀번호찾기</title>
<!-- bootstrap -->
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


				<h3>ID/비밀번호 찾기</h3>

				<div class="btn_wrap" style="display: grid; margin: 12%">
				<button type="submit" class="btn btn-secondary" onclick="location.href='/findidform'" formaction="/findidform" style="padding: 1.5% 0 1.5%;">ID 찾기</button><br>
				<button type="submit" class="btn btn-secondary" onclick="location.href='/findpwdform'" formaction="/findpwdform" style="padding: 1.5% 0 1.5%;">비밀번호 찾기</button>
<!-- 				<a href="/findidform">아이디찾기</a>
				<a href="/findpwdform">비밀번호 찾기</a>
 -->			</div>

			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>