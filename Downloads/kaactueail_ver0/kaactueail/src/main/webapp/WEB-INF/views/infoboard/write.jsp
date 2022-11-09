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
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>칵테일 정보 등록 페이지</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">

<script type="text/javascript">
   function wirte(){
      alert("등록합니다!")   ;
      if(document.writeform.infoboardTitle.value==""){
         alert("제목을 입력해주세요");
      }else if(document.writeform.infoboardContent.value==""){
         alert("내용을 입력해주세요");
         document.writeform.infoboardContent.focus();
      }else if(document.writeform.infoboardRecipe.value==""){
         alert("내용을 입력해주세요");
         document.writeform.infoboardRecipe.focus();
      }else if(document.writeform.infoboardWriter.value==""){
         alert("내용을 입력해주세요");
         document.writeform.infoboardWriter.focus();     
      }else{
         //alert("쓰기")   ;
         document.writeform.submit(); //전송
      }
   }
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
					style="border: solid 2px; width: 500px; height: 500px; margin: auto;">
					<form action="upload_ok" method="post" enctype="multipart/form-data" style="margin-top: 20px;">
						파일 선택: <input type="file" name="file"> <input
							type="submit" value="전송">
					</form>
					<!-- 				<form method="post" action="/upload" enctype="multipart/form-data">
					<input type="file" name="uploadfile" multiple="multiple" /> <input
						type="submit" value="결과 확인" />
				</form> -->

					<br />

					<form name="writeform" action="/infoboard/write" method="post">
						<div class="input_wrap">
							<label>Title</label> <input name="infoboardTitle">
						</div>
						<div class="input_wrap">
							<label>Content</label>
							<textarea rows="3" name="infoboardContent"></textarea>
						</div>
						<div class="input_wrap">
							<label>Recipe</label>
							<textarea rows="3" name="infoboardRecipe"></textarea>
						</div>
						<div class="input_wrap">
							<label>Writer</label> <input name="infoboardWriter">
						</div>
						<!-- 					<div class="input_wrap">
						<label>Date</label> <input name="date" type="date">
					</div> -->

						<input class="btn" type="button" value="등록" onclick="wirte()" />
						<!-- <button class="btn">등록</button> -->
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
				<!-- write_form div -->
			</div>
		</div>
		<!-- footer삽입 -->
		<%@ include file="../layout/footer.jsp"%>
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