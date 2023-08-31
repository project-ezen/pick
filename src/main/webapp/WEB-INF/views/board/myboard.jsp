<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시물</title>
<%@ include file="../include/header.jsp" %>
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
	th { background-color: #ccd6d9; }
	
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
<%@ include file="../include/topMenu.jsp" %>

<div class="container">
	<h2 style="text-align: center;">내가 쓴 게시물</h2>
	<br/>
	<button type="button" onclick="${path}/member/mypage" class="list" style="float: right; margin-right: 3px;">마이페이지 목록가기</button>
	<div id="wrap">
		<table id="table">
			<thead>
				<tr>
					<th>이미지</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>찜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty myInfo.myPageList}">
				<tr>
					<td colspan="5"><div style="font-size: 17px; font-weight: bold;">작성글이 없습니다.</div></td>
				</tr>
				</c:if>
				<c:forEach items="${myinfo.myPageList}" var="boardDTO">
				<tr>
					<td>{boardDTO.image}</td>
					<td><a href="${path}/board/recipedetail.jsp">{boardDTO.title}</a></td>
					<td>{boardDTO.m_id}</td>
					<td>{boardDTO.writeDate}</td>
					<td>{boardDTO.jjim}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<br/><br/>
<script type="text/javascript">
		$(function() {
			$("tr").hide();
			$("tr").slice(0, 4).show(); // 초기갯수
			$("#moreView-btn").click(function(e) { // 더보기 버튼 클릭
				e.preventDefault();
				$("tr:hidden").slice(0, 4).show(); // 클릭시 리스트 갯수 지정
				if ($("tr:hidden").length == 0) { // 컨텐츠 남아있는지 확인
					$("#moreView-btn").hide(); //더이상의 리스트가 없다면 버튼 사라짐
				}
			});
		});
</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>