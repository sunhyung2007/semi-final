<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- 추가 -->
	<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<h1>재고관리</h1>
	<form action = "cockit" name = "search" id = "search">
	<input type = "text" id = "cName" name = "cName" >
	<input type = "submit" value = "검색" placeholder = "이름을 입력하세요" id = "searchsubmit">
	</form>
	<br/>
	<input type = "button" value = "상품 추가" onclick = "window.location.href='write'">
	<table border="1" style = "width : 750px">
	<tr>
		<th>상품 번호</th>
		<th>상품명</th>
		<th>수량</th>
		<th>가격</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	
	<c:forEach items = "${cockit}" var = "product">
		<tr>
			<td><input type = "text" value = "${product.cNum }"></td><td><input type = "text" value = "${product.cName }" ></td>
			
			<c:if test = "${product.cAmount  lt 1}" >
				<td><input type = "text" value = "품절" style ="background-color:red; color:white; font-weight:bold;"></td>
			</c:if>
			
			<c:if test = "${product.cAmount  lt 30 && product.cAmount ne 0}" >
				<td><input type = "text" value = "${product.cAmount }" style ="background-color:tomato; color:white;"></td>
			</c:if>
			
			<c:if test = "${product.cAmount ge 30 }" >
				<td><input type = "text" value = "${product.cAmount }"></td>
			</c:if>
			<td><input type = "text" value = "${product.cPrice }"></td>
			<td><input type = "button" value = "수정" class ="productupdate"></td>
			<td><input type = "button" value = "삭제" class = "productdelete"></td>
		</tr>
	</c:forEach>
	</table>
	
	
	<script>
	$(".productdelete").on("click", function () {
		//현재 row
		var thisRow = $(this).closest('tr');
		//현재 행에서 td의 첫번째에 들어있는 input태그를 가지고있는 값
		var cNum = thisRow.find('td:eq(0)').find('input').val();
		$.ajax({
			data: {
				cNum: cNum
			},
			url: "deleteproduct",
			success: function() {
				alert("삭제완료 !");
				document.location.reload(true);
			}
		})
	})
	
	$(".productupdate").on("click", function() {
		//현재 row
		var thisRow = $(this).closest('tr');
		//현재 행에서 td의 첫번째에 들어있는 input태그를 가지고있는 값
		var cNum = thisRow.find('td:eq(0)').find('input').val();
		var cName = thisRow.find('td:eq(1)').find('input').val();
		var cAmount = thisRow.find('td:eq(2)').find('input').val();
		var cPrice = thisRow.find('td:eq(3)').find('input').val();
		$.ajax({
			data : {
				cNum: cNum,
				cName: cName,
				cAmount: cAmount,
				cPrice: cPrice
			},
			url: "updateproduct",
			success:function() {
				alert("수정완료 !");
				document.location.reload(true);
			}
		})
	})
	</script>
</body>
</html>