<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>칵키트 등록</h3>

            <div class="write_contents">
               <c:if test = "${fn:length(filename) == 0}" >
               <form action="upload" method="post" enctype="multipart/form-data">
               	<label for="formFile" class="form-label mt-4">칵키트 사진</label>
              	<div class="upload_wrap" style="display: flex; align-items: center;">
					<input type="file" name="file" class="form-control" oninput="filename()">
					<input type="submit" class="btn btn-light" value="전송">
				</div>
				<p>※사진 첨부 후 전송을 눌러주세요</p>
               </form>
            </c:if>
               ${message }
              
              
               <form name="writeform" action="/admin/write" method="post">
                  <c:if test="${fn:length(filename) > 0}">
                     <div class="input_wrap">
                        <label class="col-form-label mt-4" for="inputDefault">칵키트명</label> 
                        <input type="text" class="form-control" id="inputDefault" name="cName" readonly value='<c:out value="${filename}"></c:out>'>
                     </div>
                     <div class="input_wrap">
                        <label class="col-form-label mt-4" for="inputDefault">제목</label> 
                        <input type="text" class="form-control" id="inputDefault" placeholder="스토어에 등록할 제목을 입력하세요" name="cTitle" >
                     </div>
                     <div class="input_wrap">
                        <label class="col-form-label mt-4" for="inputDefault">가격</label> 
                        <input type="text" class="form-control" id="inputDefault" name="cPrice" placeholder="칵키트 가격을 입력해주세요">
                     </div>
                  </c:if>
                  <div class="form-group">
                     <label for="exampleTextarea" class="form-label mt-4">내용</label>
                     <textarea name="cContent" class="form-control" id="exampleTextarea" 
                        rows="10" placeholder="내용을 입력하세요" required></textarea>
                  </div>
                  <div class="form-group">               
                     <label for="exampleTextarea" class="form-label mt-4">레시피</label>
                     <textarea name="cRecipe" class="form-control" id="exampleTextarea"
                        rows="10" placeholder="레시피를 입력하세요" required></textarea>                     
                  </div>
                  <div class="form-group">         
                     <label for="exampleTextarea" class="form-label mt-4">구성품</label>
                     <input type="text" class="form-control" id="inputDefault" 
                     name="cIngredient" placeholder="구성품을 입력하세요">
                  </div> 
                  <div>
                  	<button type="submit" class="btn btn-dark" id="list_btn" onclick="window.location.href='write'">등록</button>
                  	<button type="submit" class="btn btn-dark" id="list_btn" onclick="location.href='cockitmanagement'" formaction="/admin/cockitmanagement">취소</button>
                  </div>
               </form>

            </div>
           
         </div>
      </div>
    </div>
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>


</body>
</html>
