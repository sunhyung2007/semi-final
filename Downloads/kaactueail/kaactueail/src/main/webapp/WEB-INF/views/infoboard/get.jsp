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
<link rel="stylesheet" href="/resources/css/detailLayout_freeb.css"/>
<title>칵테일 정보</title>
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>칵테일 정보</h3>
				
				
				
				<div class="btn_wrap">
	           		<button type="submit" class="btn btn-dark" id="list_btn" onclick="location.href='list'">목록</button>
	           	<c:if test="${ mRole eq 'ROLE_ADMIN' }">
					<button class="btn btn-dark" id="modifty_btn" onclick="location.href='modify?infoboardNum=${pageInfo.infoboardNum}'">수정</button>
				</c:if>
	        		<form id="detailForm" action="/infoboard/modify" method="get">
						<input type="hidden" id="infoboardNum" name="infoboardNum" value="<c:out value= '${pageInfo.infoboardNum}'/>">
					</form>
				</div>
				
				
				
				
				
				<div class="layout_all">
					<div class="layout_title">
						<div>
							<input name="infoboardNum" readonly value="<c:out value='${pageInfo.infoboardNum }'/>">
						</div>
						<div>
							<input style="border: 0 solid balck;" name="infoboardTitle" readonly value="<c:out value='${pageInfo.infoboardTitle }'/>">
						</div>
					</div>
					<hr/>
				
				
				<div class="layout_middle">
					<div>
						<input class="input_block" type="text" readonly style="border: none" value="<fmt:formatDate value="${pageInfo.infoboardDate}" pattern="yyyy-MM-dd"/>">
					</div>
					<div>
						<input class="input_block" name="infoboardReadcount" readonly style="border: none" value="<c:out value='${pageInfo.infoboardReadcount }'/>">
					</div>
				</div>
				
				<div class="layout_content">
					<div style="width: 18rem; text-align: center; margin: auto;">
						<img src="${path}/resources/images/infoboard/${pageInfo.infoboardTitle}.png" class="card-img-top" alt="NO IMAGE" width=350px, height=230px style="cursor: pointer;">
					</div>
					<div class="form_section_content">
                   		<textarea name="freeboardContent" class="form-control" id="exampleTextarea" rows="15" readonly style="border: none; "><c:out value="${pageInfo.infoboardContent}" /></textarea>
                   	</div>
                   	<div>
                   		<label>칵테일 레시피</label>
                   	</div>
                   	<div>
                   		<textarea name="freeboardContent" class="form-control" id="exampleTextarea" rows="8" readonly style="border: none; "><c:out value='${pageInfo.infoboardRecipe }'/></textarea>
                   	</div>
				</div>
			</div>
			
			
			</div>
		</div>
	</div>
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>