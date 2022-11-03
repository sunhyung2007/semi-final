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
<title>자유게시판</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>자유게시판</h3>

				<table class="table table-hover">
					<tr class="table-dark">
						<th scope="col">게시글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>

					<c:forEach items="${ list }" var="list">
						<tr>
							<td scope="row"><c:out value="${list.FB_num}" /></td>
							<td><a class="move_detail"
								href='/freeboard/detail?FB_num=<c:out value="${list.FB_num}"/>'>
									<c:out value="${list.FB_title}" />
							</a></td>
							<td><c:out value="${list.FB_writer}" /></td>
							<td><fmt:formatDate value="${list.FB_date}"
									pattern="yyyy.MM.dd" /></td>
							<td><c:out value="${list.FB_readcount}" /></td>
						</tr>
					</c:forEach>
				</table>

				<form id="moveForm" method="get"></form>
				<script>
					let moveForm = $("#moveForm");

					$(".move").on("click",function(e) {
							e.preventDefault();
							moveForm.append("<intput type='hidden' name='FB_num' value=''"+ $(this).attr("href")+ "'>'");
										moveForm.submit();
									});
				</script>

				<button type="button" class="btn btn-dark" id="write_btn">글쓰기</button>
				<button type="button" class="btn btn-dark" id="modifty_btn">수정</button>
				<button type="button" class="btn btn-dark" id="delete_btn">삭제</button>
				<div class="btn-toolbar" role="toolbar"
					aria-label="Toolbar with button groups">
					<div class="btn-group me-2" role="group" aria-label="First group">
						<button type="button" class="btn btn-secondary">1</button>
						<button type="button" class="btn btn-secondary">2</button>
						<button type="button" class="btn btn-secondary">3</button>
						<button type="button" class="btn btn-secondary">4</button>
					</div>
					<div class="btn-group me-2" role="group" aria-label="Second group">
						<button type="button" class="btn btn-secondary">5</button>
						<button type="button" class="btn btn-secondary">6</button>
						<button type="button" class="btn btn-secondary">7</button>
					</div>
					<div class="btn-group" role="group" aria-label="Third group">
						<button type="button" class="btn btn-secondary">8</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>