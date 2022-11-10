<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>Insert title here</title>
<!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/modifyLayout.css" />
</head>
<body>
 	<%@ include file="../layout/header.jsp"%>
 		<div class="wrapper">
		<div class="contents">
			<div class="main_contents">

				<h3>글수정</h3>
				<form action="/infoboard/modify" id="modifyForm" method="post">
					<div class="btn_wrap">
						<button type="submit" class="btn btn-dark" id="list_btn">목록</button>
						<button type="submit" class="btn btn-dark" id="modifty_btn">수정</button>
						<button type="submit" class="btn btn-dark" id="delete_btn" onclick="loaction.href='delete'" formaction="/infoboard/delete" formmethod="post">삭제</button>
					</div>					

				<div class="layout_all">
					<div class="layout_title">
						<div>
							<label>칵테일 번호</label> 
							<input type="text" class="form-control" id="infoboardNum" name="infoboardNum" value="<c:out value= '${pagemodify.infoboardNum}'/>" readonly style="border: none">
						</div>
						<div class="title">
							<label>칵테일 이름</label>
							<input type="text" class="form-control" id="infoboardTitle" name="infoboardTitle" value="<c:out value= '${pagemodify.infoboardTitle}'/>" readonly>
						</div>
					</div>
					<hr />

					<div class="layout_middle">
						<div class="text-secondary" id="writer">
							<label>작성자</label>	
							<input type="text" class="form-control" id="infoboardWriter" name="infoboardWriter" value="<c:out value= '${pagemodify.infoboardWriter}'/>" readonly style="border: none">
						</div>
						<div>
							<label>조회수</label>
							<input type="text" class="form-control" id="infoboardReadcount" name="infoboardReadcount" value="<c:out value="${pagemodify.infoboardReadcount}" />" readonly style="border: none">
						</div>
					</div>
					<div class="layout_content">
						<label>칵테일 내용</label>
						<textarea name="infoboardContent" class="form-control" id="exampleTextarea"
							rows="15"><c:out value="${pagemodify.infoboardContent}" /></textarea>
						<label>칵테일 레시피</label>	
						<textarea name="infoboardRecipe" class="form-control" id="exampleTextarea2"
							rows="15"><c:out value="${pagemodify.infoboardRecipe }"/></textarea>
					</div>
					<div class="text-secondary" id="writedate">										
						<p>날짜: <fmt:formatDate pattern="yyyy.MM.dd" value="${pagemodify.infoboardDate}" /></p>
					</div>					
				</div>
				</form>
				
				<form id="detailForm" action="/infoboard/modify" method="get">
					<input type="hidden" id="infoboardNum" name="infoboardNum" value="<c:out value= '${pagemodify.infoboardNum}'/>">
				</form>


			</div>
			<!-- main contents end -->
		</div>
		<!-- contents end -->
	</div>
	<!-- wrapper end -->

	<!-- 버튼 클릭 시 이동 로직 
<script>
	let form = ${"#detailForm"};
	let mForm = $("#modifyForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#freeboardNum").remove();
		form.attr("action", "/1board/list");
		form.submit();
	});
 	

</script> -->

	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>