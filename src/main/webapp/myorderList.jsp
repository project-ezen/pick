<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 구매내역</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
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
		font-family:Arial;
		font-size:12px;
		font-weight:bold;
		padding:8px 18px;
		text-decoration:none;
		float: right;
		margin-bottom:10px; 
	}
	
	.list:hover { background-color:#476e9e; }
	
	.list:active { position:relative; top:1px; }
	
	label { margin-bottom:15px; }
	
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<div class="container">
	<h3 style="text-align: center;">주문 조회</h3>
	<button type="button" class="list" style="margin-bottom: 20px; float: right;">목록으로 돌아가기</button>
	<div id="receipt_info">
	<form>
		<label>구매내역</label>
		<br/>
		<div>
			<input type="text" id="datepicker1" placeholder="날짜를 선택하십시오."/>
			<b>~</b>
			<input type="text" id="datepicker2" placeholder="날짜를 선택하십시오."/>
			<button type="submit">조회</button>
		</div>
	</form>
		<table id="t1">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>상품구매금액</th>
					<th>주문처리상태</th>
					<th>취소/교환/반품</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${orderDTO.order_id}</td>
					<td>${productDisplayVO.product_image}</td>
					<td>${productDisplayVO.product_info}</td>
					<td>${productDTO.product_count}</td>
					<td>${productDisplayVO.product_price}</td>
					<td>{orderDTO.}</td>
					<td>{orderDTO.//}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<hr/>
	<div id="cancel_info">
	<form>
		<label>취소내역</label>
		<br/>
		<div>
			<input type="text" id="datepicker3" placeholder="날짜를 선택하십시오."/>
			<b>~</b>
			<input type="text" id="datepicker4" placeholder="날짜를 선택하십시오."/>
			<button type="submit">조회</button>
		</div>
	</form>
		<table id="t2">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>상품구매금역</th>
					<th>주문처리상태</th>
					<th>취소/교환/반품</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${orderDTO.order_id}</td>
					<td>${productDisplayVO.product_image}</td>
					<td>${productDisplayVO.product_info}</td>
					<td>${productDTO.product_count}</td>
					<td>${productDisplayVO.product_price}</td>
					<td>{orderDTO.}</td>
					<td>{orderDTO.}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<br/><br/>
<script>
$("#datepicker1, #datepicker2, #datepicker3, #datepicker4").datepicker({
	
});

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
<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>