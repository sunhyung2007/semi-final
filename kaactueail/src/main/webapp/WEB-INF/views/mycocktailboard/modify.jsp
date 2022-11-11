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
				<form action="/mycocktailboard/modify" id="modifyForm" method="post">
					<div class="btn_wrap">
						<button type="submit" class="btn btn-dark" id="list_btn">목록</button>
						<button type="submit" class="btn btn-dark" id="modifty_btn">수정</button>
						<button type="submit" class="btn btn-dark" id="delete_btn"
							onclick="loaction.href='delete'"
							formaction="/mycocktailboard/delete" formmethod="post">삭제</button>
					</div>

					<div class="layout_all">
						<div class="layout_title">
							<div style="text-align: center;">
								<label>나만의 칵테일 게시판 번호</label> <input type="text"
									class="form-control" id="mycocktailNum" name="mycocktailNum"
									value="<c:out value= '${pagemodify.mycocktailNum}'/>" readonly
									style="border: none">
								<div class="text-secondary" id="writer">
									<label>작성자</label> <input type="text" class="form-control"
										id="mycocktailWriter" name="mycocktailWriter"
										value="<c:out value= '${pagemodify.mycocktailWriter}'/>"
										readonly style="border: none">
								</div>
								<div>
									<label>조회수</label> <input type="text" class="form-control"
										id="mycocktailReadcount" name="mycocktailReadcount"
										value="<c:out value="${pagemodify.mycocktailReadcount}" />"
										readonly style="border: none">
								</div>
								<p>
									날짜:
									<fmt:formatDate pattern="yyyy.MM.dd"
										value="${pagemodify.mycocktailDate}" />
								</p>
							</div>
						</div>
						<hr />
						<div class="layout_middle"></div>
						<div class="layout_content">
							<div class="title">
								<label>제목</label>
								<textarea name="mycocktailTitle" class="form-control"
									id="exampleTextarea" rows="2"><c:out
										value="${pagemodify.mycocktailTitle}" /></textarea>
							</div>
							<label>칵테일 내용</label>
							<textarea name="mycocktailContent" class="form-control"
								id="exampleTextarea" rows="15"><c:out
									value="${pagemodify.mycocktailContent}" /></textarea>
							<label>칵테일 레시피</label>
							<textarea name="mycocktailRecipe" class="form-control"
								id="exampleTextarea2" rows="5"><c:out
									value="${pagemodify.mycocktailRecipe }" /></textarea>
						</div>
						<div class="text-secondary" id="writedate">
							<div>
								<button type="submit" class="btn btn-dark" id="list_btn"
									onclick="modify()">등록</button>
								<button type="submit" class="btn btn-dark" id="list_btn"
									onclick="location.href='list'">취소</button>
							</div>
						</div>
					</div>
				</form>

				<form id="detailForm" action="/mycocktailboard/modify" method="get">
					<input type="hidden" id="mycocktailNum" name="mycocktailNum"
						value="<c:out value= '${pagemodify.mycocktailNum}'/>">
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