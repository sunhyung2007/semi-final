<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- <link href="/resources/images/favicon.ico" rel="shortcut icon"
	type="image/x-icon"> -->
<!-- <link rel="stylesheet" href="/resources/css/menu.css">
<link rel="stylesheet" href="/resources/css/upload.css"> -->
<!DOCTYPE html>	
<html>

<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>칵테일 소개</title>

<!-- <script type="text/javascript">
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
</script> -->
</head>

<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<!-- 중요한게 form태그안에 enctype="multipart/form-data를 입력 해주어야한다. -->
		<div class="contents">
			<div class="main_contents">
			<h3>글쓰기</h3>
			
				<div class="write_contents">
					
					<form action="upload" method="post" enctype="multipart/form-data" style="margin-top: 20px;">
						<label for="formFile" class="form-label mt-4">이미지첨부</label>
						<input type="file" name="file" class="form-control" oninput="filename()">
						<input type="submit" class="btn btn-light" value="전송">
					</form>

					${ message }
					<br />
					
					<div class="form-group">			
						<label for="exampleTextarea" class="form-label mt-4">작성자</label>
						<input type="text" class="form-control" id="inputDefault" name="infoboardWriter" placeholder="작성자를 입력하세요">
					</div>	
					
					
					
					
					<c:set var="filename" value="${filename}" />
					
					
					<form name="writeform" action="/infoboard/write" method="post">
						<c:if test="${fn:length(filename) > 0}">
							<div class="input_wrap">
								<label class="col-form-label mt-4" for="inputDefault">칵테일 이름</label> 
								<input type="text" class="form-control" id="inputDefault" name="infoboardTitle" readonly value='<c:out value="${filename}"/>'>
							</div>
						</c:if>
						<div class="form-group">
							<label for="exampleTextarea" class="form-label mt-4">내용</label>
							<textarea name="infoboardContent" class="form-control" id="exampleTextarea"
								rows="12" placeholder="내용을 입력하세요" required></textarea>
						</div>
						<div class="form-group">					
							<label for="exampleTextarea" class="form-label mt-4">레시피</label>
							<textarea name="infoboardRecipe" class="form-control" id="exampleTextarea"
								rows="8" placeholder="칵테일 레시피를 입력하세요" required></textarea>							
						</div>
						<div class="btns_wrap">
						<button type="submit" class="btn btn-dark" id="list_btn"
                  onclick="location.href='write'">등록</button>
						<!-- <input class="btn" type="button" value="등록" onclick="write()" /> -->
						<button type="submit" class="btn btn-dark" id="list_btn" onclick="location.href='list'">취소</button>
						</div>
					</form>

			</div>
			
			
			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>

</body>
</html>