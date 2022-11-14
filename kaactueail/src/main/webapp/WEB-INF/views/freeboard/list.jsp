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
							<td scope="row"><c:out value="${list.freeboardNum}" /></td>
 							<td>
 								<a class="move" href='<c:out value="${list.freeboardNum}" />'>
 								<c:out value="${list.freeboardTitle}" />
 								</a>
 							</td>
							<td><c:out value="${list.freeboardWriter}" /></td>
							<td><fmt:formatDate value="${list.freeboardDate}" pattern="yyyy.MM.dd" /></td>
							<td><c:out value="${list.freeboardReadcount}" /></td>
						</tr>
					</c:forEach>
				</table>



				<div class="numbers_wrap" style="display:flex; justify-content: space-around;">
					<div>
						<ul class="pagination">
							<!-- 이전버튼 -->
							<c:if test="${ paging.prev }">
								<li class="page-item"><a class="page-link" href="${ paging.startPage-1 }">&laquo;</a></li>
							</c:if>
							<!-- 페이지개수 -->
							<c:forEach var="num" begin="${ paging.startPage }" end="${ paging.endPage }">
								<li class="page-item ${ paging.cri.pageNum == num ? "active":"" }">
									<a class="page-link" href="${ num }">${ num }</a>
								</li>
							</c:forEach>
							<!-- 다음버튼 -->
							<c:if test="${ paging.next }">
								<li class="page-item"><a class="page-link" href="${ paging.endPage+1 }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				
				<div class="btns_wrap" style="display: flex; justify-content: flex-end; align-items: center;">
					<div class="dropbox" style="display: flex; align-items: center; padding-right: 1%">
								<select name="type">
									<option value="" <c:out value="${ paging.cri.type == null ? 'selected' : ''}"/> >선택</option>
									<option value="T" <c:out value="${ paging.cri.type eq 'T'? 'selected' : ''}"/>>제목</option>
									<option value="C" <c:out value="${ paging.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
									<option value="W" <c:out value="${ paging.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
									<option value="TC" <c:out value="${ paging.cri.type eq 'TC' ? 'selected' : ''}"/>>제목+내용</option>
									<option value="TW" <c:out value="${ paging.cri.type eq 'TW' ? 'selected' : ''}"/>>제목+작성자</option>
									<option value="TCW" <c:out value="${ paging.cri.type eq 'TCW' ? 'selected' : ''}"/>>제목+내용+작성자</option>
								</select>

								<input class="form-control me-sm-2" type="text" placeholder="Search" name="keyword">
								<button id="search_btn" class="btn btn-secondary my-2 my-sm-0" type="submit" href="keyword=${ paging.cri.keyword }&type=${ paging.cri.type }">Search</button>
					</div>
					
					<!-- 회원가입 한 경우에만 글 작성 가능 -->
					<c:if test="${ mRole != null }">
					<div class="btn_wrap" style="float: right;">
						<button type="button" class="btn btn-dark" id="write_btn"
							onclick="location.href='write'" formmethod="get">글쓰기</button>
					</div>
					</c:if>
				</div>
				<form id="moveForm" method="get">
					<input type="hidden" name="pageNum" value="${ paging.cri.pageNum }">
					<input type="hidden" name="amount" value="${ paging.cri.amount }">
					<input type="hidden" name="keyword" value="${ paging.cri.keyword }">
					<input type="hidden" name="type" value="${ paging.cri.type }">
				</form>


			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	
	
<script type="text/javascript">

let moveForm = $("#moveForm");

$(document).on("click", ".move", function(e){
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='freeboardNum' value='"+ $(this).attr("href")+ "'>");
	moveForm.attr("action", "/freeboard/detail");
	moveForm.submit();
});

$(".pagination a").on("click", function(e){
	e.preventDefault();
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	moveForm.attr("action", "/freeboard/list");
	moveForm.submit();
	
});	


$("#search_btn").on("click", function(e){
	e.preventDefault();
	
	let type = $(".dropbox select").val();
	let keyword = $(".dropbox input[name='keyword']").val();
	
	if(!type){
		alert("검색 종류를 선택하세요.");
		return false;
	}
	
	if(!keyword){
		alert("키워드를 입력하세요.");
		return false;
	}		
	
	moveForm.find("input[name='type']").val(type);
	moveForm.find("input[name='keyword']").val(keyword);
	moveForm.find("input[name='pageNum']").val(1);
	moveForm.submit();
});



</script>	
	
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>

	
</body>
</html>