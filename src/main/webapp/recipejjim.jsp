<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JJIM</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
	<div class="container">
		<h1>찜한 게시물</h1>
		<table border="1">
			<tr>
				<th>이미지</th>
				<th>제목</th>
				<th>날짜</th>
				<th>작성자</th>
			</tr>	
			<tr>
				<td>{image}</td>
				<td>{title}</td>
				<td>{sysDate}</td>
				<td>{write}</td>
			</tr>
		</table>
	</div>
	<br/>
	<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>