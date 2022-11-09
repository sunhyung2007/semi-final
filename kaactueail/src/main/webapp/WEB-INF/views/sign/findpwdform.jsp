<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>비밀번호 찾기</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>

<script>
function authnum() {
	var inputed = $("#mTel").val();
	$.ajax({
		data: {
			mTel : inputed
		},
		url : "sendMessage",
		success: function() {
			$(".authbtn").prop("disabled",true);
			$(".authbtn").css("display", "none");
			$(".successMessage").css("display", "block");
		}		
	});
}
function checkMessage() {
	var inputed = $("#authNum").val();
	$.ajax({
		data : {
			authNum : inputed
		},
		url : "checkMessage",
		success : function(data) {
			if(data == '1') {
				$(".authsuccessMessage").css("display", "block");
				$(".successbtn").css("display", "block");
			}
		}
	})
}
</script>
<body>
<!-- header삽입 -->
<%@ include file="../layout/header.jsp"%>
	
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">

	<h3>비밀번호 찾기</h3>

	<form action="findpwd" method="POST">
		아이디 : <input type = "text" name = "mId" id = "mId"> <br/>
		이름 : <input type="text" name="mName" id="mName"> <br /> 
		전화번호 : <input type="text" name="mTel" id="mTel">
		<input type = "button" onclick="authnum()" class = "authbtn" value = "인증번호받기">
		<div style = "display:none;" class = "successMessage"><b >인증 번호가 발송 되었습니다 !</b></div>
		<input type="text" name="authNum" id="authNum" > <input type = "button" onclick = "checkMessage()" value = "인증번호 확인">
		<div style = "display:none;" class = "authsuccessMessage"><b >인증 성공 !</b></div>
		<input type = "submit" value = "아이디찾기" class = "successbtn" style = "display:none">
	</form>



			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>