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
			
			
			<div style="justify-content: space-around; flex-wrap: wrap; display: flex; margin-top: 30px;">
			
				<c:forEach var="cocklist" items="${list}">
					<div class="card" style="width: 18rem">
						<a class="move" href='/infoboard/get?infoboardNum=<c:out value="${cocklist.infoboardNum }"/>'>
							<img src="${path}/resources/images/cocktailInfoImage/${cocklist.infoboardTitle}.png"
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

			

<%-- 				<form id="menuForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
					<input type="hidden" name="type" value="${pageMaker.cri.type }">	
				</form> --%>
				
		
			<!-- main_contents -->
			
				<!-- <div class="pageInfo_wrap" style="display:flex; justify-content: space-around;"> -->
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
				</div>				
				<a href="write">칵테일정보등록하기</a>
				
				
			</div> 
		</div> <!-- contents -->
	</div>  <!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
	
	
	<script>
/* 		$(document).ready(function (){
			let result = '<c:out value="${result}"/>';
			checkAlert(result);
			console.log(result);
			
			function checkAlert(result){
				if(result === ''){
					return;
				}
				if(result === "write success"){
					alert("등록이 완료되었습니다.");
				}
		 		if(result === "modify success"){
					alert("수정이 완료되었습니다.");
				}
				
				if(result === "delete success"){
					alert("삭제가 완료되었습니다.");
				} 
					
			}
		})
		let menuForm = $("#menuForm");
		 $(".move").on("click", function(e){
		 e.preventDefault();
		 console.log("클릭성공");
		 //location.href = "detailList?id=${cocklist.infoboard_num}";
		 menuForm.append("<input type='hidden' name='infoboardNum' value='"+ $(this).attr("href") + "'>");
		 menuForm.attr("action", "/infoboard/get");
		 menuForm.submit(); 
		 }); 
		 $(".pageInfo a").on("click", function(e) {
		 e.preventDefault();
		 menuForm.find("input[name='pageNum']").val($(this).attr("href"));
		 menuForm.attr("action", "/infoboard/list");
		 menuForm.submit();
		 }); 
		 

	 	$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});  */
	</script>
</body>
</html>