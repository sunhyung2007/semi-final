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
<title>나만의 칵테일 게시판</title>
<!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/detailLayout.css">
<script src="https://kit.fontawesome.com/d99a4f7016.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Ramaraja&family=Roboto+Condensed:wght@700&display=swap"
	rel="stylesheet">
</head>

<body>
	<script>
		
	 	$.ajax({
			success : function() {
				 if (${like} == 1) {
					$("#olike").css("color", "red");
					$("#olike").show();
					$("#unlike").hide();
				} else {
					console.log(${like});
					$("#unlike").css("color", "red");
					$("#unlike").show();
					$("#olike").hide();
				}
				$("#aaa").text(${pageDetail.mycocktailLikeNum});
			}
		});	
		  
		function makeolike() {
	 		
			$.ajax({
				url : "makeolike",
				type:'post',
				data : {
					likeboardNum : 0,
					likeboardMyCocktailNum : ${pageDetail.mycocktailNum},
					likeboardMemberNum : ${mNum}
				},
				success : function(){
					
					$("#unlike").hide();
					$("#olike").css("display", "block");
					$("#olike").css("color", "red");
					if(${like} == 1){
						$("#aaa").text(${pageDetail.mycocktailLikeNum});
					}
					else{

						$("#aaa").text(${pageDetail.mycocktailLikeNum+1});
					}
				}
			});
		}   
		
		 function makeunlike() {
			$.ajax({
				
				url : "makeunlike",
				type:'post',
				data : {
					likeboardNum : 0,
					likeboardMyCocktailNum : ${pageDetail.mycocktailNum},
					likeboardMemberNum : ${mNum}
				},
				success : function(){
					$("#olike").hide();
					$("#unlike").css("display", "block");
					$("#unlike").css("color", "red");
					if(${like} == 1){
						$("#aaa").text(${pageDetail.mycocktailLikeNum}-1);
					}
					else{
						$("#aaa").text(${pageDetail.mycocktailLikeNum});
					}
				}
			});
		}   
	</script>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>


	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>나만의 칵테일 게시판</h3>
				<div class="btn_wrap">
					<button type="submit" class="btn btn-dark" id="write_btn"
						onclick="location.href='write'">글쓰기</button>
					<button type="submit" class="btn btn-dark" id="list_btn"
						onclick="location.href='list'">목록</button>
					<button class="btn btn-dark" id="modifty_btn"
						onclick="location.href='modify?mycocktailboardNum=${pageDetail.mycocktailNum}'">수정</button>
					<button type="submit" class="btn btn-dark" id="delete_btn"
						onclick="loaction.href='delete'"
						formaction="/mycocktailboard/delete" formmethod="post">삭제</button>
				</div>
				<form id="detailForm" action="/mycocktailboard/modify" method="get">
					<input type="hidden" id="mycocktailNum" name="mycocktailNum"
						value="<c:out value= '${pageDetail.mycocktailNum}'/>">
				</form>
				<div class="layout_all">
					<div class="layout_title">
						<div>
							<input name="mycocktailNum" readonly
								value='<c:out value="${pageDetail.mycocktailNum}"/>'>
						</div>
						<div>
							<input style="border: 0 solid balck;" name="mycocktailTitle"
								readonly value='<c:out value="${pageDetail.mycocktailTitle}"/>'>
						</div>
					</div>
					<div class="layout_middle">
						<div>
							<input style="border: 0 solid balck;" name="mycocktail_writer"
								readonly value='<c:out value="${pageDetail.mycocktailWriter}"/>'>
						</div>
						<div>
							<input name="mycocktailDate"
								value='<fmt:formatDate pattern="yyyy.MM.dd" value="${pageDetail.mycocktailDate}"/>'
								readonly>
						</div>
						<div>
							<input name="mycocktailReadcount" readonly
								value='<c:out value="${pageDetail.mycocktailReadcount}"/>'>
						</div>
					</div>
					<div class="layout_content" style="position: relative;">
						<div class="img_id">
							<img
								src="/resources/images/mycocktailImagefolder/${pageDetail.mycocktailImgName}.jpg"
								width=600px, height=450px; /> <span
								style="display: flex; width: 600px; justify-content: flex-end; margin-top: 5px;">
								<c:out value=" 좋아요 " />&nbsp; 
								<a class="fa fa-heart" aria-hidden="true" id="olike" style="margin-top: 3px; text-decoration: none;" onclick="makeunlike()"></a>
								<a class="fa fa-heart-o" aria-hidden="true" id="unlike" style="margin-top: 3px;text-decoration: none;" onclick="makeolike()"></a>
								&nbsp;
								<div class="likenum" id="aaa"></div>
								
								 
							</span>
						</div>

						<div style="margin-bottom: 5%;">
							<input name="mycocktailContent" readonly
								value='<c:out value="${pageDetail.mycocktailContent}"/>'>
						</div>
						<div style="margin-bottom: 5%;">
							<h5>레시피</h5>
							<%-- <input name="mycocktailRecipe" readonly
									value='<c:out value="${pageDetail.mycocktailRecipe}"/>'> --%>
							<textarea style="width: 100%; height: 100%;"><c:out
									value="${pageDetail.mycocktailRecipe}" /></textarea>
						</div>

					</div>
				</div>


			</div>
			<!-- main contents end -->
		</div>
		<!-- contents end -->
	</div>
	<!-- wrapper end -->

	<!-- 목록/수정버튼 클릭 시 이동하는 로직 -->
	<!-- <script>
	let form = ${"#detailForm"};
	
	$("#list_btn").on("click", function(e){
		form.find("#mycocktailNum").remove();
		form.attr("action", "/mycocktailboard/mycocktailboardlist");
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modify");
	});
</script> -->

	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>