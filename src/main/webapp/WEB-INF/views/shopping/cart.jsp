<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@ include file="../include/header.jsp" %>
<style>
/* 체크박스 크기 설정 */
#check{
    height: 15px;
    width: 15px;
}
/* disable cursor 스타일 */
input.form-control:hover{
    cursor: default;
}
/* 배경 화면 */
body { 	
    background-image:url("/resources/images/background2.jpg");
    background-attachment: fixed, scroll;
    background-repeat:no-repeat;
    background-size:cover;
}

#class {
	background-color: #EBFBFF;
	padding: 10px 0;
}

</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<form action="/shopping/order" method="post" enctype="multipart/form-data">
	<div class="row">
		<div class="container" id="class">
			<section class="container text-center" style="margin: auto;">
				<h2 align="center">장바구니</h2>
				<!-- 구매 상품 확인하기 -->
				<br/>
				<div>
				    <table class="table table-bordered">
				    	<tr>
							<th class="text-center">선택</th>
							<th class="text-center">No.</th>
							<th class="text-center">상품(Thumbnail)</th>
							<th class="text-center">상품명</th>
							<th class="text-center">수량</th>
							<th class="text-center">가격</th>
						</tr>
						<!-- 장바구니 상품 나열하기 -->
						<c:choose>
							<%-- 장바구니에 상품이 없는 경우 --%>
							<c:when test="${cart == null }">
								<tr>
								    <td align="center" colspan="6">
									    <div class="col-md-offset-3 col-md-6">
									    	<label class="text-center" style="font-size: 18px; padding-top: 7px;">담은 상품이 존재하지 않습니다.</label>
								    	</div>
									</td>
								</tr>
							</c:when>
							<%-- 장바구니에 상품이 있는 경우 --%>
							<c:when test="${cart != null }">
								<c:forEach var="products_item" items="${product }" varStatus="productNum">
									<tr>
									    <td class="form-group" style="vertical-align: middle;">
											<input type="hidden" class="ctId" name="cartId" value="${cart[productNum.index].cart_id }">
										    <div>
										        <label>
										            <input class="check" id="check" type="checkbox" checked>
										        </label>
										    </div>
										</td>
										<td class="form-group" style="vertical-align: middle;">
										    <div><span>${productNum.count }</span></div>
										</td>
										<td class="form-group" style="vertical-align: middle;">
											<div class="col-md-12 text-center" id="item_thumbnail">
											    <a href="#" class="thumbnail">
											        <input type="image" src="${path }/download?imageFile=${products_item.product_image }" width="161" height="133" disabled>
											        <input type="hidden" class="imageFile" value="${products_item.product_image }" name="imageFile">
											    </a>
											</div>
										</td>
										<td class="form-group" style="vertical-align: middle;">
										    <input class="form-control text-center productName" type="text" id="productName" value="${products_item.product_name }" disabled>
											<input type="hidden" class="pdtName" name="productName" value="${products_item.product_name }">
										</td>
										<td class="form-inline" style="vertical-align: middle;">
										    <div class="form-group">
										        <button type="button" class="btn btn-default minus"><span class="glyphicon glyphicon-minus"></span></button>
										        <input class="form-control text-center cnt" width="30px" type="text" name="cnt" value="${cart[productNum.index].count }">
										        <button type="button" class="btn btn-default plus"><span class="glyphicon glyphicon-plus"></span></button>
										    </div>
										</td>
										<td class="form-group" style="vertical-align: middle;">
											<input class="form-control text-center productPrice" type="text" id="productPrice" disabled>
											<input class="originPrice" type="hidden" value="${products_item.product_price }">
											<input class="pdtPrice" type="hidden" name="productPrice">
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>
				</div>
				<!-- 구매 상품 확인하기 끝 -->
				<hr>
			</section>
			<!-- 결재 금액 확인하기 -->
			<section class="container">
		    	<div class="row">
			    	<div class="col-md-offset-8 col-md-4">
				        <table class="table table-bordered" style="border: 0;">
				            <tr align="center">
				                <th class="text-center">전체 금액</th>
				            </tr>
				            <tr class="action">
				            	<td class="form-group">
				                    <input class="form-control text-center" type="text" id="totalPrice" disabled>
				                    <input type="hidden" id="tolPrice" name="totalPrice">
				                </td>
				            </tr>
				        </table>
			       	</div>
			    </div>
			    <c:choose>
			    	<%-- 장바구니에 상품이 없는 경우 --%>
			    	<c:when test="${cart == null }">
			    		<div class="row">
			    			<div class="col-md-offset-8 col-md-4 text-right">
					            <button type="submit" id="pay" class="btn btn-primary" disabled>결제하기</button>
					        </div>
			    		</div>
			    	</c:when>
			    	<%-- 장바구니에 상품이 있는 경우 --%>
			    	<c:when test="${cart != null }">
					    <div class="row">
					    	<div class="col-md-offset-8 col-md-4 text-right">
					    		<input type="hidden" name="cartNum" value="${cart.cart_number }">
					            <button type="submit" id="pay" class="btn btn-primary">결제하기</button>
					        </div>
					    </div>
				    </c:when>
				</c:choose>
			</section>
		</div>
	</div>
	</form>
	<!-- 결재 금액 확인하기 끝 -->
	<br/><br/><br/><br/><br/>
	<div class="row">
		<%@ include file="../include/footer.jsp" %>
	</div>
