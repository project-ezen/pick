<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="com.edu.pillter.Yoksul"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<%@ include file="../include/header.jsp" %>

<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script type="text/javascript">
	
	var referrer = document.referrer;

	window.onpageshow = function(event) {
    	if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
        	alert("이미 리뷰를 작성하셨습니다.");
        	
        	var backUrl = "/sole/sole?alcohole_category=" + ${category};
        	
        	window.location.href = backUrl;    
        }
} 
</script>
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
		border: none;
		background-color: #25556C;
		font-family:'Cafe24Supermagic-Bold-v1.0';
		color: #fff;
		font-size:15px;
		padding:6px 13px;
		border-radius:17px;
		}
	.btn_sub:hover { background-color: #51a1c7; }
	.btn_sub:active {
		position:relative;
		top:1px;
	}
		
	.btn_cel {
		width: 70px;
		height: 35px;
		font-size: 15px;
		border-radius: 5px;
		border: none;
		font-family:'Cafe24Supermagic-Bold-v1.0';
		color: #fff;
		font-size:15px;
		padding:6px 13px;
		border-radius:17px;
		background-color: #cc0000;
		
	}

	.btn_cel:hover {background-color: #E96F84; }
	
	.btn_cel:active {
		position:relative;
		top:1px;
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
	<form class="form-horizontal" action="/sole/soleReviewInsert" method="post" enctype="multipart/form-data" id="reviewForm">
		<div class="form-group">
			<div>
				<h2 align="center">리뷰 작성</h2>
			</div>
		</div>
		<br/>
		<div class="form-group" style="display: flex; align-items: center;">   <!--style  수직정렬 -->
			<label class="control-label col-sm-3">작성자</label>
			<div class="col-sm-7">
				<input type="text" class="form-control-plaintext reon" value="${member.m_nickname}" readonly />
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3" id="별점">별점</label>
			<div class="col-sm-7">
				<fieldset id="stars">
		            <input type="radio" name="star" value="5" id="rate1"><label for="rate1">★</label>
		            <input type="radio" name="star" value="4" id="rate2"><label for="rate2">★</label>
		            <input type="radio" name="star" value="3" id="rate3"><label for="rate3">★</label>
		            <input type="radio" name="star" value="2" id="rate4"><label for="rate4">★</label>
		            <input type="radio" name="star" value="1" id="rate5"><label for="rate5">★</label>
					<input type="radio" name="star" value="0" checked/>
        		</fieldset>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-3">내용</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="15" name="content" maxlength="500" placeholder="한 번 작성한 리뷰는 수정하거나 삭제할 수 없으니 신중하게 작성해주세요." id="reviewContent"></textarea>
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
				<button class="btn_cel" type="button" onclick="back()">취소</button>
				&nbsp;
				<button class="btn_sub" type="button" id="reviewSubmit">올리기</button> <!-- onclick 중복 글쓰기 방지 -->
			</div>
		</div>
		<input type="hidden" name="recipe_code" value="${param.recipe_code}"/>
		<input type="hidden" name="m_id" value="${member.m_id}"/>
	</form>
</div>
<br/><br/>

	<%
		String [] yokArray = Yoksul.yoksul; // 욕설필터 가져오기
	%>

<script>
	function back() {   // 취소버튼을 누르면 바로 뒤로 감
		window.history.back();
	}
	
	
	function readURL(input) { // 파일을 선택해서 변화가 생겼을 때 
		if(input.files && input.files[0]) {  // 파일을 선택해서 파일이 있는 경우 files[0] : 선택한 첫번째 파일
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#preview").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
$(document).ready(function() {
		
		var yok  = <%= new org.json.JSONArray(yokArray).toString() %>; 
		
		// 리뷰 쓸때 내용에 값이 없으면 서밋하지 못하게 하는 
		$("#reviewSubmit").click(function() {
			var contentValue = $("#reviewContent").val();
			var check = "가능";
			if(!contentValue || contentValue.trim() === "") {
				check = "불가능";
			}
			for(var i = 0; i < yok.length; i++) {
				if(contentValue.includes(yok[i])) {
					alert("비속어는 사용할 수 없습니다.");
					check = "불가능";
				}
			}
			if(check == "가능") {
				if(confirm("리뷰를 작성하시겠습니까?")) {
					$("#reviewForm").submit();
				}else{
					alert("리뷰 작성을 취소하였습니다.");
				}
			} else{
				check = "가능";
			}
		});
	});

</script>

<%@ include file="../include/footer.jsp" %>
</body>
</html>