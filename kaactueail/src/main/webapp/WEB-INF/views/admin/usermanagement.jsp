<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> <!-- 추가 -->
	<meta charset="UTF-8" />
<title>회원관리</title>
</head>
<body>



<h3>회원수 : ${personcount }</h3>
<form action="usermanagement">
회원찾기: 
<select name = "option">
	<option value = "mName">이름</option>
	<option value = "mId">아이디</option>
</select> 
<input type = "text" id = "mId" name = "mId" >
<input type = "submit" value = "검색">
</form>
	<table border="1" id = "membertable">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>회원이름</th>
			<th>생년월일</th>
			<th>연락처</th>
			<th>성인인가요?</th>
			<th>회원삭제</th>
		</tr>

	
	<c:forEach items="${ list}" var = "member">
	
	<c:if test = "${member.mRole eq 'ROLE_ADMIN'}">
	<tr class = "memberinfo" style = "background-color:black;">
	</c:if>
	<c:if test="${member.mRole eq 'ROLE_USER' }">
	<tr class = "memberinfo">
	</c:if>
	<c:if test="${member.mRole eq 'ROLE_NOTUSER' }">
	<tr class = "memberinfo" style = "background-color:tomato;">
	</c:if>
	<td><input value = "${member.mNum }" readonly></td><td><input value = "${member.mId }" readonly></td><td><input value = "${member.mPwd }" readonly></td>
	<td><input value = "${member.mName }"  readonly></td><td><input value = "${member.mBirth }"  readonly></td><td><input value = "${member.mTel }"  readonly></td>
	<c:if test = "${member.mRole eq 'ROLE_ADMIN'}">
	<td><input value = "관리자" readonly ></td>
	<td><button type = "button" class = "admindelete" disabled="disabled">삭제</button></td>
	</c:if>
	<c:if test = "${member.mRole eq 'ROLE_USER' }">
	<td><input value = "성인" readonly></td>
	<td><button type = "button" class = "memberdelete" >삭제</button></td>
	</c:if>
	<c:if test = "${member.mRole eq 'ROLE_NOTUSER' }">
	<td><input value = "미성년자" readonly></td>
	<td><button type = "button" class = "memberdelete" >삭제</button></td>
	
	</c:if>
	</tr>
	
	</c:forEach>
	
	</table>
	
	<script>
	$(".memberdelete").on("click", function () {
		//현재 row
		var thisRow = $(this).closest('tr');
		//현재 행에서 td의 첫번째에 들어있는 input태그를 가지고있는 값
		var mNum = thisRow.find('td:eq(0)').find('input').val();
		
		$.ajax({
			data: {
				mNum : mNum
			},
			url: "deletemember",
			success: function() {
				document.location.reload(true);
			}
		})
	})
</script>
</body>
</html>