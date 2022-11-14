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
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

</head>
<body>

	<script>
		function payment() {

			$
					.ajax({
						url : "paymentFinish",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",

						cache : false,
						data : {},
						success : function() {
							location.href = '/order/paymentFinish';
						}
					})
		}
	</script>

	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents" style="width: 100%;">
				<h3>구매하실 상품 리스트</h3>
				<p class="text-secondary" style="padding-bottom: 2%;">${ mId }님께서
					구매하실 상품의 목록입니다.</p>
				<table class="table table-hover">
					<tr class="table-secondary">
						<th scope="col"></th>
						<th>칵키트명</th>
						<th>판매금액</th>
						<th>수량</th>
						<th>주문금액</th>
						<!-- <th>삭제</th> -->
					</tr>
					<c:set var="totalAmount" value="0" />
					<c:set var="totalPrice" value="0" />

					<c:forEach items="${ orderDetail }" var="orderDetail">
						<tr>
							<td scope="row" class="bucket_info"><input type="hidden"
								class="tprice_input"
								value="${ orderDetail.CPrice * orderDetail.AMount }"> <input
								type="hidden" class="itemscount_input"
								value="${ orderDetail.AMount }"> <input type="hidden"
								class="cockitNum_input" value="${ orderDetail.CNum }"></td>

							<td class="cName"><c:out value="${ orderDetail.CName }" /></td>

							<td class="cPrice"><fmt:formatNumber
									value="${ orderDetail.CPrice }" pattern="###,###,###원" /></td>
							<td class="buchek_amount">
								<div>
									<input type="text" class="amount_input"
										value="${ orderDetail.AMount }" readonly
										style="border: none; background: transparent; width: 7%; text-align: center;">
								</div>
							</td>

							<td class="total"><fmt:formatNumber
									value="${ orderDetail.CPrice * orderDetail.AMount }"
									pattern="###,###,###원" /></td>
							<c:set var="totalAmount"
								value="${orderDetail.AMount + totalAmount}" />
							<c:set var="totalPrice"
								value="${orderDetail.CPrice * orderDetail.AMount + totalPrice}" />

						</tr>
					</c:forEach>
				</table>
				<hr>
				<div class="buyinfo_wrap"
					style="display: flex; align-items: center; justify-content: space-around;">
					<div>
						전체 상품 개수: <span class="totalcount"> <c:out
								value="${totalAmount}"></c:out></span>개
					</div>
					<div>
						최종 가격: <span class="totalprice"><c:out
								value="${totalPrice}"></c:out></span>원
					</div>
					<button class="btn btn-secondary btn-lg order_btn" onclick="requestPay()">결제하기</button>

				<script type="text/javascript">
					function requestPay() {
						var IMP = window.IMP;
						IMP.init('imp68480568'); //가맹점 식별코드
						var totalprice = ${totalPrice};
						IMP.request_pay({
							pg : "html5_inicis",
							pay_method : "card",
							merchant_uid : 'merchant_' + new Date().getTime(),
							name : 'KA AC TueAil',
							amount : totalprice,
							buyer_name : '구매자 (MNUM)',
						}, function(rsp) { // callback
							console.log(rsp);
							if (rsp.success) {
								var msg = '결제가 완료되었습니다.';
								alert(msg);
								location.href = "purchaseHistory"
							} else {
								var msg = '결제에 실패했습니다.';
								alert(msg);
							}
						});
					}
				</script>
			</div>
		</div>
	</div>
	<!-- main_contents -->
	</div>
	<!-- contents -->
	</div>
	<!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>

</body>
</html>