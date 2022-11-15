<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 뷰포트 및 탭 아이콘, main css 삽입 -->
<%@ include file="../layout/icon_contents.jsp"%>
<title>스토어</title>
<link rel="stylesheet" href="/resources/css/detailLayout_freeb.css"/>
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<h3>칵키트 상세</h3>		
			
					<button type="submit" class="btn btn-dark" id="list_btn" onclick="location.href='list'" style="float: right;">목록</button>
					
		<form method="post">
			<div class="layout_all">
				<div class="layout_title">
					<div>
						<input class="input_block" name="cNum" readonly	style="border: none" value="<c:out value='${ pageInfo.cNum }'/>">
					</div>
					<div>
						<input class="input_block" name="cTitle" readonly style="border: none; resize: none;" value="<c:out value='${ pageInfo.cTitle }' />">
					</div>
				</div>
					<hr>

					<div class="layout_content">
						<div style="width: 18rem; text-align: center; margin: auto;">
							<img
								src="${path}/resources/images/cockit/${pageInfo.cName}.png"
								class="card-img-top" alt="NO IMAGE" width=350px, height=230px
								style="cursor: pointer;">
						</div>
						<div class="item_info" style="display: flex; justify-content: flex-end;">
							<div class="buy_info">
								<div class="item_price" style="display: flex; align-items: center;">
									<div>
										<label>가격</label>
									</div>
									<div>
										<input class="input_block" readonly style="border: none" value="<fmt:formatNumber value="${pageInfo.cPrice}" pattern="#,###원"/>">
										<input id="cPrice" name="cPrice" value="${pageInfo.cPrice}">
									</div>
									<div style="display: flex; align-items:center;">
										<div>
											<label>수량</label>
										</div>
										<div>
											<div class="table_text_align_center quantity_div" style="width: 60%;">
												<input type="text" class="quantity_input" id="quantityinput" readonly name="bucketlistAmount" value="1" style="width: 25%; padding-left:10%;">
													<button type="button" class="btn btn-light quantity_btn plus_btn">+</button>
													<button type="button" class="btn btn-light quantity_btn minus_btn">-</button>
											</div>
										</div>
									</div>
									<div style="display: flex; align-items: center; justify-content:flex-end;"> 
										<div>
											<label>상품 결제가격</label>
										</div>
										<div class="form_section_content" style="width: 50%;">
											<input class="input_block" id="tPrice" type="text" readonly	value="${pageInfo.cPrice}" style="width: 50%; padding-left:15%;">
										</div>
									</div>
								</div>
									<div class="btn_buy" style="display: flex; justify-content: flex-end; padding-top:2%;">
										<div style="margin-right: 5%;">
											<button type="submit" class="btn btn-dark" id="list_btn" formaction="cart" >장바구니	담기</button>
										</div>
										<div style="margin-right: 5%;">
											<button type="submit" class="btn btn-dark" id="list_btn">결제하기</button>
										</div>
									</div>
								</div> <!-- buy_info -->
							</div><!-- item_info -->

							<div class="item_content">
								<div class="form_section_title">
									<label>칵테일 내용</label>
								</div>
								<div class="form_section_content">
									<textarea class="input_block" name="cContent" readonly style="border: none; resize: none;"><c:out value='${pageInfo.cContent }' /></textarea>
								</div>
							</div>
							<div class="item_recipe">
								<div class="form_section_title">
									<label>칵테일 레시피</label>
								</div>
									<div class="form_section_content">
										<textarea class="input_block" name="cRecipe" readonly style="border: none; resize: none;"><c:out value='${pageInfo.cRecipe }' /></textarea>
									</div>
							</div>
						</div>
					</div>
				</form>
						
										
				<form id="detailForm" action="/store/modify" method="get">
					<input type="hidden" id="cNum" name="cNum" value="<c:out value= '${pageInfo.cNum}'/>">
				</form>
				
				
				
				
			</div> <!-- main_contents -->
		</div> <!-- contents -->
	</div> <!-- wrapper -->
	
	
	<script>
		$(".plus_btn").on("click", function(){
			var quantity = $("#quantityinput").val();
			var cprice = $("#tPrice").val();
			$("#quantityinput").val(++quantity);
		    $("#tPrice").val(quantity * ${pageInfo.cPrice});

		});
		$(".minus_btn").on("click", function(){
			var quantity = $("#quantityinput").val();
			var cprice = $("#tPrice").val();
			if(quantity > 1){
				$("#quantityinput").val(--quantity);
				console.log(cprice);
			    $("#tPrice").val(quantity * ${pageInfo.cPrice});
			}
								
		});		
	</script>
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>