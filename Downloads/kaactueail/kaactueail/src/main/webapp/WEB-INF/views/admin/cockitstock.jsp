<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>상품관리</title>
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>상품관리</h3>
				

	<form action = "cockit" name = "search" id = "search">
	<input type = "text" id = "cName" name = "cName" >
	<input type = "submit" value = "검색" placeholder = "이름을 입력하세요" id = "searchsubmit">
	</form>
	<br/>
	<div class="btn_wrap" style="float: right;">
	<button type="submit" class="btn btn-dark" id="list_btn" onclick="window.location.href='write'">상품추가</button>
	</div>
	
	<div class="content_wrap">
	<table class="table table-hover">
	<tr>
		<th>NO</th>
		<th>칵키트명</th>
		<th>수량</th>
		<th>가격</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>
	
	<c:forEach items = "${cockit}" var = "product">
		<tr>
			<td><input type="text" value = "${ product.cNum }" style="border: none;"></td>
			
			<td><input type="text" value = "${ product.cName }" style="border: none;"></td>
			
			<!-- 칵키트수량 -->
			<c:if test = "${ product.cAmount  lt 1}" >
				<td><input type = "text" value = "품절" style ="background-color:red; color:white; font-weight:bold; border: none;"></td>
			</c:if>
			
			<c:if test = "${product.cAmount  lt 30 && product.cAmount ne 0}" >
				<td><input type = "text" value = "${ product.cAmount }" style ="background-color:tomato; color:white; border: none;"></td>
			</c:if>
			
			<c:if test = "${product.cAmount ge 30 }" >
				<td><input type = "text" value = "${ product.cAmount }" style="border: none;"></td>
			</c:if>
			<td><input type = "text" value = "${ product.cPrice }" style="border: none;"></td>
			<td><button type="button" class="btn btn-light productupdate">수정</button></td>
			<td><button type="button" class="btn btn-light productdelete">삭제</button></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	
	
				</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
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
	
	
	
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
	
</body>
</html>