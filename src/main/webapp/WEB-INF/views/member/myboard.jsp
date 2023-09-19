<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session ="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시물</title>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>

	.container { background-color: #fff; height: 1000px; }
	
	.foot { padding-bottom: 150px; padding-top: 150px; margin:auto; }
	
	table {
		width: 100%;
		border: 2px solid #ddd;
		margin-left: auto;
		margin-right: auto;
	}
	th { background-color: rgba(37,85,108,0.5); }
	
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
		background-color:#25556C;
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
	
	.list:hover { background-color: #51a1c7; }
	
	.list:active { position:relative; top:1px; }
	
	.pagenav {
	display: inline-block;
	width: 50%;
	text-align: center;
	position: relative;
	left: 25%;
	
	}

</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<div class="foot">
	<div class="container">
		<h2 style="text-align: center;">내가 쓴 게시물</h2>
		<br/>
		<button type="button" onclick="location.href='${path}/member/mypage'" class="list" style="float: right; margin-right: 3px;">마이페이지 목록가기</button>
		<div id="wrap">
			<table id="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>이미지</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>찜</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty boardList}"><!-- 게시글이 하나도 없는 경우 -->
						<tr>
							<td colspan="6"><div style="font-size: 17px; font-weight: bold;">작성글이 없습니다.</div></td>						
						</tr>
					</c:if>
					<!-- 게시글이 하나라도 있는 경우 -->
					<%int cnt=1; %>
					<c:forEach items="${boardList}" var="dto">
						<tr>
							<td><%=cnt++ %></td>
							<td><img style="height:100px; width:100px;"src="${path}/resources/images/thumb/t_${dto.thumbnail}" alt="사진"></td>
							<td style="width:45%;"><a href="${path}/board/recipedetail?board_id=${dto.board_id}">${dto.title}</a></td>
							<td style="width:15%;">${dto.writer}</td>
							<td style="width:15%;">${dto.writeDate}</td>
							<td style="width:10%;">${dto.jjim_cnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<br/><br/>
</div>
<%@ include file="../include/footer.jsp" %>

</body>
</html>