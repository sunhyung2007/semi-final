<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- <link href="/resources/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon"> -->
<!-- <link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/upload.css"> -->
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 추가 -->
<meta charset="UTF-8" />
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>칵테일 정보 등록 페이지</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">

<script type="text/javascript">
	function wirte() {
		alert("등록합니다!");

		document.writeform.submit(); //전송

	}
	/*    function filename(){
	 $.ajax({
	 url: "upload_ok",
	 success: function(){
	 console.log("sadfd");
	 }
	 })
	 } */
</script>


</head>

<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<!-- 중요한게 form태그안에 enctype="multipart/form-data를 입력 해주어야한다. -->

		<div class="contents">
			<div class="main_contents">
				<div class="write_contents"
					style="text-align: center; margin: auto;">
					<!-- <form action="upload" method="post" enctype="multipart/form-data"
						style="margin-top: 20px;">
						파일 선택: <input type="file" name="file" oninput="filename()">
						<input type="submit" value="전송">
					</form> -->

					${message } <br />
					<c:set var="filename" value="${filename}" />
					<form name="writeform" action="/mycocktailboard/write"
						method="post">
						<div class="form-group" style="text-align: left;">
							<label for="exampleTextarea" class="form-label mt-4">칵테일
								이름</label>
							<textarea name="mycocktailImgName" class="form-control"
								id="exampleTextarea" rows="1" placeholder="칵테일 이름을 입력하세요"
								required></textarea>
						</div>
						<div class="form-group" style="text-align: left;">
							<label for="exampleTextarea" class="form-label mt-4">제목</label>
							<textarea name="mycocktailTitle" class="form-control"
								id="exampleTextarea" rows="1" placeholder="제목을 입력하세요" required></textarea>
						</div>
						<div class="form-group" style="text-align: left;">
							<label for="exampleTextarea" class="form-label mt-4">내용</label>
							<textarea name="mycocktailContent" class="form-control"
								id="exampleTextarea" rows="15" placeholder="내용을 입력하세요" required></textarea>
						</div>
						<div class="form-group" style="text-align: left;">
							<label for="exampleTextarea" class="form-label mt-4">레시피</label>
							<textarea name="mycocktailRecipe" class="form-control"
								id="exampleTextarea" rows="5" placeholder="내용을 입력하세요" required></textarea>
						</div>
						<div class="form-group" style="text-align: left;">
							<label for="exampleTextarea" class="form-label mt-4">작성자</label>
							<input type="text" class="form-control" id="inputDefault"
								name="mycocktailWriter" placeholder="작성자를 입력하세요">
						</div>
						<!-- <div style="text-align: left;"><input class="btn" type="button" value="등록" onclick="wirte()" /></div> -->
						<div>
						<button type="submit" class="btn btn-dark" id="list_btn"
							onclick="wirte()">등록</button>
							<button type="submit" class="btn btn-dark" id="list_btn"
						onclick="location.href='list'">취소</button></div>
					</form>
					

					<%-- <div class="pageInfo_wrap">
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
					<form action="upload" method="post" enctype="multipart/form-data"
						style="margin-top: 20px;">
						파일 선택: <input type="file" name="file" oninput="filename()">
						<input type="submit" value="전송">
					</form>
				</div>
				<!-- write_form div -->
			</div>
		</div>

	</div>
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
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