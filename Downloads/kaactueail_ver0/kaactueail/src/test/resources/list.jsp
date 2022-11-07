<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>여기는 칵테일소개 페이지</h1>
		<c:forEach var="list" items="${list}">
<%-- 			<tr>
				<td>${list.seq}</td>
				<td>${list.title}</td>
				<td>${list.writer}</td>
				<td><a href="javascript:location.href='board?cmd=detail&seq=${list.seq}' ">${list.readcount}</a></td>
				<td>${list.regdate}</td>
				<td>${list.readcount}</td>	
				<td><a href="javascript:location.href='board?cmd=detail&seq=${list.seq}' ">상세보기</a></td>
				<td><a href="javascript:location.href='board?cmd=delete&seq=${list.seq}' ">삭제하기</a></td>			
			</tr> --%>
			
			<div class="card" style="width: 18rem">
				<%-- <img src = "images/${list.C_img_name} class="card-img-top" alt="NO IMAGE"> --%>
				<div class="card-body">
				<h5 class="card-title">${list.InfoBoard_title }</h5>		
				<p class="card-text">${list.InfoBoard_content }</p>			
				</div>
			</div>
		</c:forEach>		
	<a href="views/infoboard/writeForm.jsp">글쓰기</a>
</body>
</html>