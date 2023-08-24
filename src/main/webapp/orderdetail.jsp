<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세내역</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
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
.tb {
margin-bottom: 20px;
}

#b_list {
width: 110px;
height: 30px;
border-radius: 10px;
border: 1px solid #656562;
margin-bottom: 20px;
float: right;
}
</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
<div class="container">
	<h2 style="text-align: center;">주문상세내역</h2>
	<br/>
	<div class="tb">
		<label>주문정보</label>
		<table>
		<colgroup>
			<col style="width: 30%"/><col style="width: 70%"/>
		</colgroup>
			<tbody>
				<tr>
					<th>주문번호</th>
					<td>{주문번호}</td>
				</tr>
				<tr>
					<th>주문일자</th>
					<td>{주문일자}</td>
				</tr>
				<tr>
					<th>주문자</th>
					<td>{주문자}</td>
				</tr>
				<tr>
					<th>주문처리상태</th>
					<td>{주문처리상태}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tb">
	<label>결제정보</label>
		<table>
		<colgroup>
			<col style="width: 30%"/><col style="width: 70%"/>
		</colgroup>
			<tbody>
				<tr>
					<th>총 주문내역</th>
					<td>{총 주문내역}</td>
				</tr>
				<tr>
					<th>총 결제금액</th>
					<td>{총 결제금액}</td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td>{결제수단}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="tb">
	<label>주문 상품 내역</label>
		<table>
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>상품구매내역</th>
					<th>배송구분</th>
					<th>주문처리상태</th>
					<th>취소/교환/환불</th>
				<tr>
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
	</div>
	<div class="tb">
	<label>배송지 정보</label>
		<table>
		<colgroup>
			<col style="width: 30%"/><col style="width: 70%"/>
		</colgroup>
			<tbody>
				<tr>
					<th>받으시는 분</th>
					<td>{받는 분}</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>{우편번호}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>{주소1}</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>{주소2}</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>{번호}</td>
				</tr>
				<tr>
					<th>배송메시지</th>
					<td>{배송메시지}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<button id="b_list" style="background-color: #5B658D; color: #fff;" type="button" onclick="location.href='#';">주문목록 보기</button>
</div>
<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>