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
.foot { padding-bottom: 150px; padding-top: 150px;}

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
font-family: 'Cafe24Supermagic-Bold-v1.0';
}

.btn_3 {
width: 40px;
height: 20px;
display :inline-block; 
background-color: #687AB6; 
color: #fff; 
font-size: 13px;
border: none;
text-align:center;
font-family: 'Cafe24Supermagic-Bold-v1.0';
display: inline-block;
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
						<input type="button" class="btn1" value="목록으로 돌아가기" onClick="location.href='${path}/board/articleList'"/>
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
	<%-- 댓글 부분  // 목록 나옴--%>
	<div>
		<table style="margin-bottom: 20px;">
			<c:forEach items="${reply}" var="reply">
				<tr>
					<th style="text-align: center; width:15%;">${reply.nickname}(<fmt:formatDate value="${reply.writeDate}" pattern="yyyy-MM-dd"/>)</th>
					<td style="width:75%;">${reply.content}</td>
					<c:if test="${reply.r_writer == member.m_nickname}">
						<td style="width:10%;"><a href="#" class="btn_3" type="button" onclick="fn_rupdate()">수정</a>/<a href="#" class="btn_3" type="button" onclick="fn_rdelete()">삭제</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	<%-- 댓글 작성하는 부분 --%>
	<c:if test="${ isLogOn == true }">
		<form method="post" action="/reply/rwrite">
			<table style="margin-bottom: 20px;">
					<tr>
						<th style="text-align: center; width:15%;">닉네임</th>
						<td style="width:75%;"><input type="text" size="20" maxlength="100" value="${member.m_nickname}" name="r_writer" readonly/></td>
					</tr>
					<tr>	
						<th style="text-align: center; width:15%;">내용</th>
						<td style="width:75%;"><textarea rows="5" cols="50" style="width:100%" name="content"></textarea></td>
						<td style="width:8%;">
						<input type="hidden" name="b_id" value="${article.board_id}">
						<button class="btn_2" type="submit">댓글 작성</button>
						</td>
					</tr>
			</table>
		</form>
	</c:if>
	</div>
</div>
<br/>
<script>

function fn_enable(obj){
	document.getElementById("title").disabled		= false;
	document.getElementById("content").disabled		= false;
	document.getElementById("thumbnail").disabled	= false;
}

function backToForm(obj){
	document.getElementById("title").disabled = true;
	document.getElementById("content").disabled = true;
	document.getElementById("thumbnail").disabled	= true;
}




$(document).ready(function(){
	var contentval = $("#content").val();
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
	
	contentval = $("#content").val().replace(/<p><br><\/p>/gi, "<br>"); // <p><br></p> => <br>로 변환
	
	contentval = contentval.replace(/<\/p><p>/gi, "<br>"); // </p><p> => <br>로 변환
	contentval = contentval.replace(/(<\/p><br>|<p><br>)/gi, "<br><br>");
	contentval = contentval.replace(/(<p>|<\/p>)/gi, ""); // <p> 또는 </p>모두 제거
	$("#content").val(contentval);

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
/*댓글 삭제 버튼 
function fn_rdelete(e) {
	e.preventDefault();
	let replyId = $(this).attr("href");	
	
	$.ajax({
		data : {
			reply_num : replyNum,
			b_id : '${article.board_id}'
		},
		url : '/reply/rdelete',
		type : 'POST',
		success : function(result){
			replyListInit();
			alert('삭제가 완료되엇습니다.');
		}
	});		
		
});*/
	
	

</script>

<script src="${path}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>