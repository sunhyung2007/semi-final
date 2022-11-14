<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>	
<html>

<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>칵테일 소개</title>

 <script type="text/javascript">
	function write() {
		alert("등록합니다!");
		document.writeform.submit(); //전송
	}
</script>
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
					<c:set var="filename" value="${filename}" />
					
			
					 	<!-- <button type="submit" class="btn btn-dark" id="list_btn" onclick="javascript.href='write'" formaction="/infoboard/write" formmethod="post" name="writeform">등록</button> -->
					 	<!-- <button type="submit" class="btn btn-dark" id="list_btn" onclick="write()" formaction="/infoboard/write" formmethod="post" name="writeform">등록</button> -->
						<!-- <button type="submit" class="btn btn-dark" id="list_btn" onclick="write()">등록</button> -->
						<!-- <input class="btn" type="button" value="등록" onclick="write()" /> -->
						
					
					
					
					<form action="upload" method="post" enctype="multipart/form-data">
						<label for="formFile" class="form-label mt-4">칵테일 사진</label>
						<div class="upload_wrap" style="display: flex; align-items: center;">
							<input type="file" name="file" class="form-control" oninput="filename()">
							<input type="submit" class="btn btn-light" value="전송">
						</div>
						<p>※사진 첨부 후 전송을 눌러주세요</p>
					</form>

					${ message }
					
					<form name="writeform" action="/infoboard/write" method="post">
						<c:if test="${fn:length(filename) > 0}">
								<label class="col-form-label mt-4" for="inputDefault">칵테일 이름</label> 
								<input type="text" class="form-control" id="inputDefault" name="infoboardTitle" readonly value='<c:out value="${filename}"/>'>
						</c:if>
						<div class="form-group">
							<label for="exampleTextarea" class="form-label mt-4">내용</label>
							<textarea name="infoboardContent" class="form-control" id="exampleTextarea"
								rows="12" placeholder="내용을 입력하세요" required></textarea>
						</div>
						<div class="form-group">					
							<label for="exampleTextarea" class="form-label mt-4">레시피</label>
							<textarea name="infoboardRecipe" class="form-control" id="exampleTextarea"
								rows="5" placeholder="칵테일 레시피를 입력하세요" required></textarea>							
						</div>
						<div class="btns_wrap" style="float: right;">
							<button type="submit" class="btn btn-dark" id="list_btn" onclick="location.href='write'">등록</button>
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