<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JJIM</title>
<%@ include file="../include/header.jsp" %>
<style>
	
	.container { background-color: #fff; min-height: 1000px; }
	
	.foot { padding-bottom: 150px; padding-top: 150px; margin:auto; }
	
	
	table {
	    width: 100%;
	    border: 2px solid #ddd;
  	}
  	
  	th {
  		background-color: #ccd6d9;
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
		margin-bottom: 20px;
		float: right;
		background-color:#8aa2b2;
		border-radius:8px;
		border:none;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family: 'Cafe24Supermagic-Bold-v1.0';
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
<%@ include file="../include/topMenu.jsp" %>
<div class="foot">
	<div class="container">
		<h1 align="center">좋아요♥</h1>
		<hr>
		<button type="button" onclick="location.href='${path}/member/mypage'" class="list" style="float: right; margin-right: 3px;">마이페이지 목록가기</button><br>
		<h3>나만의 레시피 즐겨찾기</h3>
		<table>
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>

			</tr>	
			<%int cnt=1; %>
			<%-- <c:forEach items="${}" var="">  --%>
			<tr>
				<td><%=cnt++ %></td>
				<td><img style="height:100px; width:100px;" src="${path }/resources/images/thumb/t_${dto.thumbnail}" alt="사진"></td>
				<td style="width:45%;"><a href="${path}/board/recipedetail?board_id=${dto.board_id}">${dto.title}</a></td>
				<td style="width:15%;">${dto.writer}</td>
				<td style="width:15%;">${dto.writeDate}</td>
			</tr>
			<%-- </c:forEach> --%>
		</table>
		<hr/>
		<h3>레시피 즐겨찾기</h3>
		<table>
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>도수</th>
				<th>맛</th>
			</tr>	
			<%int cn=1; %>
			<c:forEach items="${sole.recipe_code == like.recipe_code }">
			<tr>
				<td><%=cn++ %></td>
				<td><img style="height:100px; width:100px;" src="${path }/resources/images/thumb/t_${dto.thumbnail}" alt="사진"></td>
				<td style="width:45%;"><a href="/sole/soleDetail?recipe_code=${sole.recipe_code}&page=0">${sole.alcohole_name}</a></td>
				<td style="width:15%;">${recipe.alcohole_dosu}</td>
				<td style="width:15%;">${recipe.favor}</td>
			</tr>
			</c:forEach>
		</table>
		
		
	</div>
</div>	
	<br/><br/>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>