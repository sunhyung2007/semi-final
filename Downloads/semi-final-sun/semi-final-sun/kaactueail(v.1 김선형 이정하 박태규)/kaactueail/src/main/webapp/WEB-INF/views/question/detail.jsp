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
<title>고객센터</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/detailLayout_freeb.css"/>
<!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>

	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">

				<h3>고객센터</h3>
				<div class="btn_wrap">
					<button type="submit" class="btn btn-dark" id="write_btn"
						onclick="location.href='write'">글쓰기</button>
					<button type="submit" class="btn btn-dark" id="list_btn"
						onclick="location.href='list?pageNum=${ cri.pageNum }&amount=${ cri.amount }'">목록</button>
						
					<%-- <button class="btn btn-dark" id="modifty_btn" onclick="location.href='modify?freeboardNum=${pageDetail.freeboardNum}'">수정</button> --%>
					<!-- <button type="submit" class="btn btn-dark" id="delete_btn" onclick="loaction.href='delete'" formaction="/freeboard/delete" formmethod="post">삭제</button> -->
				</div>

				<%-- <form id="detailForm" action="/freeboard/modify" method="get">
					<input type="hidden" id="freeboardNum" name="freeboardNum" value="<c:out value= '${pageDetail.freeboardNum}'/>">
				</form> --%>

				<div class="layout_all">
					<div class="layout_title">
						<div>
							<input id="questionNum" name="questionNum"
								value="<c:out value= '${pagedetail.questionNum}'/>" readonly>
						</div>
						<div class="title">
							<input id="questionTitle" name="questionTitle"
								value="<c:out value= '${pagedetail.questionTitle}'/>" readonly>
						</div>
					</div>
					<hr />

					<div class="layout_middle">
						<div class="text-secondary" id="writer">
							<input id="questionWriter" name="questionWriter"
								value="<c:out value= '${pagedetail.questionWriter}'/>" readonly>
						</div>
						<div class="text-secondary" id="writedate">
							<input id="questionDate" name="questionDate"
								value="<fmt:formatDate pattern="yyyy.MM.dd" value="${pagedetail.questionDate}" />"
								readonly>
						</div>
					</div>
					<div class="layout_content">
						<textarea name="questionContent" class="form-control"
							id="exampleTextarea" rows="15" readonly style="border: none;"><c:out
								value="${pagedetail.questionContent}" /></textarea>
					</div>
				</div>
				<h4>답변내용</h4>
				<hr>
				<!-- 댓글 -->
				<c:forEach items="${ answer }" var="answer">
				<div class="answer"
					style="display: flex; justify-content: space-between;">
					<div class="text-secondary" id="writedate">
						<p>
							<c:out value="${ answer.answerContent }" />
						</p>
					</div>
					<div>
						<p>
							<fmt:formatDate pattern="yyyy.MM.dd" value="${answer.answerDate}" />
						</p>
					</div>
				</div>
				</c:forEach>


				<!-- Role이 관리자일 경우 댓글작성 가능 -->
			<c:if test="${ mRole eq 'ROLE_ADMIN' }">
				<form action="/question/answer" method="get">
					<div class="answerinput">
					<div>
						<textarea name="answerContent" class="form-control"
							id="exampleTextarea" rows="5" placeholder="답변 내용 작성"></textarea>
					</div>
					
					<div>
						<button type="submit" class="btn btn-dark" id="write_btn" style="float: right;"
						onclick="location.href='#'">작성</button>
						<input type="hidden" name="answerQuestionNum" value="${ pagedetail.questionNum }">
					</div>
					</div>
				</form>
			</c:if>



		</div>
			<!-- main contents end -->
		</div>
		<!-- contents end -->
	</div>
	<!-- wrapper end -->


	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>