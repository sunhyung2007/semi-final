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
		function purchaseHistory() {

			$
					.ajax({
						url : "purchaseHistory",
						contentType : "application/x-www-form-urlencoded; charset=UTF-8",

						cache : false,
						data : {},
						success : function() {
							location.href = '/order/purchaseHistory';
						}
					})
		}
	</script>


	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">

				<div>
					<button class="btn btn-secondary btn-lg order_btn"
						onclick="purchaseHistory()">구매 내역 보기</button>
				</div>
				<input type="text" value="100" id="totalprice"> 원

				<button onclick="requestPay()">결제하기</button>

				<script type="text/javascript">
					function requestPay() {
						var IMP = window.IMP;
						IMP.init('imp68480568'); //가맹점 식별코드
						var totalprice = $("#totalprice").val();
						console.log(totalprice);
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
			<!-- main_contents -->
		</div>
		<!-- contents -->
	</div>
	<!-- wrapper -->
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>

</body>
</html>