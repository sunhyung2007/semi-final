<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="/resources/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/upload.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
</head>
<body>
	<h1>여기는 칵테일정보 작성 페이지</h1>
	<div class="wrapper">

		<div class="header">
			<div class="navbar_logo">
				<a href="#"><img class="logo" src="/resources/images/LOGO.png" /></a>
			</div>
			<div class="navbar_left">
				<ul class="left">
					<li><a class="menu_left" href="/infoboard/list">칵테일 소개</a></li>
					<li><a class="menu_left" href="/mycocktailboard/list">나만의
							칵테일</a></li>
					<li><a class="menu_left" href="/freeboard/list">자유게시판</a></li>
					<li><a class="menu_left" href="#">스토어</a></li>
				</ul>
			</div>

			<div class="search-box">
				<form action="." method="post">
					<input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" />
					<button class="search-btn" type="submit">찾기</button>
				</form>
			</div>
			<div>
				<ul class="right">
					<li><a href="#">카트</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="/login/list">로그인</a></li>
					<li><a href="/join/list">회원가입</a></li>
				</ul>
			</div>
		</div>

		<div class="main_bar">
			<img class="img_bar" src="/resources/images/Bar_main.jpg" />
		</div>
		<!-- 중요한게 form태그안에 enctype="multipart/form-data를 입력 해주어야한다. -->
		<div class="contents">
			<div class="main_contents">
				<form action="upload_ok" method="post" enctype="multipart/form-data">
					파일 선택: <input type="file" name="file"> 
					<input type="submit" value="전송">
				</form>
<!-- 				<form method="post" action="/upload" enctype="multipart/form-data">
					<input type="file" name="uploadfile" multiple="multiple" /> <input
						type="submit" value="결과 확인" />
				</form> -->

				<br />

				<form action="/infoboard/write" method="post">
					<div class="input_wrap">
						<label>Title</label> <input name="infoBoardTitle">
					</div>
					<div class="input_wrap">
						<label>Content</label>
						<textarea rows="3" name="infoBoardContent"></textarea>
					</div>
					<div class="input_wrap">
						<label>Recipe</label>
						<textarea rows="3" name="infoBoardRecipe"></textarea>
					</div>
					<div class="input_wrap">
						<label>Writer</label> <input name="infoBoardWriter">
					</div>
<!-- 					<div class="input_wrap">
						<label>Date</label> <input name="date" type="date">
					</div> -->
					<button class="btn">등록</button>
				</form>


<%-- 				<div class="pageInfo_wrap">
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo">

							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a
									href="${pageMaker.startPage-1}">Previous</a></li>
							</c:if>

							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
									href="${num}">${num}</a></li>
							</c:forEach>

							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a
									href="${pageMaker.endPage + 1 }">Next</a></li>
							</c:if>

						</ul>
					</div>
				</div>


				<form id="menuForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form> --%>

			</div>
		</div>

		<div class="footer">
			<div class="foo_enterprise">
				<ul>
					<li>사업자번호: 123-45-67890</li>
					<li>대표자명: 홍길동</li>
					<li>주소: 서울특별시 종로구 창경궁로 254 7층</li>
				</ul>
			</div>
			<div class="foo_help">
				<a href="#">고객센터</a>
			</div>

		</div>
	</div>
	<script>
/*     $("#gdsImg").change(function(){
     if(this.files &amp;&amp; this.files[0]) {
      var reader = new FileReader;
      reader.onload = function(data) {
       $(".select_img img").attr("src", data.target.result).width(500);          
      }
      reader.readAsDataURL(this.files[0]);
     }
    }); */
   </script>

</body>
</html>