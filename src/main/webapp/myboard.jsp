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
		background-color: #fff;
		min-height: 600px;
	}
	table {
		width: 100%;
		border: 2px solid #ddd;
		margin-left: auto;
		margin-right: auto;
	}
	th { background-color: #99A1D7; }
	th, td {
		border-bottom: 1px solid #ddd;
		padding: 10px;
		text-align: center;
		border: 1px solid #eee;
	}
	#wrap {
		position: relative;
	
	}
	#table {
		position: absolute;
		top: 50px;
	}

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
	
	.list:hover { background-color:#afb7db; }
	
	.list:active { position:relative; top:1px; }

</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>

<div class="container">
	<h2 style="text-align: center;">내가 쓴 게시물</h2>
	<br/>
	<button type="button"  class="list" style="float: right; margin-right: 3px;">마이페이지 목록가기</button>
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
					<td>{boardDTO.image}</td>
					<td>{boardDTO.title}</td>
					<td>{m.id}</td>
					<td>{boardDTO.writeDate}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="width: 200px; height: 30px; background-color: #ddd; position: absolute; top: 580px; left: 44%;"> 페이징 </div>
</div>
<br/><br/>
<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>