<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<style>
.summernote {border:1px solid #a9a9a9;position:relative}

input.reon {
	border: none;
	outline: none;
}

label {
	font-size: 18px;
}

.btn_sub {
width: 70px;
height: 35px;
font-size: 15px;
border-radius: 5px;
border: 2px solid #586389;
background-color: #687AB6;
color: #fff;
}

.btn_cle {
width: 70px;
height: 35px;
font-size: 15px;
border-radius: 5px;
border: 2px solid #B36E79;
background-color: #E96F84;
color: #fff;
}

</style>

</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<br/><br/>
<div class="container">
	<form class="form-horizontal" action="${path}/board/addNewArticle" method="post" name="articleFrom">
		<div class="form-group">
			<div>
				<h2 align="center">글쓰기</h2>
			</div>
		</div>
		<br/>
		<div class="form-group">
			<label class="control-label col-sm-3">작성자</label>
			<div class="col-sm-7">
				<input type="text" id="writer" name="writer" style="font-size: 20px;" class="form-control-plaintext reon" value="${member.m_id}" readonly/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3">대표사진</label>
			<div class="col-sm-6">
				<input type="file" name="image" onchange="readURL(this);"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3">제목</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" maxlength="100" style="width: 100%" id="title" name="title"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3">내용</label>
			<div class="col-sm-7" id="smarteditor">
				<textarea id="content" name="content" rows="20"></textarea>
			</div>
		</div>
		<hr/>
		<div class="form-group">
			<div class="col-sm-6"></div>
			<div class="col-sm-4" style="text-align: center; margin-left: 10px;">
				<button class="btn_cle" type="button" onClick="backToList(this.form)">취소</button>
				&nbsp;
				<button class="btn_sub" id="wsubmit" type="submit">올리기</button>
			</div>
		</div>
	</form>
</div>
<br/>
<script>

function backToList(obj) {
	location.href = "${path}/board/articleList";
}
</script>
<script src="${path}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
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

	$("#wsubmit").click(function(){
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		
		var title = $('#title').val();
		var content = document.getElementById("content").value;
		var writer = document.getElementById("writer").value;
		
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
			
			$.ajax({
				url: "/board/addNewArticle",
				type: 'post',
				datatype: 'json',
				data: {
					"title" : title,
					"content" : content,
					"writer" : writer
				},
				success: function(data){
					console.log('success')
					alert('성공');
					location.href = "/board/articleList";
				},
				error: function(data){
					console.log('오류');
				}
			});
		}
	});
});
</script>
<%@ include file="../include/footer.jsp" %>
</body>
</html>