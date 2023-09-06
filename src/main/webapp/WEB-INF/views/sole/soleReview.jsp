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
	background-position: center;
	height: 100vh;
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

#stars{
 	display: inline-block;
    direction: rtl;
    border:0;
    }
    
#stars input[type=radio]{
    display: none;
    }
    
#stars label{
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
    }
    
#stars label:hover{
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    
#stars label:hover ~ label{
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    
#stars input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
    }
    
#별점 {
	padding-top: 20px;
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
				<h2 align="center">리뷰 작성</h2>
			</div>
		</div>
		<br/>
		<div class="form-group">
			<label class="control-label col-sm-3">작성자</label>
			<div class="col-sm-7">
				<input type="text" class="form-control-plaintext reon" value="${member.m_nickname}" readonly/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3" id="별점">별점</label>
			<div class="col-sm-7">
				<fieldset id="stars">
		            <input type="radio" name="star" value="1" id="rate1"><label for="rate1">★</label>
		            <input type="radio" name="star" value="2" id="rate2"><label for="rate2">★</label>
		            <input type="radio" name="star" value="3" id="rate3"><label for="rate3">★</label>
		            <input type="radio" name="star" value="4" id="rate4"><label for="rate4">★</label>
		            <input type="radio" name="star" value="5" id="rate5"><label for="rate5">★</label>
					<input type="radio" name="star" value="0" checked/>
        		</fieldset>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3">내용</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="15" name="content"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3">이미지</label>
			<div class="col-sm-6">
				<input type="file" name="image" onchange="readURL(this);"/><br/>
				<img id="preview" src="#" width="200" height="200"/>
			</div>
		</div>
		<hr/>
		<div class="form-group">
			<div class="col-sm-6"></div>
			<div class="col-sm-4" style="text-align: center; margin-left: 10px;">
				<button class="btn_cle" type="button" onclick="back()">취소</button>
				&nbsp;
				<button class="btn_sub" type="submit">올리기</button>
			</div>
		</div>
		<input type="hidden" name="recipe_code" value="${param.recipe_code}"/>
		<input type="hidden" name="m_id" value="${member.m_id}"/>
	</form>
</div>

<script>
	function back() {   // 취소버튼을 누르면 바로 뒤로 감
		window.history.back();
	}
	
	$(document).ready(function() {
		
	});
	
	function readURL(input) { // 파일을 선택해서 변화가 생겼을 때 
		if(input.files && input.files[0]) {  // 파일을 선택해서 파일이 있는 경우 files[0] : 선택한 첫번째 파일
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
</script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>