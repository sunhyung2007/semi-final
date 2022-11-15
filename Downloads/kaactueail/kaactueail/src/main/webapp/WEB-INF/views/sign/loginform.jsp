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

				<div class="login_wrap" style="margin: 8% 25%;">


				<form action="login" method="post">
						<div class="form-group">
							<label class="form-label mt-4"></label>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput"	placeholder="ID" name="mId" style=${css }>
								<label for="floatingInput">ID</label>
							</div>
							${ Message }
							<div class="form-floating">
								<input type="password" class="form-control"
									id="floatingPassword" placeholder="Password" name="mPwd">
								<label for="floatingPassword">Password</label>
							</div>
						</div>
						<div class="btn_wrap" style="display: flex; flex-direction: column; padding-top: 5%;">
						<button type="submit" class="btn btn-secondary" style="padding: 2% 0 2%;">로그인</button><br>
						<button type="submit" class="btn btn-secondary" onclick="location.href='/findform'" formaction="/findform" style="padding: 2% 0 2%;">ID/비밀번호 찾기</button>
						</div>
						
						</form>

					</div>



			</div>	<!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>