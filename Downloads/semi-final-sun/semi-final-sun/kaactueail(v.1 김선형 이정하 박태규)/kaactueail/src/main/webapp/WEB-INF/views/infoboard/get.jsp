<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>Insert title here</title>
<!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
  <!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<!-- <link href="/resources/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/css/cockinfo.css"> -->
<link rel="stylesheet" href="/resources/css/menu.css">
<!-- <link rel="stylesheet" href="/resources/css/detailCockinfo.css"> -->
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<div class="form_section">
				<div style="width: 18rem; text-align: center; margin: auto;">
						<img
							src="${path}/resources/images/cocktailInfoImage/${pageInfo.infoboardTitle}.png"
							class="card-img-top" alt="NO IMAGE" width=350px, height=230px
							style="cursor: pointer;">
				</div>
                   			<div class="form_section_title">
                   				<label>칵테일 번호</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="infoboardNum" readonly="readonly" style="border: none" value="<c:out value='${pageInfo.infoboardNum }'></c:out>">                   				
                   			</div>
                   		</div>                    
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>작성자</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="infoboardWriter" readonly="readonly" style="border: none" value="<c:out value='${pageInfo.infoboardWriter }'></c:out>" >
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>칵테일명</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="infoboardTitle" readonly="readonly" style="border: none" ><c:out value='${pageInfo.infoboardTitle }'/></textarea>
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>칵테일 내용</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="infoboardContent" readonly="readonly" style="border: none"><c:out value='${pageInfo.infoboardContent }'/></textarea>
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>칵테일 레시피</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="infoboardRecipe" readonly="readonly" style="border: none"><c:out value='${pageInfo.infoboardRecipe }'/></textarea>
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>조회수</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="infoboardReadcount" readonly="readonly" style="border: none"><c:out value='${pageInfo.infoboardReadcount }'/></textarea>
                   			</div>
                   		</div>                   		                   		
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>등록 or 수정 날짜</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" type="text" readonly="readonly" style="border: none" value="<fmt:formatDate value="${pageInfo.infoboardDate}" pattern="yyyy-MM-dd"/>">
                   			</div>
                   		</div>
			
	<!-- 			<a href="update">수정하기</a>
				<a href="delete">삭제하기</a> -->
				<br/>
				<br/>
				<br/>
				<div class="btn_wrap">
	           		<button type="submit" class="btn btn-dark" id="list_btn" onclick="location.href='list'">칵테일 정보 목록</button>
					<button class="btn btn-dark" id="modifty_btn" onclick="location.href='modify?infoboardNum=${pageInfo.infoboardNum}'">수정</button>
	        	</div> 
	        		<form id="detailForm" action="/infoboard/modify" method="get">
						<input type="hidden" id="infoboardNum" name="infoboardNum" value="<c:out value= '${pageInfo.infoboardNum}'/>">
					</form>
			</div>
		</div>
<%-- 		<form id="infoForm" action="/infoboard/modify" method="get">
			<input type="hidden" id="infoboardNum" name="infoboardNum" value='<c:out value="${pageInfo.infoboardNum}"/>'> 
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'> 
			<input type="hidden" name="type" value="${cri.type }"> 
			<input type="hidden" name="keyword" value="${cri.keyword }">
		</form> --%>
	</div> <!-- wrapper div -->
	<script>
/* 		let form = $("#infoForm");
		
		$("#cancelBtn").on("click", fucntion(e){
			console.log("click")
			form.find("#infoboardNum").remove();
			form.attr("action", "/infoboard/list");
			form.submit();			
		}); */
/* 		$("#cancelBtn").on("click", function(e){
			console.log("cancelClick");
			location.href = "list";
		})
		$("#modifyBtn").on("click", function(e){
			console.log("modifyClick");
			location.href = "modify?infoboardNum=${pageInfo.infoboardNum}";
		})		 */
	</script>
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>