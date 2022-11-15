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
<link rel="stylesheet" href="/resources/css/detailLayout_freeb.css"/>
<title>나만의 칵테일</title>
</head>
<body>
	<script>

	 	$.ajax({

			success : function() {
				if(${member} == 0){
					$("#nonlike").css("color", "red");
					$("#nonlike").show();
					$("#olike").hide();
					$("#unlike").hide();
				}
				else if (${like} == 1) {
					$("#olike").css("color", "red");
					$("#olike").show();
					$("#unlike").hide();
					$("#nonlike").hide();
				} else {
					console.log(${like});
					$("#unlike").css("color", "red");
					$("#unlike").show();
					$("#olike").hide();
					$("#nonlike").hide();
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
					likeboardMemberNum : ${member}
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
					likeboardMemberNum : ${member}
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
				<h3>나만의 칵테일</h3>
				<div class="btn_wrap" style="display: flex; float: right;">
					<button class="btn btn-dark" id="list_btn" onclick="location.href='list'" style="display: flex; justify-content: flex-end;">목록</button>
						
					<!-- 회원가입되어 있으면 -->
					<c:if test="${ mRole != null }">
						<button type="submit" class="btn btn-dark" id="write_btn"
							onclick="location.href='write'">글쓰기</button>
							
						<!-- 로그인한 세션의 사용자번호와 게시글 작성자의 번호가 일치하면 삭제, 수정버튼이 보임 -->
						<c:if test="${ mNum eq pageDetail.mycocktailMemberNum }">
							<button class="btn btn-dark" id="modifty_btn"
								onclick="location.href='modify?mycocktailNum=${pageDetail.mycocktailNum}'">수정</button>
							<form action="/mycocktailboard/delete" method="post">
								<button type="submit" class="btn btn-dark" id="delete_btn"
									onclick="loaction.href='delete'">삭제</button>
								<input type="hidden" id="mycocktailNum" name="mycocktailNum"
									value="<c:out value= '${pageDetail.mycocktailNum}'/>">
							</form>
						</c:if>

					</c:if>
				</div>
				
				<form id="detailForm" action="/mycocktailboard/modify" method="get">
					<input type="hidden" id="mycocktailNum" name="mycocktailNum"
						value="<c:out value= '${pageDetail.mycocktailNum}'/>">
				</form>
				<div class="layout_all">
					<div class="layout_title">
						<div>
							<input name="mycocktailNum" readonly value='<c:out value="${pageDetail.mycocktailNum}"/>'>
						</div>
						<div>
							<input style="border: 0 solid balck;" name="mycocktailTitle" readonly value='<c:out value="${pageDetail.mycocktailTitle}"/>'>
						</div>
					</div>
					<hr/>
					
					<div class="layout_middle">
						<div>
							<input style="border: 0 solid balck;" name="mycocktail_writer"	readonly value='<c:out value="${pageDetail.mycocktailWriter}"/>'>
						</div>
						<div>
							<input name="mycocktailDate" value='<fmt:formatDate pattern="yyyy.MM.dd" value="${pageDetail.mycocktailDate}"/>'
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
								src="/resources/images/mycocktailImagefolder/${pageDetail.mycocktailImgName}"
								width=600px, height=450px; /> <span
								style="display: flex; width: 600px; justify-content: flex-end; margin-top: 5px;">
								<c:out value=" 좋아요 " />&nbsp; <a class="fa fa-heart"
								aria-hidden="true" id="nonlike"
								style="margin-top: 3px; text-decoration: none;"></a> <a
								class="fa fa-heart" aria-hidden="true" id="olike"
								style="margin-top: 3px; text-decoration: none;"
								onclick="makeunlike()"></a> <a class="fa fa-heart-o"
								aria-hidden="true" id="unlike"
								style="margin-top: 3px; text-decoration: none;"
								onclick="makeolike()"></a> &nbsp;
								<div class="likenum" id="aaa"></div>

							</span>
						</div>

						<div style="margin-bottom: 5%;">
							<input name="mycocktailContent" readonly value='<c:out value="${pageDetail.mycocktailContent}"/>'>
						</div>
						<div style="margin-bottom: 5%;">
							<h5>칵테일 레시피</h5>
							<textarea class="form-control" style="width: 100%; height: 100%; border: none;" readonly><c:out value="${pageDetail.mycocktailRecipe}" /></textarea>
						</div>

					</div>
				</div>


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