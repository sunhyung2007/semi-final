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
<link rel="stylesheet" href="/resources/css/detailLayout.css">
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">

				<h3>자유게시판</h3>
				<div class="btn_wrap">
					<button type="button" class="btn btn-dark" id="write_btn">글쓰기</button>
					<button type="button" class="btn btn-dark" id="list_btn">목록</button>
					<button type="button" class="btn btn-dark" id="modifty_btn">수정</button>
					<button type="button" class="btn btn-dark" id="delete_btn">삭제</button>
				</div>
				<form id="detailForm" action="/freeboard/modify" method="get">
					<input type="hidden" id="FB_num" name="FB_num"
						value="<c:out value= '${pageDetail.FB_num}'/>">
				</form>
				<div class="layout_all">
					<div class="layout_title">
						<div>
							<input name="FB_num" readonly
								value='<c:out value="${pageDetail.FB_num}"/>'>
						</div>
						<div>
							<input style="border: 0 solid balck;"
								name="FB_title" readonly
								value='<c:out value="${pageDetail.FB_title}"/>'>
						</div>
					</div>
						<div class="layout_middle">
							<div>
								<input style="border: 0 solid balck;"
									name="FB_writer" readonly
									value='<c:out value="${pageDetail.FB_writer}"/>'>
							</div>
							<div>
								<input name="FB_date"
									value='<fmt:formatDate pattern="yyyy.MM.dd" value="${pageDetail.FB_date}"/>'
									readonly>
							</div>
							<div>
								<input name="FB_readcount" readonly
									value='<c:out value="${pageDetail.FB_readcount}"/>'>
							</div>
						</div>
						<div class="layout_content">
							<div>
								<input name="FB_content" readonly
									value='<c:out value="${pageDetail.FB_content}"/>'>
							</div>
						</div>
					</div>

								
				</div> <!-- main contents end -->	
			</div> <!-- contents end -->
		</div> <!-- wrapper end -->
		
	<!-- 목록/수정버튼 클릭 시 이동하는 로직 -->
<script>
	let form = ${"#detailForm"};
	
	$("#list_btn").on("click", function(e){
		form.find("#FB_num").remove();
		form.attr("action", "/freeboard/list");
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modify");
	});
</script>

	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>