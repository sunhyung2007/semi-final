<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>내 정보 수정</title>
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
</script>

	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">

<form action="updateminfo" method = "post">
<h1 class="display-1">내 정보 수정</h1>
<div class="alert alert-secondary" role="alert" style = "width: 250px;">
 ID: <font class="alert-link">${mId}</font>
</div>
<div class="alert alert-success" role="alert" style = "width: 250px;">
생년월일:  <font class="alert-link">${mBirth }</font>
</div>
<div class="alert alert-primary" role="alert"style = "width: 250px;">
 전화번호: <font class="alert-link">${mTel }</font> 
</div>
<div class="alert alert-info" role="alert" style = "width: 250px;">
이름: <font class="alert-link">${mName }</font> 
</div>

<div class="form-floating" style = "display: flex">
    <input type="password" class="form-control" name = "mPwd" id = "mPwd" style = "width:250px" id="floatingPassword" oninput = "checkPwd(), checkPwd2()" placeholder="Password">
    <label for="floatingPassword" >New Password</label> </div>
    <font color = "red" id = "failpwd" style = "display:none">8자 이상 16자 미만 영문자를 조합해서 적어주세요.</font><br/> 
    <input type="password" class="form-control" name = "pwcheck" id = "pwCheck" style = "width:250px; height:58px;" id="floatingPassword" oninput = "checkPwd(), checkPwd2()" placeholder="패스워드확인"> <br/><br/>
	<input type = "submit" class="btn btn-primary"    value = "UPDATE"> &nbsp; &nbsp; &nbsp; <input type = "button" class="btn btn-primary" value = "go back" onclick = "window.location.href='mypage'">
</form>

			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->

	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>