</body>
<script>
let count = document.getElementsByClassName("cnt");
let price = document.getElementsByClassName("originPrice");
let productprice = document.getElementsByClassName("productPrice");
let pdtprice = document.getElementsByClassName("pdtPrice");

let totalprice = document.getElementById("totalPrice");
let tolprice = document.getElementById("tolPrice");

for(var i = 0; i < price.length; i++){
	productprice[i].value = price[i].value * count[i].value;
	pdtprice[i].value = price[i].value * count[i].value;
}

// Final Price
var t = 0;
for(var i = 0; i < pdtprice.length; i++){
	t += parseInt(pdtprice[i].value);
}
totalprice.value = t;
tolprice.value = t;
</script>

<script>
$(document).ready(function() {
	let sum = 0;
	
	$(".minus, .plus, .cnt, .originPrice, .productPrice, .pdtPrice, .check").each(function(idx) {
		let plus = $(".plus:eq(" + idx + ")");
		let minus = $(".minus:eq(" + idx + ")");
		let count = $(".cnt:eq(" + idx + ")");
		
		let ctId = $(".ctId:eq(" + idx + ")");
		
		let origin_price = $(".originPrice:eq(" + idx + ")");
		let price = $(".productPrice:eq(" + idx + ")");
		let pdtprice = $(".pdtPrice:eq(" + idx + ")");
		
		let check = $(".check:eq(" + idx + ")");
		
		let total_price = $("#totalPrice");
		let tol_price = $("#tolPrice");
//----------------------------------------------------------------------------------------------------------------
		// +, - 버튼 클릭시 수량 숫자 변경
		plus.on("click", function() {
			count.prop("value", parseInt(count.val()) + 1);
			price.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
			pdtprice.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
			// 변경된 수량 database에 저장하기
			$.ajax({
				url: "/shopping/countchange",
				type: "get",
				dataType: "json",
				data: {"count": count.val(), "cart_id": ctId.val()},
				success: function(data) {
					console.log("success : " + data);
				}, 
				error: function(data) {
					console.log("error : " + data);
				}
			});
			
			// total_price 갱신
			sum = 0;
			for(var i = 0; i < $(".productName").length; i++) {
				// 넘어갈 값이 disabled 되지 않았을 경우
				if(!$(".pdtPrice:eq(" + i + ")").is(":disabled")){
					sum += parseInt($(".pdtPrice:eq(" + i + ")").val());
				}
				// 넘어갈 값이 disabled 되었을 경우
				else if($(".pdtPrice:eq(" + i + ")").is(":disabled")) {
					sum += 0;
				}
			}
			total_price.prop("value", sum);
			tol_price.prop("value", sum);
		});
		minus.on("click", function() {
			count.prop("value", parseInt(count.val()) - 1);
			if(parseInt(count.val()) > 0){
				price.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
				pdtprice.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
			}
			// 변경된 수량 database에 저장하기
			$.ajax({
				url: "/shopping/countchange",
				type: "get",
				dataType: "json",
				data: {"count": count.val(), "cart_id": ctId.val()},
				success: function(data) {
					console.log("success : " + data);
				}, 
				error: function(data) {
					console.log("error : " + data);
				}
			});
			
			// total_price 갱신
			sum = 0;
			for(var i = 0; i < $(".productName").length; i++) {
				// 넘어갈 값이 disabled 되지 않았을 경우
				if(!$(".pdtPrice:eq(" + i + ")").is(":disabled")){
					sum += parseInt($(".pdtPrice:eq(" + i + ")").val());
				}
				// 넘어갈 값이 disabled 되었을 경우
				else if($(".pdtPrice:eq(" + i + ")").is(":disabled")) {
					sum += 0;
				}
			}
			total_price.prop("value", sum);
			tol_price.prop("value", sum);
			
			// 수량이 1보다 작으면 default 값은 1
			if(parseInt(count.val()) < 1) {
				count.prop("value", 1);
				price.val(origin_price.val());
				pdtprice.val(origin_price.val());
			}
		});
//----------------------------------------------------------------------------------------------------------------
		// 숫자를 직접 입력했을 경우 제품 가격
		count.on("input", function() {
			price.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
			pdtprice.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
			// 변경된 수량 database에 저장하기
			$.ajax({
				url: "/shopping/countchange",
				type: "get",
				dataType: "json",
				data: {"count": count.val(), "cart_id": ctId.val()},
				success: function(data) {
					console.log("success : " + data);
				}, 
				error: function(data) {
					console.log("error : " + data);
				}
			});
			
			// total_price 갱신
			sum = 0;
			for(var i = 0; i < $(".productName").length; i++) {
				// 넘어갈 값이 disabled 되지 않았을 경우
				if(!$(".pdtPrice:eq(" + i + ")").is(":disabled")){
					sum += parseInt($(".pdtPrice:eq(" + i + ")").val());
				}
				// 넘어갈 값이 disabled 되었을 경우
				else if($(".pdtPrice:eq(" + i + ")").is(":disabled")) {
					sum += 0;
				}
			}
			total_price.prop("value", sum);
			tol_price.prop("value", sum);
		});
//----------------------------------------------------------------------------------------------------------------	
		// check 여부에 따른 total_price 변동
		check.on("click", function() {
			// checked true
			if(check.is(":checked")){
//				console.log("true");			
				// 모든 버튼 선택 활성화
				count.attr("disabled", false);
				plus.prop("disabled", false);
				minus.prop("disabled", false);
				
				// 물건 값 넘기기
				$(".pdtName:eq(" + idx + ")").prop("disabled", false);
				$(".imageFile:eq(" + idx + ")").prop("disabled", false);
				count.prop("disabled", false);
				pdtprice.prop("disabled", false);
				
				// total_price 갱신
				sum = 0;
				for(var i = 0; i < $(".productName").length; i++) {
					// 넘어갈 값이 disabled 되지 않았을 경우
					if(!$(".pdtPrice:eq(" + i + ")").is(":disabled")){
						sum += parseInt($(".pdtPrice:eq(" + i + ")").val());
					}
					// 넘어갈 값이 disabled 되었을 경우
					else if($(".pdtPrice:eq(" + i + ")").is(":disabled")) {
						sum += 0;
					}
				}
				total_price.prop("value", sum);
				tol_price.prop("value", sum);
			// checked false
			} else if(!check.is(":checked")) {
//				console.log("false");			
				// 모든 버튼 선택 불능
				count.attr("disabled", true);
				plus.prop("disabled", true);
				minus.prop("disabled", true);
				
				// 물건 값 넘기지 않기
				$(".pdtName:eq(" + idx + ")").prop("disabled", true);
				$(".imageFile:eq(" + idx + ")").prop("disabled", true);
				count.prop("disabled", true);
				pdtprice.prop("disabled", true);
				
				// total_price 갱신
				sum = 0;
				for(var i = 0; i < $(".productName").length; i++) {
					// 넘어갈 값이 disabled 되지 않았을 경우
					if(!$(".pdtPrice:eq(" + i + ")").is(":disabled")){
						sum += parseInt($(".pdtPrice:eq(" + i + ")").val());
					}
					// 넘어갈 값이 disabled 되었을 경우
					else if($(".pdtPrice:eq(" + i + ")").is(":disabled")) {
						sum += 0;
					}
				}
				total_price.prop("value", sum);
				tol_price.prop("value", sum);
			}
		});
	});
//----------------------------------------------------------------------------------------------------------------
	// 수량이 1보다 작으면 default 값은 1
	$(".cnt").on("input", count_change);
	function count_change(event) {
		if(parseInt($(".cnt").val()) < 1) {
			$(".cnt").val(1);
		}
		
		// 숫자만 입력할 수 있도록 함
		const inputValue = $(this).val();
	    const onlyDigits = /^[0-9]*$/; // 숫자만 허용하는 정규식

	    if (!onlyDigits.test(inputValue)) {
	        $(this).val(inputValue.replace(/[^0-9]/g, "")); // 숫자 이외의 문자 제거
	    }
	}
//----------------------------------------------------------------------------------------------------------------
});
</script>
</html>