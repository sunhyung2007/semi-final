<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>MyPage</title>
</head>
<body>
<script>
function regPassword(mPwd) { //8~16자 영문, 숫자 조합
	var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
	return regExp.test(mPwd);
}
function checkPwd() {
	var inputed = $('#mPwd').val();
	
	$.ajax({
		success: function() {
			if(regPassword(inputed) == false || inputed.length > 16) {
				$("#mPwd").css("background-color", "#FFCECE");
				$("#failpwd").css("display", "block");
				pwdCheck = 0;
			} else if(regPassword(inputed) == true) {
				$("#failpwd").css("display", "none");
				$("#mPwd").css("background-color", "#B0F6AC");
				pwdCheck = 1;
			}
		}
	})
}
function checkPwd2() {
	var inputed = $('#pwCheck').val();
	var inputed1 = $('#mPwd').val();
	
	$.ajax({
		success: function() {
			if(inputed != inputed1) {
				$("#pwCheck").css("background-color", "#FFCECE");
				pwCheck = 0;
			} else if(inputed == inputed1) {
				$("#pwCheck").css("background-color", "#B0F6AC");
				pwCheck = 1;
			}
		}
	})
}



$("#update").on("click", function(){
	alert("변경이 완료되었습니다")
});
</script>

	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
			<h3>내 정보 수정</h3>
			
			
			<div class="layout_all" style="margin: 1% 23%">
				<form action="updateminfo" method = "post">
					<div class="form-group">
  						<label class="col-form-label mt-4" for="inputLarge">ID</label>
  						<input class="form-control form-control-lg" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="" value="${mId}">
					</div>
					<div class="form-group">
  						<label class="col-form-label mt-4" for="inputLarge">이름</label>
  						<input class="form-control form-control-lg" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="" value="${mName}">
					</div>
					<div class="form-group">
  						<label class="col-form-label mt-4" for="inputLarge">생년월일</label>
  						<input class="form-control form-control-lg" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="" value="${mBirth}">
					</div>
					<div class="form-group">
  						<label class="col-form-label mt-4" for="inputLarge">전화번호</label>
  						<input class="form-control form-control-lg" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="" value="${mTel}">
					</div>
					<div class="form-group">
  						<label class="col-form-label mt-4" for="inputDefault">New Password</label>
  						<input type="password" class="form-control form-control-lg"  name="mPwd" id="mPwd" oninput = "checkPwd(), checkPwd2()" placeholder="Password">
					</div>
					<font color = "red" id = "failpwd" style = "display:none">8자 이상 16자 미만 영문자를 조합해서 적어주세요.</font>
					<div class="form-group">
  						<label class="col-form-label mt-4" for="inputDefault">New Password 확인</label>
  						<input type="password" class="form-control form-control-lg"  name="pwcheck" id="pwCheck" oninput = "checkPwd(), checkPwd2()" placeholder="Password 확인">
					</div>
					
					<div class="btns_wrap" style="display: grid; padding-top:4%;">
						<input id="update" type = "submit" class="btn btn-secondary" value ="UPDATE" style="margin-bottom: 1%; padding: 1.8%;">
						<input type = "button" class="btn btn-secondary" value = "go back" style="padding: 1.8%;" onclick = "window.location.href='/main'">
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