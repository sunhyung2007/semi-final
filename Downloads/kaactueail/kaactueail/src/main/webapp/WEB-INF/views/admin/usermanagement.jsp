<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>회원관리</title>
</head>
<body>

	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>회원관리</h3>
				<p>현재 회원 수 : ${ personcount }명</p>


			<div class="content_wrap">
				<form action="usermanagement">
					회원검색: <select name="option">
						<option value="">선택</option>
						<option value="mName">이름</option>
						<option value="mId">아이디</option>
					</select> <input type="text" id="mId" name="mId"> <input
						type="submit" value="검색">
				</form>
				<table class="table table-hover" style="table-layout: fixed;">
					<tr>
						<th>회원번호</th>
						<th>ID</th>
						<th>비밀번호</th>
						<th>회원이름</th>
						<th>생년월일</th>
						<th>연락처</th>
						<th>성인여부</th>
						<th>회원삭제</th>
					</tr>

				
					<c:forEach items="${ list }" var="member">
						<tr>
						<td><input value="${member.MNum }" readonly style="border: none;"></td>
						<td><input value="${member.MId }" readonly style="border: none;"></td>
						<td><input value="${member.MPwd }" readonly style="border: none;"></td>
						<td><input value="${member.MName }" readonly style="border: none;"></td>
						<td><input value="${member.MBirth }" readonly style="border: none;"></td>
						<td><input value="${member.MTel }" readonly style="border: none;"></td>
						
						<c:if test="${member.MRole eq 'ROLE_ADMIN'}">
							<td><input value="관리자" readonly style="border: none; background-color: silver; width: 60%;"></td>
							<td><button type="button" class="btn btn-light admindelete" disabled>삭제</button></td>
						</c:if>
						<c:if test="${member.MRole eq 'ROLE_USER' }">
							<td><input value="성인" readonly style="border: none;"></td>
							<td><button type="button" class="btn btn-light memberdelete">삭제</button></td>
						</c:if>
						<c:if test="${member.MRole eq 'ROLE_NOTUSER' }">
							<td><input value="미성년자" readonly style="border: none; background-color: #FF2F2F; width: 60%;"></td>
							<td><button type="button" class="btn btn-light memberdelete">삭제</button></td>

						</c:if>
						</tr>

					</c:forEach>

				</table>
			</div>


			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->	
	
	
	
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
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>

</body>
</html>