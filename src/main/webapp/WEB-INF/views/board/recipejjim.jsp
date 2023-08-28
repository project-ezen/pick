<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JJIM</title>
<%@ include file="../include/header.jsp" %>
<style>
	
	table {
	    width: 100%;
	    border: 2px solid #ddd;
  	}
  	
  	th {
  		background-color: #8aa2b2;
  		position: sticky; 
  		top: 0; 
  		height: 20px;
  	}
  	
  	th, td {
	    border-bottom: 1px solid #444444;
	    border: 1px solid #ddd;
	    padding: 10px;
	    text-align: center;
  	}
	
	table th:first-child, table td:first-child { border-left: 0; }
	
	table th:last-child, table td:last-child { border-right: 0; }
	
	.img 	{ width: 20%; height:100px;}
	.title 	{ width: 50%; height:100px; }
	.date	{ width: 10%; height:100px; }
	.write	{ width: 20%; height:100px; }

	.list {
		background-color:#8aa2b2;
		border-radius:8px;
		border:none;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:10px;
		font-weight:bold;
		padding:9px 26px;
		text-decoration:none;
		float: right;
		margin-bottom:10px; 
	}
	
	.list:hover { background-color:#afb7db; }
	
	.list:active { position:relative; top:1px; }
   
</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
	<div class="container">
		<h1 align="center">찜한 게시물</h1>
		<hr>
		<button class="list" type="button" onclick="fn_list()">목록으로 돌아가기</button>
		<br>
		<table>
			<tr>
				<th>이미지</th>
				<th>제목</th>
				<th>날짜</th>
				<th>작성자</th>
			</tr>	
			<tr>
				<td class="img">{image}</td>
				<td class="title">{title}</td>
				<td class="date">{sysDate}</td>
				<td class="write">{write}</td>
			</tr>
			<tr>
				<td class="img">{image}</td>
				<td class="title">{title}</td>
				<td class="date">{sysDate}</td>
				<td class="write">{write}</td>
			</tr>
			<tr>
				<td class="img">{image}</td>
				<td class="title">{title}</td>
				<td class="date">{sysDate}</td>
				<td class="write">{write}</td>
			</tr>
			<tr>
				<td class="img">{image}</td>
				<td class="title">{title}</td>
				<td class="date">{sysDate}</td>
				<td class="write">{write}</td>
			</tr>
			<tr>
				<td class="img">{image}</td>
				<td class="title">{title}</td>
				<td class="date">{sysDate}</td>
				<td class="write">{write}</td>
			</tr>
			<tr>
				<td class="img">{image}</td>
				<td class="title">{title}</td>
				<td class="date">{sysDate}</td>
				<td class="write">{write}</td>
			</tr>
			<tr>
				<td class="img">{image}</td>
				<td class="title">{title}</td>
				<td class="date">{sysDate}</td>
				<td class="write">{write}</td>
			</tr>
			<tr>
				<td class="img">{image}</td>
				<td class="title">{title}</td>
				<td class="date">{sysDate}</td>
				<td class="write">{write}</td>
			</tr>
		</table>
	</div>
	<br/><br/>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>