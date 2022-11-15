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
<title>칵테일 소개</title>
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents" style="justify-content: space-between;">
			<h3>칵테일 소개</h3>
			
			
			<!-- 회원가입 한 경우에만 글 작성 가능 -->
			<c:if test="${ mRole eq 'ROLE_ADMIN' }">
				<div class="btn_wrap" style="float: right;">
					<button type="button" class="btn btn-dark" id="write_btn" onclick="location.href='write'" formmethod="get">글쓰기</button>
				</div>
			</c:if>
			
			
			<div style="justify-content: space-around; flex-wrap: wrap; display: flex; margin-top: 30px;">
			
				<c:forEach var="cocklist" items="${list}">
					<div class="card" style="width: 18rem">
						<a class="move" href='/infoboard/get?infoboardNum=<c:out value="${cocklist.infoboardNum }"/>'>
							<img src="${path}/resources/images/infoboard/${cocklist.infoboardTitle}.png"
							class="card-img-top" alt="NO IMAGE" width=350px, height=230px
							style="cursor: pointer;">
							<div class="card-body">
								<h5 class="card-title">
									<c:out value="${cocklist.infoboardTitle }"></c:out>
								</h5>
								<p class="card-text">
									<c:out value="${cocklist.infoboardContent }"></c:out>
								</p>
							</div>
						</a>
						<fmt:formatDate pattern="yyyy/MM/dd" value="${cocklist.infoboardDate }" />
					</div>
				</c:forEach>
				</div>

			
		
			<!-- main_contents -->
			
					<div class="pageInfo_area">
						<ul id="pageInfo" class="pageInfo" style="list-style:none;">
							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous">
								<a href="/infoboard/list?pageNum=${pageMaker.startPage-1}&amount=${ pageMaker.cri.amount}">Previous</a></li>
							</c:if>

							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
								<a href="/infoboard/list?pageNum=${num}&amount=${pageMaker.cri.amount}">${num}</a>
								</li>
							</c:forEach>

							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next">
								<a href="/infoboard/list?pageNum=${pageMaker.endPage + 1 }&amount=${ pageMaker.cri.amount}">Next</a></li>
							</c:if>
						</ul>
					</div>
				<!-- </div> -->
				<div class="btns_wrap"
					style="display: flex; justify-content: flex-end; align-items: center;">
					<div class="dropbox"
						style="display: flex; align-items: center; padding-right: 1%">
						
							<form class="d-flex" action="list?pageNum=${ pageMaker.endPage+1 }&amount=${ pageMaker.cri.amount}">
								<select name="type">
									<option value="" <c:out value="${ pageMaker.cri.type == null ? 'selected' : ''}"/> >선택</option>
									<option value="T" <c:out value="${ pageMaker.cri.type eq 'T'? 'selected' : ''}"/>>제목</option>
									<option value="C" <c:out value="${ pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
									<option value="W" <c:out value="${ pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
									<option value="TC" <c:out value="${ pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목+내용</option>
									<option value="TW" <c:out value="${ pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목+작성자</option>
									<option value="TCW" <c:out value="${ pageMaker.cri.type eq 'TCW' ? 'selected' : ''}"/>>제목+내용+작성자</option>
								</select>

								<input class="form-control me-sm-2" type="text" placeholder="Search" name="keyword">
								<button id="search_btn" class="btn btn-secondary my-2 my-sm-0" type="submit" href="keyword=${ paging.cri.keyword }&type=${ paging.cri.type }">Search</button>
							</form>
					</div>
				</div>				

				
				
				
			</div> 
		</div> <!-- contents -->
	</div>  <!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
	
	
	<script>
	
	
	
	</script>
</body>
</html>