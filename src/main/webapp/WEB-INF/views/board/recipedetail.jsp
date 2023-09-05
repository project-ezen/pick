<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세</title>
<%@ include file="../include/header.jsp" %>

<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>
.foot { padding-bottom: 100px; padding-top: 100px;}
.container { min-height: 600px; }
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
display :inline-block; 
background-color: #687AB6; 
color: #fff; 
border: none;
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
					<th style="text-align: center;">글번호</th>
					<td>
						<input type="text"   value="${article['board_id']}" disabled/>
						<input type="hidden" value="${article['board_id']}" name="board_id"/>
					</td>
					
					<th style="text-align: center;">작성일자</th>
					<td><input type="text"   value="${article.writeDate}" name="writeDate" disabled/></td>
				</tr>
				<tr>
					<th style="text-align: center;">작성자</th>
					<td><input type="text"   value="${article.nickname}" name="nickname" disabled/></td>
					
					<th style="text-align: center;">찜 개수</th>
					<td>{100}</td>
				</tr>
				<tr>
                	<th>제목</th>
                	<td><input type="text" value="${article.title}" name="title" id="title" disabled/></td>
                	<th>대표사진</th>
                	<td><input type="file" name="thumbnail" id="thumbnail" disabled/></td>
                </tr>
                <tr>
                    <th scope="row" style="text-align: center;">내용</th>
                    <td colspan="3"><textarea rows="20" name="content" id="content" style="width: 100%" disabled>${article.content}</textarea></td>
                </tr>
				<tr>
					<td colspan="2">
						<input type="button" class="btn1" value="목록으로 돌아가기" onClick="backToList(this.form)"/>
					</td>
					<td colspan="2" style="text-align: right;">
						<c:if test="${member.m_id == article.writer}">
							<input type="button" class="btn2" value="수정" onClick="fn_enable(this.form)"/>
							<input type="button" class="btn3"  value="삭제" onClick="fn_remove('${path}/board/delete.do', ${article.board_id})"/>
						</c:if>
					</td>
				</tr>
				<c:if test="${member.m_id == article.writer}">
					<tr id="ddd">
						<td colspan="4" style="text-align: right;">
							<input type="button" class="btn5" value="수정 취소" onClick="backToForm(this.form)"/>
							<input type="button" class="btn4" value="올리기" id="updatewrite"/>
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</form>
	<br/>
	<hr/>
	<div id="replyList"> 
		<table style="margin-bottom: 20px;">
			<c:forEach items="${reply}" var="reply">
			<tr>
				<th style="text-align: center; width:15%;">${reply.writer}(<fmt:formatDate value="${reply.writeDate}" pattern="yyyy-MM-dd" />)</th>
				<td style="width:75%;">${reply.content}</td>
				<c:if test="${member.m_id == reply.writer}">
				<td style="width:8%;"><button class="btn_2" type="button">수정</button>/<button class="btn_2" type="button">삭제</button></td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
		<form method="post" action="/reply/replywrite">
		<table style="margin-bottom: 20px;">
		<c:if test="${isLogOn == true }">
			<tr>
				<th style="text-align: center; width:15%;">닉네임</th>
				<td style="width:75%;"><input type="text" size="20" maxlength="100" value="${member.m_id}" readonly/></td>
			</tr>
			<tr>	
				<th style="text-align: center; width:15%;">내용</th>
				<td style="width:75%;"><textarea rows="5" cols="50" style="width:100%" name="content"></textarea></td>
				<td style="width:8%;"><button class="btn_2" type="submit" id="replyBTN">댓글 작성</button></td>
			</tr>
		</c:if>
		</table>
		</form>
	</div>
</div>
<br/>
<script>

function fn_enable(obj){
	document.getElementById("title").disabled			= false;
	document.getElementById("content").disabled			= false;
	document.getElementById("thumbnail").disabled	= false;
}

function backToForm(obj){
	document.getElementById("title").disabled = true;
	document.getElementById("content").disabled = true;
	document.getElementById("thumbnail").disabled	= false;
}

function backToList(obj){
	location.href = "${path}/board/articleList";
}

$(document).ready(function(){
	
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${path}/resources/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2",
		htParams: {
			bUseModeChanger: false
		}
	});

	$("#updatewrite").click(function(){
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var title = $("#title").val();
		var content = document.getElementById("content").value;
		var writer = $("#writer").val();
		
		if (title == null || title == ""){
			alert("제목을 입력하세요");
			$("#title").focus();
			return false;
		}
		if(content == "" || content == null || content == '&nbsp;'
		|| content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
			alert("내용을 입력하세요");
			return false;
		}
		
		if(!confirm("발행하겠습니까?")){
			alert("취소되었습니다");
			return false;
		} else {
			
			console.log(content);
		}
	});
});

function fn_remove(url, board_id){
	var form = document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action", url);
	
	var boardIdInput = document.createElement("input");
	boardIdInput.setAttribute("type", "hidden");
	boardIdInput.setAttribute("name", "board_id");
	boardIdInput.setAttribute("value", board_id);
	
	form.appendChild(boardIdInput);
	document.body.appendChild(form);
	form.submit();
	
}


$(document).ready(function() {
	
	replyList();
	
	$("#replyBTN").click(function() {
		var replytext 	= $("#replytext").val();
		var b_id 		= "${article.board_id}"
		var param		= "replytext=" +replytext +"&board_id="+b_id;
		
		$.ajax({
			type: "post",
			url: "${path}/reply/replywrite",
			data: param,
			success: function() {
				alert("댓글이 등록되었습니다.");
				RreplyList();
			}
		});
		
	});
		
		function replyList() {
		$.ajax ({
		type: "get",
		url: "${path}/board/articleList?board_id=${article.board_id}",
		success: function(result) {
			$("#replyList").html(result);
		}
	})

	
}



</script>
<script src="${path}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>