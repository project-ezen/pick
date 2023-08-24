<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Timestamp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매/환불 내역</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
table {
width: 100%;
border: 2px solid #ddd;
margin-left: auto;
margin-right: auto;
}
th {
background-color: #99A1D7;
}
th, td {
text-align: center;
border-bottom: 1px solid #ddd;
padding: 10px;
}
label {
font-size: 18px;
}
.tbs {
min-height: 300px;
}

#b_list {
width: 140px;
height: 30px;
border-radius: 10px;
border: 1px solid #656562;
margin-bottom: 20px;
float: right;
}
input {
margin-left: 0px;
}
.cbtn {
width: 45px;
height: 30px;
}

</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
<div class="container">
<h2 style="text-align: center;">나의 구매/환불내역</h2>
<br/><br/>
	<div class="tbs">
		<form class="form-horizontal">
		<label>구매내역</label>
			<div class="form-group" style="margin-left: 3px;">
				<input type="text" id="datepicker1" placeholder="날짜를 선택하십시오."/>
				<b>~</b>
				<input type="text" id="datepicker2" placeholder="날짜를 선택하십시오."/>
				<button class="cbtn" type="button">조회</button>
			</div>
		</form>
		<table>
			<tr>
				<th>주문일자(주문번호)</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상품구매내역</th>
				<th>주문처리상태</th>
				<th>취소/교환/환불</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	
	<div class="tbs" style="margin-bottom: 50px;">
		<form class="form-horizontal">
		<label>취소/환불내역</label>
			<div class="form-group" style="margin-left: 3px;">
				<input type="text" id="datepicker3" placeholder="날짜를 선택하십시오."/>
				<b>~</b>
				<input type="text" id="datepicker4" placeholder="날짜를 선택하십시오."/>
				<button class="cbtn" type="button">조회</button>
			</div>
		</form>
		<table>
			<tr>
				<th>주문일자(주문번호)</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>상품구매내역</th>
				<th>주문처리상태</th>
				<th>취소/교환/환불</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<button id="b_list" style="background-color: #5B658D; color: #fff;" type="button" onclick="location.href='#';">목록으로 돌아가기</button>
</div>
<%@ include file="./WEB-INF/views/include/footer.jsp" %>
<script>
$(function() {
	$("#datepicker1, #datepicker2").datepicker({
		
	});
});

$(function() {
	$("#datepicker3, #datepicker4").datepicker({
		
	});
});

$.datepicker.setDefaults({
	minDate:		"-100y",			// 100년전 날짜까지 보여준다.
	yearRange:		'c-100:c+10',		// 리스트 박스에서 보여줄 범위
	showOn:			"both",				// 버튼과 텍스트 필드 모두 캘린더를 보여준다.
	buttonImage: "./resources/images/calendar2.png",
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
</body>
</html>