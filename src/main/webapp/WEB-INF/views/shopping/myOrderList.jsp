<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 구매내역</title>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>
	.container {
		background-color: #fff;
		min-height: 600px;
	}
	table {
		width: 100%;
		border: 2px solid #ddd;
		margin-left: auto;
		margin-right: auto;
	}
	
	th { background-color: #ccd6d9; }
	
	th, td {
	border-bottom: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	border: 1px solid #eee;
	}
	
	label { font-size: 18px; }
	#receipt_info { padding-bottom: 20px; }
	#cancel_info { padding-bottom: 20px; }

	.list {
		margin-bottom: 20px;
		float: right;
		background-color:#8aa2b2;
		border-radius:8px;
		border:none;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family: 'Cafe24Supermagic-Bold-v1.0';
		font-size:12px;
		font-weight:bold;
		padding:8px 18px;
		text-decoration:none;
		float: right;
		margin-bottom:10px; 
	}
	
	.list:hover { background-color:#afb7db; }
	
	.list:active { position:relative; top:1px; }
	
	label { margin-bottom:15px; }
	
	textarea {
		width: 100%;
		height: 200px;
		padding: 10px;
		box-sizing: border-box;
		border: solid 2px #1E90FF;
		border-radius: 5px;
		font-size: 16px;
		resize: none;
	}	
	
	.orderNum {
		cursor:	pointer;
		text-decoration-line: none;
		color: black;
	}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<div class="container">
	<h3 style="text-align: center;">주문 조회</h3>
<!-- ----------------------------------------------------------------------------------------------------------- -->
	<!-- 구매 내역 -->
	<div id="receipt_info">
	<form id="buyList" action="/shopping/myOrderList" method="get">
		<label class="control-label">&nbsp;&nbsp;&nbsp;구매 내역</label>
		<br/>
		<div class="form-group">
			<div class="col-md-3 col-sm-3">
				<input class="form-control" type="text" id="datepicker1" placeholder="날짜를 선택하십시오."/>
			</div>
			<div class="col-md-1 col-sm-1" align="center">
				<b>~</b>
			</div>
			<div class="col-md-3 col-sm-3">
				<input class="form-control" type="text" id="datepicker2" placeholder="날짜를 선택하십시오."/>
			</div>
			<div class="col-md-2 col-sm-2" style="margin-bottom: 10px;">
				<button class="form-control btn btn-default" type="button" id="searchBuy">조회</button>
			</div>
			<div class="col-md-offset-1 col-md-2 col-sm-offset-1 col-sm-2" style="margin-bottom: 10px;">
				<button type="button" onclick="location.href='${path}/member/mypage'" class="list" style="float: right; margin-right: 3px;">마이페이지 목록가기</button>
			</div>
		</div>
	</form>
		<div id="order_list">
		<table id="t1">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>주문금액</th>
					<th>주문처리상태</th>
					<th>취소/교환/반품</th>
				</tr>
			</thead>
			<tbody id="order_product_list">
				<!-- 주문된 상품이 들어갈 장소 -->
			</tbody>
		</table>
		</div>
		<br>
		<!-- 화면 하단의 페이지 영역 -->
		<div align="center">
			<ul class="btn-group pagination">
				<c:if test="${orderPage.prev }">
					<li><a class="orderPaging" data-page="${orderPage.startPage - 1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
				</c:if>
				<c:forEach begin="${orderPage.startPage }" end="${orderPage.endPage }" step="1" var="pageNum">
					<li><a class="orderPaging" data-page="${pageNum }"><i>${pageNum }</i></a></li>
				</c:forEach>
				<c:if test="${orderPage.next }">
					<li><a class="orderPaging" data-page="${orderPage.endPage + 1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<hr/>
	
<!-- ----------------------------------------------------------------------------------------------------------- -->
	<!-- 취소 내역 -->
	<div id="cancel_info">
	<form id="cancelList" action="/shopping/myOrderList" method="get">
		<label class="control-label">&nbsp;&nbsp;&nbsp;취소/반품 내역</label>
		<br/>
		<div class="form-group">
			<div class="col-md-3 col-sm-3">
				<input class="form-control" type="text" id="datepicker3" placeholder="날짜를 선택하십시오."/>
			</div>
			<div class="col-md-1" align="center">
				<b>~</b>
			</div>
			<div class="col-md-3 col-sm-3">
				<input class="form-control" type="text" id="datepicker4" placeholder="날짜를 선택하십시오."/>
			</div>
			<div class="col-md-2 col-sm-2" style="margin-bottom: 10px;">
				<button class="form-control btn btn-default" type="submit" id="searchCancel">조회</button>
			</div>
		</div>
	</form>
	<div>
		<table id="t2">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>주문금액</th>
					<th>취소/반품처리상태</th>
				</tr>
			</thead>
			<tbody id="cancel_product_list">
				<!-- 취소된 상품이 들어갈 장소 -->
			</tbody>
		</table>
	</div>
	<br>
	<!-- 화면 하단의 페이지 영역 -->
	<div align="center">
		<ul class="btn-group pagination">
			<c:if test="${cancelPage.prev }">
				<li><a class="cancelPaging" data-page="${cancelPage.startPage - 1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
			</c:if>
			<c:forEach begin="${cancelPage.startPage }" end="${cancelPage.endPage }" step="1" var="pageNum">
				<li><a class="cancelPaging" data-page="${pageNum }"><i>${pageNum }</i></a></li>
			</c:forEach>
			<c:if test="${cancelPage.next }">
				<li><a class="cancelPaging" data-page="${cancelPage.endPage + 1}"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
			</c:if>
		</ul>
	</div>
	</div>
	
<!-- ----------------------------------------------------------------------------------------------------------- -->
</div>
<br/><br/>
<script>
$(document).ready(function() {
	// 주문 내역 페이징
	function orderPaging(pageNum) {
		$.ajax({
			url: "/shopping/paging",
			type: "get",
			dataType: "json",
			data: {"page" : pageNum, "start_date" : $("#datepicker1").val(), "end_date" : $("#datepicker2").val(), "relation" : "order"},
			success: function(data) {
				//console.log("success : " + data);
				console.log(data.order);
				console.log(data.product);
				
				// 페이지를 누를때 기존 내용으 지우고 새 페이지의 내용을 채움
				$("#order_product_list").empty();
				
				var orderedHTML = '';
				for(let idx = 0; idx < data.order.length; idx++){
					orderedHTML = '<tr>'
								+ '<td><a class="orderNum">' + data.order[idx].order_number + '</a></td>'
								+ '<td><div class="col-md-12 text-center" id="item_thumbnail">'
								+ '<a href="#" class="thumbnail">'
								+ '<input type="image" src="${path }/imgdownload?imageFile=' + data.product[idx].product_image + '" width="161" height="133" disabled>'
								+ '<input type="hidden" class="orderId" name="orderId" value="' + data.order[idx].order_id + '">'
								+ '</a></div></td>'
								+ '<td class="pdtName">' + data.product[idx].product_name + '</td>'
								+ '<td class="pdtCount">' + data.order[idx].count + '</td>'
								+ '<td class="orderPrice">' + data.product[idx].product_price * data.order[idx].count + '</td>'
								+ '<td class="orderStatus">' + data.order[idx].order_status + '</td>';
					// 배송중
					if(data.order[idx].order_status == 'delivery-progressing'){
						orderedHTML += '<td>'
									+ '<input type="button" class="btn btn-default cancel" data-toggle="modal" data-target=".cancel' + idx + '" value="취소">'
									+ '<div class="modal fade cancel' + idx + '">'
									+ '<div class="modal-dialog">'
									+ '<div class="modal-content">'
									+ '<div class="modal-header text-center">'
									+ '<button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>'
									+ '<h3 class="title">Cancel Progressing</h3>'
									+ '</div>'
									+ '<div class="modal-body"><textarea class="cancel_reason" name="cancel_reason" placeholder="please write the reason"></textarea></div>'
									+ '<div class="modal-footer">'
									+ '<input type="button" class="btn btn-primary cancel_order" data-dismiss="modal" value="확인">'
									+ '</div></div></div></div>'
					}
					// 배송 완료
					else if(data.order[idx].order_status == 'delivery-successed'){
						orderedHTML += '<td>'
									+ '<input type="button" class="btn btn-default change" data-toggle="modal" data-target=".change' + idx + '" value="교환">'
									+ '<input type="button" class="btn btn-default refund" data-toggle="modal" data-target=".refund' + idx + '" value="반품">'
									+ '<div class="modal fade change' + idx + '">'
									+ '<div class="modal-dialog">'
									+ '<div class="modal-content">'
									+ '<div class="modal-header text-center">'
									+ '<button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>'
									+ '<h3 class="title">Change Progressing</h3>'
									+ '</div>'
									+ '<div class="modal-body"><textarea class="change_reason" name="change_reason" placeholder="please write the reason"></textarea></div>'
									+ '<div class="modal-footer">'
									+ '<input type="button" class="btn btn-primary change_order" data-dismiss="modal" value="확인">'
									+ '</div></div></div></div>'
									+ '<div class="modal fade refund' + idx + '">'
									+ '<div class="modal-dialog">'
									+ '<div class="modal-content">'
									+ '<div class="modal-header text-center">'
									+ '<button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>'
									+ '<h3 class="title">Refund Progressing</h3>'
									+ '</div>'
									+ '<div class="modal-body"><textarea class="refund_reason" name="refund_reason" placeholder="please write the reason"></textarea></div>'
									+ '<div class="modal-footer">'
									+ '<input type="button" class="btn btn-primary refund_order" data-dismiss="modal" value="확인">'
									+ '</div></div></div></div>'
					}
					orderedHTML += '</td></tr>';
					
					$("#order_product_list").append(orderedHTML);
				}
			},
			error: function(data) {
				console.log("error : " + data);
			}
		});
	}
	orderPaging(${orderPage.cri.page});
	
	// paging 버튼 클릭할 때마다 data-page에 지정된 값으로 페이지 넘기기
	$(".orderPaging").on("click", function() {
		var pageNum = $(this).data("page");
		orderPaging(pageNum);
	});
	
	// 조회 버튼을 클릭했을 경우
	$("#searchBuy").on("click", function() {
		var pageNum = 1;
		orderPaging(pageNum);
	});
//-----------------------------------------------------------------------------------------------------------------------------------
	// 취소 / 반품 내역 페이징
	function cancelPaging(pageNum) {
		$.ajax({
			url: "/shopping/paging",
			type: "get",
			dataType: "json",
			data: {"page" : pageNum, "start_date" : $("#datepicker3").val(), "end_date" : $("#datepicker4").val(), "relation" : "cancel"},
			success: function(data) {
				//console.log("success : " + data);
				console.log(data.cancel);
				console.log(data.product);
				
				// 페이지를 누를때 기존 내용으 지우고 새 페이지의 내용을 채움
				$("#cancel_product_list").empty();
				
				var orderedHTML = '';
				for(let idx = 0; idx < data.cancel.length; idx++){
					orderedHTML = '<tr>'
								+ '<td><a class="orderNum">' + data.cancel[idx].order_number + '</a></td>'
								+ '<td><div class="col-md-12 text-center" id="item_thumbnail">'
								+ '<a href="#" class="thumbnail">'
								+ '<input type="image" src="${path }/imgdownload?imageFile=' + data.product[idx].product_image + '" width="161" height="133" disabled>'
								+ '<input type="hidden" name="orderId" value="' + data.cancel[idx].order_id + '">'
								+ '</a></div></td>'
								+ '<td>' + data.product[idx].product_name + '</td>'
								+ '<td>' + data.cancel[idx].count + '</td>'
								+ '<td>' + data.product[idx].product_price * data.cancel[idx].count + '</td>'
								+ '<td>' + data.cancel[idx].order_status + '</td>'
								+ '</tr>';
					
					$("#cancel_product_list").append(orderedHTML);
				}
			},
			error: function(data) {
				console.log("error : " + data);
			}
		});
	}
	cancelPaging(${cancelPage.cri.page});
	
	// paging 버튼 클릭할 때마다 data-page에 지정된 값으로 페이지 넘기기
	$(".cancelPaging").on("click", function() {
		var pageNum = $(this).data("page");
		cancelPaging(pageNum);
	});
	
	// 조회 버튼을 클릭했을 경우
	$("#searchCancel").on("click", function() {
		var pageNum = 1;
		cancelPaging(pageNum);
	});
//-----------------------------------------------------------------------------------------------------------------------------------
	// 주문 완료하기
	$(document).on("click", ".orderStatus" ,function() {
		let order_status = $(this).text();
		let order_id = $(this).closest("tr").find(".orderId").val();
		
		console.log(order_status + ", " + order_id);
		
		$.ajax({
			url: "/shopping/orderComplete",
			type: "get",
			dataType: "text",
			data: {"id": order_id},
			success: function(data) {
				console.log("succeed");
				document.location.reload();
			},
			error: function(data) {
				console.log("error");
			}
		});
	});
//-----------------------------------------------------------------------------------------------------------------------------------
	// 주문 취소하기
	$(document).on("click", ".cancel_order", function() {
		let order_id = $(this).closest("tr").find(".orderId").val();
		let cancel_reason = $(this).closest("tr").find(".cancel_reason").val();
		let title = $(this).closest("tr").find(".title").text();
		
		console.log(order_id + " " + cancel_reason + " " + title);
		
		$.ajax({
			url: "/shopping/reason",
			type: "post",
			dataType: "text",
			data: {"id": order_id, "reason": cancel_reason, "title": title},
			success: function(){
				console.log("succeed");
				document.location.reload();
			},
			error: function() {
				console.log("error");
			}
		});
	});
//-----------------------------------------------------------------------------------------------------------------------------------	
	// 상품 환불하기
	$(document).on("click", ".refund_order", function() {
		let order_id = $(this).closest("tr").find(".orderId").val();
		let refund_reason = $(this).closest("tr").find(".refund_reason").val();
		let title = $(this).closest("tr").find(".title").text();
		
		console.log(order_id + " " + refund_reason + " " + title);
		
		$.ajax({
			url: "/shopping/reason",
			type: "post",
			dataType: "text",
			data: {"id": order_id, "reason": refund_reason, "title": title},
			success: function(){
				console.log("succeed");
				document.location.reload();
			},
			error: function() {
				console.log("error");
			}
		});
	});
//-----------------------------------------------------------------------------------------------------------------------------------
	// 상품 교환하기
	$(document).on("click", ".change_order", function() {
		let order_id = $(this).closest("tr").find(".orderId").val();
		let change_reason = $(this).closest("tr").find(".change_reason").val();
		let title = $(this).closest("tr").find(".title").text();
		
		console.log(order_id + " " + change_reason + " " + title);
		
		$.ajax({
			url: "/shopping/reason",
			type: "post",
			dataType: "text",
			data: {"id": order_id, "reason": change_reason, "title": title},
			success: function(){
				console.log("succeed");
				document.location.reload();
			},
			error: function() {
				console.log("error");
			}
		});
	});
//-----------------------------------------------------------------------------------------------------------------------------------
	// 주문 번호에 해당하는 주문 상세보기
	$(document).on("click", ".orderNum", function() {
		location.href = "/shopping/myOrderListDetail?order_number=" + $(this).text();
	});
});
//===================================================================================================================
// 날짜 조회
$("#datepicker1, #datepicker2, #datepicker3, #datepicker4").datepicker();

$.datepicker.setDefaults({
	minDate:		"-3y",				// 3년전 날짜까지 보여준다.
	yearRange:		'c-3:c+0',		// 리스트 박스에서 보여줄 범위
	showOn:			"both",				// 버튼과 텍스트 필드 모두 캘린더를 보여준다.
	buttonImage: 	"/images/calendar2.png",
	buttonImageOnly: true,
	changeYear:		true,				// 년도를 바꿀 수 있는 셀렉트 박스를 표시한다.
	changeMonth:	true,				// 월을 바꿀 수 있는 셀렉트 박스를 표시한다.
	dateFormat:		"yy년 mm월 dd일",	// 날짜 포맷
	prevText:		'이전 달',			// 마우스 오버시 이전 달이라는 텍스트 풍선도움말을 보여준다.
	nextText:		'다음 달',			// 마우스 오버시 다음 달이라는 텍스트 풍선도움말을 보여준다.
	closeText:		'닫기',				// 닫기 버튼 텍스트 변경
	currentText:	'오늘',				// 오늘 버튼 텍스트 변경
										// 월을 한글로 표시한다.
	monthNames:		['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	monthNamesShort:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
										// 주를 한글로 표시한다.
	dayNames:		['일', '월', '화', '수', '목', '금', '토'],
	dayNamesShort:	['일', '월', '화', '수', '목', '금', '토'],
	dayNamesMin:	['일', '월', '화', '수', '목', '금', '토'],
	showMonthAfterYear:	true,			// true : 년 월, falst : 월 년
	yearSuffix:		'년',				// 년도 셀렉트 박스 다음에 '년'이란 글자를 보여준다.
	showButtonPanel:	true			// 오늘로 가는 버튼과 달력 닫기 버튼 보기 옵션
});
</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>