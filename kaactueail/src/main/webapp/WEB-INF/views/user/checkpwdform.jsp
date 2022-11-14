<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>MyPage</title>
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>회원 정보 수정</h3>
				
				<p>확인을 위해 회원님의 비밀번호를 입력해주세요</p>
				<div class="login_wrap" style="margin: 8% 25%;">
				
					<form action="checkpwd" method = "post">
							<div class="form-floating">
								<input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="mPwd" id = "mPwd">
								<label for="floatingPassword">Password</label>
							</div>
							<div class="btn_wrap" style="display: flex; flex-direction: column; padding-top: 5%;">
								<button type="submit" class="btn btn-secondary" style="padding: 2% 0 2%;">확인</button><br>
							</div>
					
					</form>

				</div>




			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->


	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>

</body>
</html>