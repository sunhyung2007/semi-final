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
<title>상품 목록 세부페이지</title>
<!-- jqeury cdn -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>
  <!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
</head>
<body>
	<!-- header삽입 -->
	<%@ include file="../layout/header.jsp"%>
	<div class="wrapper">
		<div class="contents">
			<div class="main_contents">
				<form method="post">
					<div class="form_section">
						<div style="width: 18rem; text-align: center; margin: auto;">
							<img
								src="${path}/resources/images/cockitImage/${pageInfo.cName}.png"
								class="card-img-top" alt="NO IMAGE" width=350px, height=230px
								style="cursor: pointer;">
						</div>
						<div class="form_section_title">
							<label>칵키트 번호</label>
						</div>
						<div class="form_section_content">
							<input class="input_block" name="cNum" readonly="readonly"
								style="border: none"
								value="<c:out value='${pageInfo.cNum }'></c:out>">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>칵키트 상품명</label>
						</div>
						<div class="form_section_content">
							<textarea class="input_block" name="cTitle" id="cTitle" readonly="readonly"
								style="border: none; resize: none;"><c:out
									value='${pageInfo.cTitle }'/></textarea>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>칵키트 이름</label>
						</div>
						<div class="form_section_content">
							<textarea class="input_block" name="cName" id="cName" readonly="readonly"
								style="border: none; resize: none;"><c:out
									value='${pageInfo.cName }'/></textarea>
						</div>
					</div>					
					<div class="form_section">
						<div class="form_section_title">
							<label>칵키트 가격</label>
						</div>
						<div class="form_section_content">
<%-- 							<input class="input_block" id="cPrice" name="cPrice" type="text"
								readonly="readonly" style="border: none"
								value="<fmt:formatNumber value="${pageInfo.cPrice}" pattern="#,### 원"/>"> --%>
							<input class="input_block" id="cPrice" name="cPrice" type="text"
							 readonly name="cPrice" style="border: none"
								value="${pageInfo.cPrice}">															
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>칵테일 내용</label>
						</div>
						<div class="form_section_content">
							<textarea class="input_block" name="cContent" readonly="readonly"
								style="border: none; resize: none;"><c:out
									value='${pageInfo.cContent }' /></textarea>
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>칵테일 레시피</label>
						</div>
						<div class="form_section_content">
							<textarea class="input_block" name="cRecipe" readonly="readonly"
								style="border: none; resize: none;"><c:out
									value='${pageInfo.cRecipe }' /></textarea>
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_title">
							<label>수량 선택하기</label>
						</div>
						<div class="form_section_content">
							<div class="table_text_align_center quantity_div">
								<%-- <input type="text" value="${pageInfo.bucketlistAmount}" class="quantity_input"> --%>
								<input type="text" class="quantity_input" id="quantityinput"
									readonly name="bucketlistAmount" value="1">
								<button type="button" class="quantity_btn plus_btn">+</button>
								<button type="button" class="quantity_btn minus_btn">-</button>
							</div>
						</div>
					</div>

					<div class="form_section">
						<div class="form_section_titie">
							<label>상품 결제가격</label>
						</div>
						<div class="form_section_content">
							<%-- <input class="input_block" id="tPrice" name="tPrice" type="text" readonly  
						value= "<fmt:formatNumber value="${pageInfo.tPrice}" pattern="#,### 원"/>"> --%>
							<input class="input_block" id="tPrice" type="text" readonly name="tPrice"
								value="${pageInfo.cPrice}">
						</div>
					</div>
					<br /> <br /> <br />
					<div class="btn_wrap">
						<%-- <button class="btn btn-dark" id="modifty_btn" onclick="location.href='modify?cNum=${pageInfo.cNum}'">수정</button> --%>
						<!-- <button type="submit" class="btn btn-dark" id="addCart_btn">장바구니 담기</button> -->
						<input type="submit" value="장바구니 담기" class="btn btn-dark" id="addCart_btn" onclick="javascript: form.action='cart';"/>
					</div>
					<div class="btn_wrap">
						<%-- <button class="btn btn-dark" id="modifty_btn" onclick="location.href='modify?cNum=${pageInfo.cNum}'">수정</button> --%>
						<!-- <input type="button" class="btn btn-dark" id="immeBuy_btn" onclick = "window.location.href='payment'"/>바로 결제하기 -->
						<input type="submit" value="바로 결제하기" class="btn btn-dark" id="immeBuy_btn" onclick="javascript: form.action='payment';"/>					
					</div>					
				</form>
				<button type="submit" class="btn btn-dark" id="list_btn" onclick="location.href='list'">목록으로 돌아가기</button>				
				<%-- <form id="detailForm" action="/store/modify" method="get">
						<input type="hidden" id="cNum" name="cNum" value="<c:out value= '${pageInfo.cNum}'/>">
				</form> --%>
				
			</div>
		</div>

	</div> <!-- wrapper div -->
	<script>

		//let cprice = $("#cPrice").val();
		$(".plus_btn").on("click", function(){
			//var quantity = $(this).parent("div").find("input").val();
			var quantity = $("#quantityinput").val();
			var cprice = $("#tPrice").val();
			//$(this).parent("div").find("input").val(++quantity);
			$("#quantityinput").val(++quantity);
		    $("#tPrice").val(quantity * ${pageInfo.cPrice});

		});
		$(".minus_btn").on("click", function(){
			//var quantity = $(this).parent("div").find("input").val();
			var quantity = $("#quantityinput").val();
			var cprice = $("#tPrice").val();
			if(quantity > 1){
				//$(this).parent("div").find("input").val(--quantity);
				$("#quantityinput").val(--quantity);
				console.log(cprice);
			    $("#tPrice").val(quantity * ${pageInfo.cPrice});
			}
								
		});	
		
/* 		//바로 구매하기
		$("#immeBuy_btn").on("click", function(){
			let form_content = '';
			let orderNum = 0;
			
		}); */
		
 		/* $("#immeBuy_btn").on("click", function(){
 			var cName = $("#cName").val();
 			var bucketlistAmount = $("#quantityinput").val();
 			console.log("버튼눌림");
 			console.log(bucketlistAmount);
			$.ajax({
				data:{
					cName: cName,
					bucketlistAmount: bucketlistAmount
				},
				url: "payment",
				type: "POST",
				contentType: "application/json; charset=utf-8",
				dataType: 'JSON',
				success: function(data){
					console.log(data);
				}
			});
		});	 */
		
		
		
		
		
/* 		let form = $("#infoForm");		
		$("#cancelBtn").on("click", fucntion(e){
			console.log("click")
			form.find("#cNum").remove();
			form.attr("action", "/store/list");
			form.submit();			
		}); */
/* 		$("#cancelBtn").on("click", function(e){
			console.log("cancelClick");
			location.href = "list";
		})
		$("#modifyBtn").on("click", function(e){
			console.log("modifyClick");
			location.href = "modify?cNum=${pageInfo.cNum}";
		})		 */
	</script>
	<!-- footer삽입 -->
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>