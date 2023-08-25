<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
body {
	background-image: url("/resources/images/background2.jpg");
	background-attachment : fixed, scroll;
	background-repeat: no-repeat;
	background-size: cover;
	}
.container {
	background-color: #fff;
	min-height: 600px;
	
	}
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
	<form class="form-horizontal" action="/sole/soleReviewInsert" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<div>
				<h2 align="center">글쓰기</h2>
			</div>
		</div>
		<br/>
		<div class="form-group">
			<label class="control-label col-sm-3">작성자</label>
			<div class="col-sm-7">
				<input type="text" class="form-control-plaintext reon" value="${member.nickname}" readonly/>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-3">내용</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="15" name="content"></textarea>
			</div>
		</div>
		<hr/>
		<div class="form-group">
			<div class="col-sm-6"></div>
			<div class="col-sm-4" style="text-align: center; margin-left: 10px;">
				<button class="btn_cle" type="button" onclick="back()">취소</button>
				&nbsp;
				<button class="btn_sub" type="submit" id="reviewSubmit">올리기</button>
			</div>
		</div>
	</form>
</div>
<br/>
<script>
	function back() {   // 취소버튼을 누르면 바로 뒤로 감
		window.history.back();
	}
	
	$(document).ready(function() {
		
	});
	
</script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>