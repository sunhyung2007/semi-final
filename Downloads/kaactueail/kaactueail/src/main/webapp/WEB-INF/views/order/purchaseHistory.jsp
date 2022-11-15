<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>장바구니</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>

</head>
<body>
	<script>
	
	</script>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<%-- <div class="contents">
			<div class="main_contents">
				<div>
					<h3>구매하실 상품 리스트</h3>
					<p class="text-secondary" style="padding-bottom: 2%;">${ mId }님께서
						구매하신 상품의 목록입니다.</p>
					<form action="purchaseHistory">
						<div>
							<c:forEach var="purchaseHistory" items="${purchaseHistory}">
								<div>
									<div>
										<span> <c:out value="${purchaseHistory}" /> <span>
												<span> <c:out value="${purchaseHistory.PUrchaseNum}" />
													<span> <span> <c:out
																value="${purchaseHistory.PUrchaseCost}" /> <span>
																<c:out value="${purchaseHistory.PUrchaseAmount}" /> <span>
																	<c:out value="${purchaseHistory.PUrchaseDate}" /> <span>
																		<c:out value="${purchaseHistory.PUrchaseMemberNum }" />
																		<span> <c:out
																				value="${purchaseHistory.PUrchaseCockitNum}" />
									</div>
								</div>
							</c:forEach>
						</div>
					</form>
				</div>
			</div>
			<!-- main_contents -->
		</div> --%>
		
		<div class="contents">
			<div class="main_contents" style="width: 100%;">
				<h3>구매 내역</h3>
				<p class="text-secondary" style="padding-bottom: 2%;">${ mId }님의 구매내역입니다.</p>
				<table class="table table-hover">
					<tr class="table-secondary">
						<th scope="col">
						</th>
						<th>칵키트명</th>
						<th>판매금액</th>
						<th>수량</th>
						<th>구매 일자</th>
						<th>구매금액</th>
						
						<!-- <th>삭제</th> -->
					</tr>
					<c:set var="totalAmount" value="0" />
					<c:set var="totalPrice" value="0" />

					<c:forEach items="${ purchaseHistory }" var="purchaseHistory">
						<tr>
							<td scope="row" class="bucket_info">
								<input type="hidden" class="tprice_input"
								value="${ purchaseHistory.PUrchaseCost * purchaseHistory.PUrchaseAmount }"> <input
								type="hidden" class="itemscount_input"
								value="${purchaseHistory.PUrchaseAmount }"> <input type="hidden"
								class="cockitNum_input" value="${purchaseHistory.PUrchaseCockitNum}">
							</td>

							<td class="cName"><c:out value="${ purchaseHistory.PUrchaseCockitName }" /></td>

							<td class="cPrice"><fmt:formatNumber
									value="${ purchaseHistory.PUrchaseCost }" pattern="###,###,###원" /></td>
							<td class="buchek_amount">
								<div>
									<input type="text" class="amount_input"
										value="${ purchaseHistory.PUrchaseAmount }" readonly
										style="border: none; background: transparent; width: 7%; text-align: center;">
								</div>
							</td>
							<td><c:out value="${ purchaseHistory.PUrchaseDate }" /></td>
							<td class="total"><fmt:formatNumber
									value="${ purchaseHistory.PUrchaseCost  * purchaseHistory.PUrchaseAmount }"
									pattern="###,###,###원" /></td>
							<c:set var="totalAmount" value="${purchaseHistory.PUrchaseAmount + totalAmount}" />
							<c:set var="totalPrice" value="${purchaseHistory.PUrchaseCost * purchaseHistory.PUrchaseAmount + totalPrice}" />

						</tr>
					</c:forEach>
				</table>
				<hr>
				<div class="buyinfo_wrap"
					style="display: flex; align-items: center; justify-content: space-around;">
					<div>
						전체 상품 개수: <span class="totalcount"> <c:out value="${totalAmount}"></c:out></span>개
					</div>
					<div>
						총 구매 금액: <span class="totalprice"><c:out value="${totalPrice}"></c:out></span>원
					</div>
				</div>
			</div>
		</div>
		<!-- contents -->
	</div>
	<!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>

</body>
</html>