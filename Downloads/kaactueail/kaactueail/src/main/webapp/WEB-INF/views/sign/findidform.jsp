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
<title>ID 찾기</title>
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
				<h3>ID 찾기</h3>
				
				<div class="findpwd_wrap" style="margin: 12% 25%;">
				
				<form action="findid" method="POST">
					<div class="form-group">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput" name="mName" placeholder="이름">
							<label for="floatingInput">이름</label>
						</div>
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="전화번호" aria-label="전화번호"
									aria-describedby="button-addon2" name="mTel" style="padding: 2%" id = "mTel">
								<button class="btn btn-primary" type="button" id="button-addon2" onclick="authnum()">인증번호받기</button>
								<div style = "display:none;" class = "successMessage"><b >인증번호가 발송 되었습니다</b></div>
						</div>
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="인증번호" aria-label="인증번호"
									aria-describedby="button-addon2" name="authNum" style="padding: 2%" id = "authNum">
								<button class="btn btn-primary" type="button" id="button-addon2" onclick = "checkMessage()">인증번호확인</button>
								<div style = "display:none;" class = "authsuccessMessage"><b >인증 성공!</b></div>
						</div>
					</div>
					<div style="display: grid">
						<button type="submit" class="btn btn-secondary" style="padding: 1.5% 0 1.5%;">ID 찾기</button>
					</div>

				</form>

		</div>

<!-- 		이름: <input type="text" name="mName" id="mName"> <br /> 

		전화번호: <input type="text" name="mTel" id="mTel">
		<input type = "button" onclick="authnum()" class = "authbtn" value = "인증번호받기">
		<div style = "display:none;" class = "successMessage"><b >인증 번호가 발송 되었습니다 !</b></div>
		
		<input type="text" name="authNum" id="authNum" >
		<input type = "button" onclick = "checkMessage()" value = "인증번호 확인">
		
		<div style = "display:none;" class = "authsuccessMessage"><b >인증 성공 !</b></div>
		<input type = "submit" value = "아이디찾기" class = "successbtn" style = "display:none">
-->
			
 
			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	<!-- footer삽입 -->
<%@ include file="../layout/footer.jsp"%>
</body>
</html>