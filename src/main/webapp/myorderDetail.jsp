<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세내역</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>

table {
width: 100%;
border: 2px solid #ddd;
margin-left: auto;
margin-right: auto;
margin-bottom: 20px;
}

th { background-color: #99A1D7; }

th, td {
border-bottom: 1px solid #ddd;
padding: 10px;
text-align: center;
border: 1px solid #eee;
}

label { font-size: 18px; }

.relist {
margin-bottom: 20px;
float: right;
width: 160px;
height: 30px;
}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<div class="container">
	<h3 style="text-align: center;">주문상세내역</h3>
	<label>주문정보</label>
		<table id="t1">
		<colgroup>
			<col width="30%"/><col width="70%"/>
		</colgroup>
			<tbody>
				<tr>
					<th>주문번호</th>
					<td></td>
				</tr>
				<tr>
					<th>주문일자</th>
					<td></td>
				</tr>
				<tr>
					<th>주문자</th>
					<td></td>
				</tr>
				<tr>
					<th>주문처리상태</th>
					<td></td>
				</tr>
			</tbody>
		</table>
	<label>결제정보</label>
		<table id="t2">
		<colgroup>
			<col width="30%"/><col width="70%"/>
		</colgroup>
			<tbody>
				<tr>
					<th>총 주문내역</th>
					<td></td>
				</tr>
				<tr>
					<th>총 결제금액</th>
					<td></td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td></td>
				</tr>
			</tbody>
		</table>
	<label>주문 상품 내역</label>
		<table id="t3">
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>상품구매내역</th>
					<th>배송구분</th>
					<th>주문처리상태</th>
					<th>취소/교환/환불</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	<label>배송지 정보</label>
		<table id="t4">
		<colgroup>
			<col width="30%"/><col width="70%"/>
		</colgroup>
			<tbody>
				<tr>
					<th>받으시는 분</th>
					<td></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td></td>
				</tr>
				<tr>
					<th>주소</th>
					<td></td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td></td>
				</tr>
				<tr>
					<th>배송메시지</th>
					<td></td>
				</tr>
			</tbody>
		</table>
		<button type="button" class="relist">주문목록으로 돌아가기</button>
	</div>
<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>