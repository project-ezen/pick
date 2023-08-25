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
									    	<input class="form-control text-center" style="font-size: 18px;" value="담은 상품이 존재하지 않습니다." disabled>
								    	</div>
									</td>
								</tr>
							</c:when>
							<%-- 장바구니에 상품이 있는 경우 --%>
							<c:when test="${cart != null }">
								<c:forEach var="products_item" items="${product }" varStatus="productNum">
									<tr>
									    <td class="form-group" style="vertical-align: middle;">
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
											        <input type="image" src="${path }/download?imageFile=${products_item.product_image }" width="161" height="133" id="imageFile" name="imageFile" disabled>
											    </a>
											</div>
										</td>
										<td class="form-group" style="vertical-align: middle;">
										    <input class="form-control text-center productName" type="text" id="productName" name="productName" value="${products_item.product_name }" disabled>
										</td>
										<td class="form-inline" style="vertical-align: middle;">
										    <div class="form-group">
										        <button type="button" class="btn btn-default minus"><span class="glyphicon glyphicon-minus"></span></button>
										        <input class="form-control text-center cnt" width="30px" type="text" name="cnt" value="1">
										        <button type="button" class="btn btn-default plus"><span class="glyphicon glyphicon-plus"></span></button>
										    </div>
										</td>
										<td class="form-group" style="vertical-align: middle;">
											<input class="form-control text-center productPrice" type="text" id="productPrice" name="productPrice" disabled>
											<input class="pdtPrice" type="hidden" value="${products_item.product_price }">
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
			    <form>
			    	<div class="row">
				    	<div class="col-md-offset-8 col-md-4">
					        <table class="table table-bordered" style="border: 0;">
					            <tr align="center">
					                <th class="text-center">전체 금액</th>
					            </tr>
					            <tr class="action">
					            	<td class="form-group">
					                    <input class="form-control text-center" type="text" id="totalPrice" name="totalPrice" disabled>
					                </td>
					            </tr>
					        </table>
				       	</div>
				    </div>
				    <div class="row">
				    	<div class="col-md-offset-8 col-md-4 text-right">
				            <button type="button" id="pay" name="pay" class="btn btn-primary" onclick="fnc_order()">결제하기</button>
				        </div>
				    </div>
			            <!--<c:choose>
			            	<c:when test="${cart == null}">
			            		<tr class="action">
					                <td class="form-group">
					                    <input class="form-control text-center" type="text" id="holePrice" name="holePrice" value="0" disabled>
					                </td>
					                <td class="form-group">
					                    <input class="form-control text-center" type="text" id="deliveryFee" name="deliveryFee" value="0" disabled>
					                </td>
					                <td class="form-group">
					                    <input class="form-control text-center" type="text" id="totalPrice" name="totalPrice" value="0" disabled>
					                </td>
					            </tr>
			            	</c:when>
			            	<c:when test="${cart != null }">
			            		<tr class="action">
					                <td class="form-group">
					                    <input class="form-control text-center" type="text" id="holePrice" name="holePrice" value="0" disabled>
					                </td>
					                <td class="form-group">
					                    <input class="form-control text-center" type="text" id="deliveryFee" name="deliveryFee" value="3000" disabled>
					                </td>
					                <td class="form-group">
					                    <input class="form-control text-center" type="text" id="totalPrice" name="totalPrice" disabled>
					                </td>
					            </tr>
			            	</c:when>
			            </c:choose>-->
			    </form>
			</section>
		</div>
	<!-- 결재 금액 확인하기 끝 -->
	<br/><br/><br/><br/>
	</div>
	<br/>
	<div class="row">
		<%@ include file="../include/footer.jsp" %>
	</div>
</body>
<script>
let count = document.getElementsByClassName("cnt");
let price = document.getElementsByClassName("pdtPrice");
let fiprice = document.getElementsByClassName("productPrice");

let totalprice = document.getElementById("totalPrice");

for(var i = 0; i < price.length; i++){
	fiprice[i].value = price[i].value * count[i].value;
}

// Final Price
var t = 0;
for(var i = 0; i < fiprice.length; i++){
	t += parseInt(fiprice[i].value);
}
totalprice.value = t;
</script>

<script>
$(document).ready(function() {
	let sum = 0;
	
	$(".minus, .plus, .cnt, .pdtPrice, .productPrice").each(function(idx) {
		let count = $(".cnt:eq(" + idx + ")");
		let origin_price = $(".pdtPrice:eq(" + idx + ")");
		let price = $(".productPrice:eq(" + idx + ")");
		let total_price = $("#totalPrice");
		
		// -, + 버튼 클릭시 수량 숫자 변경
		$(".plus:eq(" + idx + ")").on("click", function() {
//			var count = $(".cnt:eq(" + idx + ")");
//			var origin_price = $(".pdtPrice:eq(" + idx + ")");
//			var price = $(".productPrice:eq(" + idx + ")");
			
			count.prop("value", parseInt(count.val()) + 1);
			price.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
			
			// total_price 갱신
			sum = 0;
			
			for(var i = 0; i < $(".productName").length; i++) {
				sum += parseInt($(".productPrice:eq(" + i + ")").val());
			}
			total_price.prop("value", sum);
			
//			console.log(count.val());
//			console.log(origin_price.val());
//			console.log(price.val());
		});
		$(".minus:eq(" + idx + ")").on("click", function() {
			count.prop("value", parseInt(count.val()) - 1);
			if(parseInt(count.val()) > 0){
				price.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
			}
			
			// total_price 갱신
			sum = 0;
			
			for(var i = 0; i < $(".productName").length; i++) {
				sum += parseInt($(".productPrice:eq(" + i + ")").val());
			}
			total_price.prop("value", sum);
			
			// 수량이 1보다 작으면 default 값은 1
			if(parseInt(count.val()) < 1) {
				count.prop("value", 1);
				price.val(origin_price.val());
			}
		});
		
		// 숫자를 직접 입력했을 경우 제품 가격
		count.on("input", function() {
			price.prop("value", parseInt(count.val()) * parseInt(origin_price.val()));
			
			// total_price 갱신
			sum = 0;
			
			for(var i = 0; i < $(".productName").length; i++) {
				sum += parseInt($(".productPrice:eq(" + i + ")").val());
			}
			total_price.prop("value", sum);
		});
	});
	
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
	
	// 합계 구하는 ajax
/*	$(".cnt").on("input", pdtList);
	function pdtList() {
		$.ajax({
			url: "/shopping/calculate",
			type: "get",
			dataType: "json",
			data: {"product_name": $(".productName").val()},
			success: function(data) {
				var price = data;
				
				// alert(price);
				
				document.getElementsByClassName("productPrice")[0].value = 
					document.getElementsByClassName("cnt")[0].value * price;
				
//				for(var value of $(".productPrice").val()) {
//					$("#holePrice").prop("value", parseInt($("#holePrice").val()) + value);
//				}

//				for(let i = 0; i < $(".productPrice").length; i++) {
//					$("#holePrice").prop("value", parseInt($("#holePrice").val()) + value);
//				}
			},
			error: function(data) {
				alert("error : " + data);
			}
		});
	}*/
});

// 주문하는 창으로 연결
function fnc_order() {
	location.href="/shopping/order";
}
</script>
</html>