<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="/resources/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/css/cockinfo.css">
<link rel="stylesheet" href="/resources/css/menu.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">

		<div class="header">   
			<div class="navbar_logo">
				<a href="#"><img class="logo" src="/resources/images/LOGO.png" /></a>
			</div>
			<div class="navbar_left">
				<ul class="left">
					<li><a class="menu_left" href="/infoboard/list">칵테일 소개</a></li>
					<li><a class="menu_left" href="/mycocktailboard/list">나만의 칵테일</a></li>
					<li><a class="menu_left" href="/freeboard/list">자유게시판</a></li>
					<li><a class="menu_left" href="#">스토어</a></li>
				</ul>
			</div>

			<div class="search-box">
				<form action="." method="post">
					<input class="search-txt" type="text" placeholder="검색어를 입력해 주세요" />
					<button class="search-btn" type="submit">찾기</button>
				</form>
			</div>
			
			<div>
				<ul class="right">
					<li><a href="#">카트</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="/login/list">로그인</a></li>
					<li><a href="/join/list">회원가입</a></li>
				</ul>
			</div>
		</div>

		<div class="main_bar">
			<img class="img_bar" src="/resources/images/Bar_main.jpg" />
		</div>

		<div class="contents">
			<div class="main_contents">
				<div class="form_section">
				<img
							src="${path}/resources/images/${pageInfo.infoboardTitle}.png"
							class="card-img-top" alt="NO IMAGE" width="100px" height="100px" style="cursor:pointer;">
                   			<div class="form_section_title">
                   				<label>칵테일 번호</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="infoboardNum" readonly="readonly" value="<c:out value='${pageInfo.infoboardNum }'></c:out>">                   				
                   			</div>
                   		</div>                    
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>작성자</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="infoboardWriter" readonly="readonly" value="<c:out value='${pageInfo.infoboardWriter }'></c:out>" >
                   			</div>
                   		</div>
<%--                    		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>소속국가</label>
                   			</div>
                   			<div class="form_section_content">
                   				<select class="input_block" name="nationId" >
                   					<option value="none" selected disabled="disabled">=== 선택 ===</option>
                   					<option value="01" disabled="disabled" <c:out value=" ${authorInfo.nationId eq '01' ?'selected':''}"/>>국내</option>
                   					<option value="02" disabled="disabled" <c:out value=" ${authorInfo.nationId eq '02' ?'selected':''}"/>>국외</option>
                   				</select>
                   			</div>
                   		</div> --%>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>칵테일명</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="infoboardTitle" readonly="readonly"><c:out value='${pageInfo.infoboardTitle }'/></textarea>
                   			</div>
                   		</div>
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>등록 날짜</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${pageInfo.infoboardDate}" pattern="yyyy-MM-dd"/>">
                   			</div>
                   		</div>
                   		<%-- <div class="form_section">
                   			<div class="form_section_title">
                   				<label>수정 날짜</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${authorInfo.updateDate}" pattern="yyyy-MM-dd"/>">
                   			</div>
                   		</div> --%>
			

	<!-- 			<a href="update">수정하기</a>
				<a href="delete">삭제하기</a> -->
				<br/>
				<br/>
				<br/>
				<div class="btn_section">
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
		<div class="footer">
			<div class="foo_enterprise">
				<ul>
					<li>사업자번호: 123-45-67890</li>
					<li>대표자명: 홍길동</li>
					<li>주소: 서울특별시 종로구 창경궁로 254 7층</li>
				</ul>
			</div>
			<div class="foo_help">
				<a href="#">고객센터</a>
			</div>

		</div>
	</div>
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
</body>
</html>