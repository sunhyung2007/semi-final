<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="/resources/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/upload.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<script>
   function write() {
      alert("등록합니다!");

      if (document.writeform.infoboardTitle.value == "") {
         alert("제목을 입력해주세요");
      } else if (document.writeform.infoboardContent.value == "") {
         alert("내용을 입력해주세요");
         document.writeform.infoboardContent.focus();
      } else if (document.writeform.infoboardRecipe.value == "") {
         alert("레시피을 입력해주세요");
         document.writeform.infoboardRecipe.focus();
      }else if (document.writeform.infoboardWriter.value == "") {
         alert("작성자를 입력해주세요");
      } else {
         document.writeform.submit(); //전송
      }
   }
  
</script>
	<h1>여기는 칵테일정보 작성 페이지</h1>
	<div class="wrapper">

		<div class="header">
			<div class="navbar_logo">
				<a href="#"><img class="logo" src="/resources/images/LOGO.png" /></a>
			</div>
			<div class="navbar_left">
				<ul class="left">
					<li><a class="menu_left" href="/infoboard/list">칵테일 소개</a></li>
					<li><a class="menu_left" href="/mycocktailboard/list">나만의
							칵테일</a></li>
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
		<!-- 중요한게 form태그안에 enctype="multipart/form-data를 입력 해주어야한다. -->
		<div class="contents">
         <div class="main_contents">
            <div class="write_contents"
               style="text-align: center; margin: auto;">
               <form action="upload" method="post" enctype="multipart/form-data"
                  style="margin-top: 20px;">
                  파일 선택: <input type="file" name="file" oninput="filename()">
                  <input type="submit" value="전송">
               </form>

               ${message }
               <!--<form method="post" action="/upload" enctype="multipart/form-data">
               <input type="file" name="uploadfile" multiple="multiple" /> <input
                  type="submit" value="결과 확인" />
            </form> -->

               <br />
               <c:set var="filename" value="${filename}" />
               <form name="writeform" action="/admin/write" method="post">
                  <c:if test="${fn:length(filename) > 0}">
                     <div class="input_wrap">
                        <label class="col-form-label mt-4" for="inputDefault">이름</label> 
                        <input type="text" class="form-control"
                     id="inputDefault" name="cName" readonly value='<c:out value="${filename}"></c:out>'>
                     </div>
                     <div class="input_wrap">
                        <label class="col-form-label mt-4" for="inputDefault">제목</label> 
                        <input type="text" class="form-control" 
                     id="inputDefault" name="cTitle" >
                     </div>
                     <div class="input_wrap">
                        <label class="col-form-label mt-4" for="inputDefault">가격</label> 
                        <input type="text" class="form-control"  id="inputDefault" name="cPrice">
                     </div>
                     
                  </c:if>
                  <div class="form-group">
                     <label for="exampleTextarea" class="form-label mt-4">내용</label>
                     <textarea name="cContent" class="form-control" id="exampleTextarea"
                        rows="15" placeholder="내용을 입력하세요" required></textarea>
                  </div>
                  <div class="form-group">               
                     <label for="exampleTextarea" class="form-label mt-4">레시피</label>
                     <textarea name="cRecipe" class="form-control" id="exampleTextarea"
                        rows="15" placeholder="내용을 입력하세요" required></textarea>                     
                  </div>
                  <div class="form-group">         
                     <label for="exampleTextarea" class="form-label mt-4">구성품</label>
                     <input type="text" class="form-control" id="inputDefault" 
                     name="cIngredient" placeholder="작성자를 입력하세요">
                  </div>                  
                  <input class="btn" type="button" value="등록" onclick="write()" />

               </form>
               <button type="submit" class="btn btn-dark" id="list_btn"
                  onclick="location.href='cockit'">취소</button>
			
            </div>
           
         </div>
      </div>

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
</body>
</html>
