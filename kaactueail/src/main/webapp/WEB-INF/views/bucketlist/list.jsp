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
</head>
<body>

	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>장바구니</h3>
				<c:if test="${ empty list }">
				<p class="text-secondary" style="padding-bottom: 2%;">${ mId }님께서 장바구니에 등록한 상품이 없습니다.</p>
				</c:if>

				<table class="table table-hover">
					<tr class="table-secondary">
						<th scope="col">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="Allcheck" checked="checked"><span>선택</span>
							</div>
						</th>
						<th>칵키트명</th>
						<th>판매금액</th>
						<th>수량</th>
						<th>주문금액</th>
						<th>삭제</th>
					</tr>
					
				<c:if test="${ !empty list }">
				<p class="text-secondary" style="padding-bottom: 2%;">${ mId }님께서 장바구니에 등록한 상품의 목록입니다.</p>
					<c:forEach items="${ list }" var="list">
						<tr>
							<td scope="row" class="bucket_info">
								<input type="checkbox" class="form-check-input" id="check_items" checked="checked">
								<input type="hidden" class="tprice_input" value="${ list.cPrice * list.bucketlistAmount }" >
								<input type="hidden" class="itemscount_input" value="${ list.bucketlistAmount }" >
								<input type="hidden" class="cockitNum_input" value="${ list.cNum }">
							</td>
							
							<td class="cName"><c:out value="${ list.cName }" /></td>
							
							<td class="cPrice"><fmt:formatNumber value="${ list.cPrice }" pattern="###,###,###원" /></td>
							
							<td class="buchek_amount">
							<div>
							<button type="button" class="btn btn-light plus_btn">+</button>
								<input type="text" class="amount_input" value="${ list.bucketlistAmount }" readonly style="border: none; background: transparent; width: 7%; text-align: center;"> 
							<button type="button" class="btn btn-light minus_btn">-</button>
							<button class="btn btn-light update_btn" data-bucketlistNum="${ list.bucketlistNum }">변경</button>
							</div>
							</td>
							
							<td class="total"><fmt:formatNumber value="${ list.cPrice * list.bucketlistAmount }" pattern="###,###,###원"/></td>
							<td><button class="btn btn-light delete_btn" data-bucketlistNum="${ list.bucketlistNum }">삭제</button></td>
							
							</tr>
					</c:forEach>
					</c:if>
				</table>

				<hr>
				<div class="buyinfo_wrap" style="display: flex; align-items:center; justify-content:space-around;">
					<div>
						전체 상품 개수: <span class="totalcount"></span>개
					</div>
					<div>
						 최종 가격: 	<span class="totalprice"></span>원
					</div>
					<div>
						<button class="btn btn-secondary btn-lg order_btn">구매하기</button>
					</div>
				</div>

				
				<!-- 수량 업데이트 폼 -->
				<form action="/bucketlist/update" method="post" class="amount_update">
					<input type="hidden" name="bucketlistNum" class="update_bucketNum">
					<input type="hidden" name="bucketlistAmount" class="update_amount">
				</form>
				<!-- 상품 삭제 폼 -->
				<form action="/bucketlist/delete" method="post" class="bucket_delete"> 
					<input type="hidden" name="bucketlistNum" class="delete_bucketNum">
				</form>
				<form action="/order/list" method="get" class="order_move">
				
				</form>


			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	
	
	
	
	
<script type="text/javascript">

//수량 버튼 클릭시
let amount = $(".amount_input").val();
	$(".plus_btn").on("click", function(){
		let amount = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++amount);
	});
	
	$(".minus_btn").on("click", function(){
		let amount = $(this).parent("div").find("input").val();
		if(amount > 1){
		$(this).parent("div").find("input").val(--amount);
		}
	});
	
// 수량 수정
$(".update_btn").on("click", function(){
 	let bucketlistNum = $(this).data("bucketlistnum");
	let bucketlistamount = $(this).parent("div").find("input").val();
	$(".update_bucketNum").val(bucketlistNum);
	$(".update_amount").val(bucketlistamount);
	$(".amount_update").submit();
	
});


// 장바구니 삭제
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	let bucketlistNum = $(this).data("bucketlistnum")
	$(".delete_bucketNum").val(bucketlistNum);
	console.log(bucketlistNum);
	$(".bucket_delete").submit();
	
});


// 물품 구매
$(".order_btn").on("click", function(){
	let form_content = '';
	let orderNum = 0;
	$(".bucket_info").each(function(index, element){
		
		if($(element).find(".form-check-input").is(":checked")=== true) { // 체크박스 체크 되면
		let cNum = $(element).find(".cockitNum_input").val();
		let bucketlistAmount = $(element).find(".itemscount_input").val();
		
		let cockitNum_input = "<input name='order["+orderNum+"].cnum' type='hidden' value='"+cNum+"'>";
		form_content += cockitNum_input;
		let itemscount_input= "<input name='order["+orderNum+"].amount' type='hidden' value='"+bucketlistAmount+"'>";
		form_content += itemscount_input;
		
		orderNum += 1;
		}
	});

 	$(".order_move").html(form_content);

   	$(".order_move").submit();
});

	
// 구매정보 계산
$(document).ready(function(){
	setTotal();	
});


function setTotal(){
	let totalPrice = 0;
	let totalCount = 0;
	
	$(".bucket_info").each(function(index, element){
		if($(element).find("#check_items").is(":checked") === true){
		
		totalPrice += parseInt($(element).find(".tprice_input").val());
		totalCount += parseInt($(element).find(".itemscount_input").val());
	}
		
	});
	
	$(".totalprice").text(totalPrice.toLocaleString());
	$(".totalcount").text(totalCount);
	
	
}

// 개별 체크박스 여부에 따른 구매정보 변화
$(".form-check-input").on("change", function(){
	setTotal($(".bucket_info"));
});

// 체크박스 전체 선택
$("#Allcheck").on("click", function(){
	if($("#Allcheck").prop("checked")){
		
		$("input[id=check_items]").prop("checked", true);
	} else {
		$("input[id=check_items]").prop("checked", false);
	}
	
	setTotal($(".bucket_info"));
});

</script>

	
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>

	
</body>
</html>