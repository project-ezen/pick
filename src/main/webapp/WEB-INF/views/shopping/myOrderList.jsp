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
		float: right;
		background-color:#8aa2b2;
		border-radius:8px;
		border:none;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:12px;
		font-weight:bold;
		padding:8px 18px;
		text-decoration:none;
		float: right; 
	}
	
	.list:hover { background-color:#476e9e; }
	
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
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<div class="container">
	<h3 style="text-align: center;">주문 조회</h3>
	<button type="button" class="list" style="float: right;">목록으로 돌아가기</button>
<!-- ----------------------------------------------------------------------------------------------------------- -->
	<!-- 구매 내역 -->
	<div id="receipt_info">
	<form>
		<label class="control-label">&nbsp;&nbsp;&nbsp;구매 내역</label>
		<br/>
		<div class="form-group">
			<div class="col-md-4 col-sm-4">
				<input class="form-control" type="text" id="datepicker1" placeholder="날짜를 선택하십시오."/>
			</div>
			<div class="col-md-1 col-sm-1" align="center">
				<b>~</b>
			</div>
			<div class="col-md-4 col-sm-4">
				<input class="form-control" type="text" id="datepicker2" placeholder="날짜를 선택하십시오."/>
			</div>
			<div class="col-md-2 col-sm-2" style="margin-bottom: 10px;">
				<button class="form-control btn btn-default" type="submit">조회</button>
			</div>
		</div>
	</form>
		<form>
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
			<c:forEach var="order" items="${order }" varStatus="o_status">
			<c:if test="${order.order_complaint == null }">
				<tbody>
					<tr>
						<td class="orderNum">
							${order.order_number}
						</td>
						<td>
							<div class="col-md-12 text-center" id="item_thumbnail">
							    <a href="#" class="thumbnail">
							        <input type="image" src="${path }/download?imageFile=${product[o_status.index].product_image }" width="161" height="133" disabled>
							        <input type="hidden" class="pdtImage" value="${product[o_status.index].product_image }" name="imageFile">
							        <input type="hidden" class="orderId" value="${order.order_id }">
							    </a>
							</div>
						</td>
						<td class="pdtName">${product[o_status.index].product_name }</td>
						<td class="pdtCount">${order.count}</td>
						<td class="orderPrice">${order.final_price}</td>
						<td class="orderStatus">${order.order_status}</td>
						<td>
							<c:if test="${order.order_status == 'delivery-progressing'}">
								<input type="button" class="btn btn-default cn" data-toggle="modal" data-target="#cancel" value="취소">
							</c:if>
							<c:if test="${order.order_status == 'delivery-successed'}">
								<input type="button" class="btn btn-default cg" data-toggle="modal" data-target="#change" value="교환">
								<input type="button" class="btn btn-default rf" data-toggle="modal" data-target="#refund" value="반품">
							</c:if>
						</td>
					</tr>
				</tbody>
			</c:if>
			</c:forEach>
		</table>
		
		<div class="modal fade" id="cancel">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header text-center">
						<button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>
						<input type="hidden" id="clicked_order_id">
						<h3>Cancel Progressing</h3>
					</div>
					<div class="modal-body">
						<textarea placeholder="please write the reason"></textarea>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-primary" id="cancel_order" data-dismiss="modal" value="확인">
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<hr/>
	
<!-- ----------------------------------------------------------------------------------------------------------- -->
	<!-- 취소 내역 -->
	<div id="cancel_info">
	<form>
		<label class="control-label">&nbsp;&nbsp;&nbsp;취소/반품 내역</label>
		<br/>
		<div class="form-group">
			<div class="col-md-4">
				<input class="form-control" type="text" id="datepicker3" placeholder="날짜를 선택하십시오."/>
			</div>
			<div class="col-md-1" align="center">
				<b>~</b>
			</div>
			<div class="col-md-4">
				<input class="form-control" type="text" id="datepicker4" placeholder="날짜를 선택하십시오."/>
			</div>
			<div class="col-md-2" style="margin-bottom: 10px;">
				<button class="form-control btn btn-default" type="submit">조회</button>
			</div>
		</div>
	</form>
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
			<c:forEach var="order" items="${order }" varStatus="o_status">
			<c:if test="${order.order_complaint != null }">
				<tbody>
					<tr>
						<td class="orderNum">
							${order.order_number}
						</td>
						<td>
							<div class="col-md-12 text-center" id="item_thumbnail">
							    <a href="#" class="thumbnail">
							        <input type="image" src="${path }/download?imageFile=${product[o_status.index].product_image }" width="161" height="133" disabled>
							        <input type="hidden" class="pdtImage" value="${product[o_status.index].product_image }" name="imageFile">
							        <input type="hidden" class="orderId" value="${order.order_id }">
							    </a>
							</div>
						</td>
						<td class="pdtName">${product[o_status.index].product_name }</td>
						<td class="pdtCount">${order.count}</td>
						<td class="orderPrice">${order.final_price}</td>
						<td class="orderStatus">${order.order_status}</td>
					</tr>
				</tbody>
			</c:if>
			</c:forEach>
		</table>
	</div>
<!-- ----------------------------------------------------------------------------------------------------------- -->
</div>
<br/><br/>
<script>
$(document).ready(function() {
	$(".cn, .cg, .rf").each(function(idx) {
		$(".cn:eq[" + idx + "]").on("click", function() {
			$("#clicked_order_id").prop("value", $("orderId[" + idx + "]"));
		});
	});
	
	$("#cancel_order").on("click", function() {
		$ajax{(
				
		)};
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