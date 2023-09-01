<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세</title>
<%@ include file="../include/header.jsp" %>

<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>
.container {
min-height: 600px;
}
table {
width: 100%;
border: 2px solid #ddd;
}
th {
background-color: #ccd6d9;
}
th, td {
border-bottom: 1px solid #ddd;
padding: 10px;
border: 1px solid #eee;
width: auto;
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
<%@ include file="../include/topMenu.jsp" %>

<div class="container">
	<h2 style="text-align: center;">나만의 레시피 상세</h2>
	<br/>
	<form name="viewArticle" method="post" action="${path}" enctype="multipart/form-data">
		<table>
			<colgroup>
				<col style="width:10%;" /><col style="width:23%;" /><col style="width:10%;" /><col style="width:23%;" />
			</colgroup>
			<tbody>
				<tr>
					<th>글번호</th>
					<td>
						<input type="text"   value="${article['board_id']}" disabled/>
						<input type="hidden" value="${article['board_id']}" name="board_id"/>
					</td>
					
					<th>작성일자</th>
					<td><input type="text"   value="${article.writeDate}" name="writeDate" disabled/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text"   value="${article.writer}" name="writer" disabled/></td>
					
					<th>찜 개수</th>
					<td>{100}</td>
				</tr>
				<tr>
                	<th scope="row">제목</th>
                	<td colspan="3"><input type="text"   value="${article.title }" name="title" id="i_title" disabled/></td>
                </tr>
                <tr>
                    <th scope="row">내용</th>
                    <td colspan="3"><textarea rows="20" name="content" id="i_content" style="width: 100%" disabled>${article.content }</textarea></td>
                </tr>
				<tr>
					<td colspan="2">
						<input type="button" class="btn1" value="목록으로 돌아가기" onClick="backToList(this.form)"/>
					</td>
					<td colspan="2" style="text-align: right;">
						<c:if test="${member.m_id == article.writer}">
							<input type="button" class="btn2" value="수정" onClick="fn_enable(this.form)"/>
							<input type="button" class="btn3"  value="삭제" onClick="fn_remove('#', ${article.board_id})"/>
						</c:if>
					</td>
				</tr>
				<c:if test="${member.m_id == article.writer}">
					<tr id="ddd">
						<td colspan="4" style="text-align: right;">
							<input type="button" class="btn5" value="수정 취소" onClick="backToForm(this.form)"/>
							<input type="button" class="btn4" value="올리기" onClick="fn_modify_article(viewArticle)"/>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</form>
	<br/>
	<hr/>
	<div style="text-align: right; margin-bottom: 10px;">
		<button class="btn_2" type="button" style="display :inline-block; background-color: #687AB6; color: #fff;">댓글쓰기</button>
	</div>
	<div>
		<table style="margin-bottom: 20px;">
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
<br/>
<script>

function fn_enable(obj){
	document.getElementById("i_title").disabled				= false;
	document.getElementById("i_content").disabled			= false;
	document.getElementById("i_imageFileName").disabled		= false;
}

function backToForm(obj){
	document.getElementById("i_title").disabled = true;
	document.getElementById("i_content").disabled = true;
}

function backToList(obj){
	location.href = "${path}/board/articleList";
}
</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>