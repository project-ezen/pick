<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세</title>
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
}
.btn_1 {
width: 60px;
height: 30px;
border-radius: 10px;
border: 1px solid #656562;
}
.btn_2 {
width: 80px;
height: 30px;
border-radius: 10px;
border: 1px solid #656562;
}
</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>

<div class="container center">
	<h2 style="text-align: center;">나만의 레시피 상세</h2>
	<br/>
	<div>
		<table>
			<colgroup>
				<col style="width:10%;" /><col style="width:23%;" /><col style="width:10%;" /><col style="width:23%;" />
			</colgroup>
			<tbody>
				<tr>
					<th>글 유형</th>
					<td>나만의 레시피</td>
					
					<th>작성일자</th>
					<td>날짜</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>{닉네임}</td>
					
					<th>찜 개수</th>
					<td>{100}</td>
				</tr>
				<tr>
                	<th scope="row">제목</th>
                	<td colspan="3">title</td>
                </tr>
                <tr>
                    <th scope="row">내용</th>
                    <td colspan="3">content</td>
                </tr>
			</tbody>
		</table>
	</div>
	<br/>
	<!-- 작성자 본인일때 -->
	<div style="text-align: right;">
		<button class="btn_1" type="button" style="display :inline-block; background-color: #D2D87B">수정</button>
		<button class="btn_1" type="button" style="display :inline-block; background-color: #D84D4D; color: #fff;">삭제</button>
	</div>
	<hr/>
	<div style="text-align: right;">
		<button class="btn_2" type="button" style="display :inline-block; background-color: #687AB6; color: #fff;">댓글쓰기</button>
	</div>
	<br/>
	<div>
		<table>
			<colgroup>
				<col style="width:15%;" /><col style="width:75%;"/><col style="width:10%;"/>
			</colgroup>
			<tr>
				<th style="text-align: center;">{작성자 닉네임}</th>
				<td>{댓글 텍스트}</td>
				<td><button class="btn_2" type="button" style="background-color: #8A9BD4; color: #fff;">답댓쓰기</button></td>
			</tr>
		</table>		
	</div>
</div>

<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>