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
<!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

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
							<td><a class="move_detail"
								href='/freeboard/detail?freeboardNum=<c:out value="${list.freeboardNum}"/>'><c:out value="${list.freeboardTitle}" /></a></td>
							<td><c:out value="${list.freeboardWriter}" /></td>
							<td><fmt:formatDate value="${list.freeboardDate}"
									pattern="yyyy.MM.dd" /></td>
							<td><c:out value="${list.freeboardReadcount}" /></td>
						</tr>
					</c:forEach>
				</table>


				<div class="numbers_wrap" style="display:flex; justify-content: space-around;">
					<div>
						<ul class="pagination">
							<c:if test="${ paging.prev }">
								<li class="page-item"><a class="page-link"
									href="/freeboard/list?pageNum=${ paging.startPage-1 }&amount=${ paging.cri.amount}">&laquo;</a></li>
							</c:if>
							<c:forEach var="num" begin="${ paging.startPage }"
								end="${ paging.endPage }">
								<li class="page-item ${ paging.cri.pageNum == num ? "active":"" }">
									<a class="page-link"
									href="/freeboard/list?pageNum=${ num }&amount=${ paging.cri.amount}">${ num }</a>
								</li>
							</c:forEach>
							<c:if test="${ paging.next }">
								<li class="page-item"><a class="page-link"
									href="/freeboard/list?pageNum=${ paging.endPage+1 }&amount=${ paging.cri.amount}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="btns_wrap"
					style="display: flex; justify-content: flex-end; align-items: center;">
					<div class="dropbox"
						style="display: flex; align-items: center; padding-right: 1%">
							<form class="d-flex" action="list?pageNum=${ paging.endPage+1 }&amount=${ paging.cri.amount}">
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
							</form>

					</div>
					<div class="btn_wrap" style="float: right;">
						<button type="button" class="btn btn-dark" id="write_btn"
							onclick="location.href='write'" formmethod="get">글쓰기</button>
						<!-- <button type="button" class="btn btn-dark" id="delete_btn">삭제</button> -->
					</div>

				</div>
				
				
<!--
				<form id="moveForm" method="get">
					<input type="hidden" name="PageNum" value="${ paging.cri.pageNum }">
					<input type="hidden" name="amount" value="${ paging.cri.amount }">
					<input type="hidden" name="keyword" value="${ paging.cri.keyword }">
					<input type="hidden" name="type" value="${ paging.cri.type }">
				</form>

 <script type="text/javascript">
	let moveForm = $("#moveForm");

		$(".move").on("click",function(e) {
			e.preventDefault();
							
			moveForm.append("<intput type='hidden' name='freeboardNum' value=''"+ $(this).attr("href")+ "'>'");
			moveForm.attr("action", "freeboard/detail")
			moveForm.submit();
		});
					
		$(".pagination a").on("click", function(e)){
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/freeboard/list");
			moveForm.submit();
		});
		
		$("#search_btn").on("click", function(e){
			e.preventDefault();
			
			let type = $("#search_btn select").val();
			let keyword = $("#search_btn input[name='keyword']").val();
			
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
					
</script> -->



			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
		<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>