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
<link rel="stylesheet" href="/resources/css/detailLayout_freeb.css"/>
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>


	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">

				<h3>자유게시판</h3>


					<div class="btn_wrap">
						<button class="btn btn-dark" id="list_btn" onclick="location.href='list?pageNum=${ cri.pageNum }&amount=${ cri.amount }' ">목록</button>
						<!-- 회원가입되어 있으면 -->
						<c:if test="${ mRole != null }">
						<button type="submit" class="btn btn-dark" id="write_btn" onclick="location.href='write'">글쓰기</button>
						<c:if test="${ mRole eq 'ROLE_ADMIN' }">
							<form action="/freeboard/delete" method="post">
								<button type="submit" class="btn btn-dark" id="delete_btn" onclick="loaction.href='delete'">삭제</button>
								<input type="hidden" id="freeboardNum" name="freeboardNum" value="<c:out value= '${pageDetail.freeboardNum}'/>">
							</form>
						</c:if>

						<!-- 로그인한 세션 ID와 작성자 ID가 같거나 관리자 권한이면 수정 버튼 보임 -->
						<c:if test="${ mId == pageDetail.freeboardWriter}">
							<button class="btn btn-dark" id="modifty_btn" onclick="location.href='modify?freeboardNum=${pageDetail.freeboardNum}'">수정</button>
							<form action="/freeboard/delete" method="post">
								<button type="submit" class="btn btn-dark" id="delete_btn" onclick="loaction.href='delete'">삭제</button>
								<input type="hidden" id="freeboardNum" name="freeboardNum" value="<c:out value= '${pageDetail.freeboardNum}'/>">
							</form>
						</c:if>
						</c:if>
					</div>


				<div class="layout_all">
					<div class="layout_title">
						<div>
							<input id="freeboardNum" name="freeboardNum" value="<c:out value= '${pageDetail.freeboardNum}'/>" readonly>
						</div>
						<div class="title">
							<input id="freeboardTitle" name="freeboardTitle" value="<c:out value= '${pageDetail.freeboardTitle}'/>" readonly>
						</div>
					</div>
					<hr/>

					<div class="layout_middle">
						<div class="text-secondary" id="writedate">
							<input id="freeboardDate" name="freeboardDate" value="<fmt:formatDate pattern="yyyy.MM.dd" value="${pageDetail.freeboardDate}" />" readonly>
						</div>
						<div>
							<input id="freeboardReadcount" name="freeboardReadcount" value="<c:out value="${pageDetail.freeboardReadcount}" />" readonly>

						</div>
					</div>
					<div class="layout_content">
						<textarea name="freeboardContent" class="form-control" id="exampleTextarea"
							rows="15" readonly style="border: none; "><c:out value="${pageDetail.freeboardContent}" /></textarea>
					</div>
				</div>


			</div> 	<!-- main contents end -->
		</div> 	<!-- contents end -->
	</div> 	<!-- wrapper end -->


	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>