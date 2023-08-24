<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시물</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>
.container {
min-height: 600px;
}
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
border-bottom: 1px solid #ddd;
padding: 10px;
text-align: center;
}
#wrap {
position: relative;

}
#table {
position: absolute;
top: 60px;
}
</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>

<div class="container">
	<h2 style="text-align: center;">내가 쓴 게시물</h2>
	<br/>
	<div id="wrap">
		<table id="table">
			<thead>
				<tr>
					<th>이미지</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>{이미지}</td>
					<td>{제목}</td>
					<td>{작성자(닉네임)}</td>
					<td>{작성일자}</td>
				</tr>
				<tr>
					<td>{이미지}</td>
					<td>{제목}</td>
					<td>{작성자(닉네임)}</td>
					<td>{작성일자}</td>
				</tr>
				<tr>
					<td>{이미지}</td>
					<td>{제목}</td>
					<td>{작성자(닉네임)}</td>
					<td>{작성일자}</td>
				</tr>
				<tr>
					<td>{이미지}</td>
					<td>{제목}</td>
					<td>{작성자(닉네임)}</td>
					<td>{작성일자}</td>
				</tr>
				<tr>
					<td>{이미지}</td>
					<td>{제목}</td>
					<td>{작성자(닉네임)}</td>
					<td>{작성일자}</td>
				</tr>
				<tr>
					<td>{이미지}</td>
					<td>{제목}</td>
					<td>{작성자(닉네임)}</td>
					<td>{작성일자}</td>
				</tr>
				<tr>
					<td>{이미지}</td>
					<td>{제목}</td>
					<td>{작성자(닉네임)}</td>
					<td>{작성일자}</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<button type="button">마이페이지 목록가기</button>
	<div style="width: 200px; height: 30px; background-color: #ddd;
	position: absolute; top: 580px; left: 44%;">
	페이징
	</div>
</div>

<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>