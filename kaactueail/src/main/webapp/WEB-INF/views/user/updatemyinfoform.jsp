<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- 추가 -->
	<meta charset="UTF-8" />
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

<h1>내정보 수정</h1>
<form action="updateminfo" method = "post">
ID : <font>${mId }</font><br/>
생년월일 : <font>${mBirth }</font><br/>
전화번호 : <font>${mTel }</font><br/>
이름  : <font>${mName} </font><br/>
비밀번호 : <input type = "password" oninput = "checkPwd(), checkPwd2()" name = "mPwd" id = "mPwd"> 
<font color = "red" id = "failpwd" style = "display:none">8자 이상 16자 미만 영문자를 조합해서 적어주세요.</font>
비밀번호 확인: <input type = "password" oninput = "checkPwd(), checkPwd2()"name = "pwcheck" id = "pwCheck"><br>
<input type = "submit" value = "수정"> &nbsp; &nbsp; &nbsp; <input type = "button" value = "뒤로가기" onclick = "window.location.href='mypage'">
</form>
</body>
</html>