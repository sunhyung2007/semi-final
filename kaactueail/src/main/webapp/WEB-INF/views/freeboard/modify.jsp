<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp" %>
<title>자유게시판</title>
<!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/modifyLayout.css"/>
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>

	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">

				<h3>글수정</h3>
				<form action="/freeboard/modify" id="modifyForm" method="post">
					<div class="btn_wrap">
						<button type="submit" class="btn btn-dark" id="write_btn"
							onclick="location.href='write'">글쓰기</button>
						<button type="submit" class="btn btn-dark" id="list_btn">목록</button>
						<button class="btn btn-dark" id="modifty_btn">수정</button>
						<button class="btn btn-dark" id="delete_btn">삭제</button>
					</div>

					<div class="layout_all">
						<div class="layout_title">
							<div>
							<input type="hidden" id="freeboardNum" name="freeboardNum"
						value="<c:out value= '${pagemodify.freeboardNum}'/>">
								<p>
									<c:out value="${pagemodify.freeboardNum}" />
								</p>
							</div>
							<div class="title">
								<input type="text" class="form-control" id="inputDefault"
									name="freeboardTitle"
									value="<c:out value='${pagemodify.freeboardTitle}'/>">
							</div>
						</div>
						<hr />

						<div class="layout_middle">
							<div class="text-secondary" id="writer">
								<p>
									<c:out value="${pagemodify.freeboardWriter}" />
								</p>
							</div>
							<div class="text-secondary" id="writedate">
								<p>
									<fmt:formatDate pattern="yyyy.MM.dd"
										value="${pagemodify.freeboardDate}" />
								</p>
							</div>
							<div>
								<p>
									<c:out value="${pagemodify.freeboardReadcount}" />
								</p>
							</div>
						</div>
						<div class="layout_content">
							<div>
								<textarea name="freeboardContent" class="form-control"
									id="exampleTextarea" rows="15"><c:out
										value="${pagemodify.freeboardContent}" /></textarea>
							</div>
						</div>
					</div>
				</form>
				<form id="detailForm" action="/freeboard/modify" method="get">
					<input type="hidden" id="freeboardNum" name="freeboardNum"
						value="<c:out value= '${pagemodify.freeboardNum}'/>">
				</form>
				

			</div>
			<!-- main contents end -->
		</div>
		<!-- contents end -->
	</div>
	<!-- wrapper end -->

	<!-- 목록/수정버튼 클릭 시 이동하는 로직 -->
<script>
	let form = ${"#detailForm"};
	let mForm = $("#modifyForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#freeboardNum").remove();
		form.attr("action", "/freeboard/list");
		form.submit();
	});
	
 	$("#modify_btn").on("click", function(e){
		mform.submit();
	}); 
</script>

	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>