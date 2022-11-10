<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp" %>
<title>고객센터</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">

</head>
<body>
<!-- header삽입 -->
<%@ include file="../layout/header.jsp"%>



	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">



				<h1>글쓰기</h1>
				<form action="/question/write" method="post">
					<div class="btn_wrap" style="float: right;">
						<button type="submit" class="btn btn-dark" id="write_btn">글쓰기</button>
						<button type="submit" class="btn btn-dark" id="list_btn" onclick="location.href='list'" formaction="/question/list" formmethod="get">목록</button>
					</div>
					<div class="form-group">
						<label class="col-form-label mt-4" for="inputDefault">제목</label>
						<input type="text" class="form-control" placeholder="제목을 입력하세요"
							id="inputDefault" name="questionTitle" required>
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" id="inputDefault" name="questionWriter">
					</div>
					<div class="form-group">
						<label for="exampleTextarea" class="form-label mt-4">내용</label>
						<textarea name="questionContent" class="form-control" id="exampleTextarea"
							rows="15" placeholder="내용을 입력하세요" required></textarea>
					</div>
					<div class="form-group">
						<label for="formFile" class="form-label mt-4">이미지 첨부</label>
						<input class="form-control" type="file" id="formFile">
					</div>
				</form>

			</div>
		</div>
	</div>



	<!-- footer삽입 -->
<%@ include file="../layout/footer.jsp"%>	

</body>
</html>