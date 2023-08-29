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
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
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
	<form class="form-horizontal" action="/board/articleList" method="post" name="articleFrom">
		<div class="form-group">
			<div>
				<h2 align="center">글쓰기</h2>
			</div>
		</div>
		<br/>
		<div class="form-group">
			<label class="control-label col-sm-3">작성자</label>
			<div class="col-sm-7">
				<input type="text" style="font-size: 20px;" class="form-control-plaintext reon" value="${member.m_nickname}" readonly/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3">제목</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" maxlength="100" style="width: 100%" name="title"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3">내용</label>
			<div class="col-sm-6">
				<textarea id="summernote" name="content"></textarea>
			</div>
		</div>
		<hr/>
		<div class="form-group">
			<div class="col-sm-6"></div>
			<div class="col-sm-4" style="text-align: center; margin-left: 10px;">
				<button class="btn_cle" type="button">취소</button>
				&nbsp;
				<button class="btn_sub" type="submit" id="submit">올리기</button>
			</div>
		</div>
	</form>
</div>
<br/>
<script>

</script>
<script src="${path}/resources/summernote/js/summernote.js"></script> <!-- summernote.js 파일 끌어오기 -->
<%@ include file="../include/footer.jsp" %>
</body>
</html>