<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>상품 목록 페이지</title>
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
			<div class="main_contents" style="justify-content: space-between;">
			<div style="justify-content: space-around; flex-wrap: wrap; display: flex; margin-top: 30px;">
				<c:forEach var="cocklist" items="${list}">
					<div class="card" style="width: 18rem">
						<a class="move" href='/store/get?cNum=<c:out value="${cocklist.cNum}"/>'>
							<img src="${path}/resources/images/cockitImage/${cocklist.cName}.png"
							class="card-img-top" alt="NO IMAGE" width=350px, height=230px
							style="cursor: pointer;">
							<div class="card-body">
								<h5 class="card-title">
									<c:out value="${cocklist.cTitle }"></c:out>
								</h5>							
								<p class="card-text">	
									<c:out value="${cocklist.cContent}"></c:out>
								</p>
							</div>
						</a>						
					</div>
				</c:forEach>
				</div>
			</div>
			<div class="numbers_wrap" style="display:flex; justify-content: space-around;">
				<ul id="pageInfo" class="pagination">
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a
							href="/store/list?pageNum=${pageMaker.startPage-1}&amount=${ pageMaker.cri.amount}">Previous</a></li>
					</c:if>

					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
							<a class="page-link" href="/store/list?pageNum=${num}&amount=${pageMaker.cri.amount}">${num}</a>
						</li>
					</c:forEach>

					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="page-item next">
							<a class="page-link" href="/store/list?pageNum=${pageMaker.endPage + 1 }&amount=${ pageMaker.cri.amount}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="btns_wrap"
					style="display: flex; justify-content: flex-end; align-items: center;">
					<div class="dropbox"
						style="display: flex; align-items: center; padding-right: 1%">
							<form class="d-flex" action="list?pageNum=${ paging.endPage+1 }&amount=${ paging.cri.amount}">
								<select name="type">
									<option value="" <c:out value="${ paging.cri.type == null ? 'selected' : ''}"/> >선택</option>
									<option value="T" <c:out value="${ paging.cri.type eq 'T'? 'selected' : ''}"/>>상품</option>
									<option value="C" <c:out value="${ paging.cri.type eq 'C' ? 'selected' : ''}"/>>설명</option>									
									<option value="TC" <c:out value="${ paging.cri.type eq 'TC' ? 'selected' : ''}"/>>상품+설명</option>
								</select>
								
								<input class="form-control me-sm-2" type="text" placeholder="Search" name="keyword">
								<button id="search_btn" class="btn btn-secondary my-2 my-sm-0" type="submit" href="keyword=${ paging.cri.keyword }&type=${ paging.cri.type }">Search</button>
							</form>							
					</div>
				</div>
								
		</div> <!-- contents -->
	</div>  <!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>									
</body>
</html>