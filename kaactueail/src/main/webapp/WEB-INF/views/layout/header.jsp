<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="/resources/css/header.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>
		<div class="header">
			<div class="navbar_logo">
				<a href="/"><img class="logo" src="/resources/images/LOGO.png" /></a>
			</div>
			<div class="navbar_left">
				<ul class="left">
					<li><a class="menu_left" href="/infoboard/list">칵테일 소개</a></li>
					<li><a class="menu_left" href="/mycocktailboard/list">나만의 칵테일</a></li>
					<li><a class="menu_left" href="/freeboard/list">자유게시판</a></li>
					<li><a class="menu_left" href="/store/list">스토어</a></li>
				</ul>
			</div>
			
			
			<ul class="right">
				<c:if test="${mRole == 'ROLE_USER'}">
					 <li><span id="cart" class="material-icons" id="cart" style="color: white; cursor: pointer;" onclick="location.href='/bucketlist/list'">shopping_cart</span></li>
					 <!-- 회원일시 -->
					 <li><span class="material-icons" style="color: white; cursor: pointer;" onclick="location.href='/checkpwd'">person</span></li>
				</c:if>
				<c:if test = "${mRole ==  'ROLE_ADMIN'}">
				<li><span id="cart" class="material-icons" id="cart" style="color: white; cursor: pointer;" onclick = "window.location.href='/admin/cockitmanagement'"><i class="fa-sharp fa-solid fa-martini-glass-citrus"></i></span></li>
					 <!-- 회원일시 -->
					 <li><span class="material-icons" style="color: white; cursor: pointer;" onclick="location.href='/admin/usermanagement'"><i class="fa-solid fa-users"></i></span></li>
				</c:if>
				
				<!-- 로그인 안 했을 경우 -->
				<c:if test="${ mId == null }">
					<li><a href="/loginform">로그인</a></li>
					<li><a href="/signupform">회원가입</a></li>
				</c:if>
				
				<!-- 로그인 한 경우 -->
				<c:if test="${ mId != null }">
					<li><a href="/logout">로그아웃</a></li>
				</c:if>
				
					
				
				</ul>
			
<!-- 			<div class="search-box">
				<form action="." method="post">
					<input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" />
					<button class="search-btn" type="submit">찾기</button>
				</form>
			</div> 
			<div>
				<ul class="right">
					 <li><span id="cart" class="material-icons" id="cart" style="color: white; cursor: pointer;" >shopping_cart</span></li>
					 <!-- 회원일시 
					 <li><span class="material-icons" style="color: white; cursor: pointer;" onclick="location.href='/checkpwd'">person</span></li>
					 
				<!-- 로그인 안 했을 경우
				<c:if test="${ mId == null }">
					<li><a href="/loginform">로그인</a></li>
				</c:if>
				
				<!-- 로그인 한 경우
				<c:if test="${ mId != null }">
					<li><a href="/logout">로그아웃</a></li>
				</c:if>
				
					<li><a href="/signupform">회원가입</a></li>
				
				</ul> -->
			</div>
		</div>

		<div class="main_bar">
			<img class="img_bar" src="/resources/images/Bar_main.jpg" />
		</div>

<%-- <script type="text/javascript">

// 로그인 해야 장바구니로 이동 가능
$("#cart").on("click", function(){
	let mId = <%=(String)session.getAttribute("mId") %>
	if( mId == null){
		alert("로그인 후 이용해주세요");
		location.href= '/main';
	} else {
		location.href='/bucketlist/list';
	}
});


</script>
 --%>	
</body>
</html>