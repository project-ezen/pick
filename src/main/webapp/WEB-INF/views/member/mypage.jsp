<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<%@ include file="../include/header.jsp" %>
<style>
@media ( min-width: 946px ) {
  .set1 {
  	width: auto;
  }
}

img { float: left; }

.set1 { width: 100%; height: 200px; background-color: #ccd6d9; opacity:0.8; margin-right: 0px; border-radius:10px; }

.set2 { width: 100%; text-align:center; padding-bottom: 3%; background-color: #ccd6d9; margin-right: 0px; border-radius:10px; display: inline-block;}

.nim { text-align : center; line-height : 200px; width: 70%; height: 200px; float: right; margin:0 auto; }

.order {
	background-color:#7892c2;
	border-radius:16px;
	border:none;
	display:inline-block;
	cursor:pointer;
	color:#fff;
	font-family:Arial;
	font-size:20px;
	text-decoration:none;
	margin: 50px 30px 30px 30px;
	padding: 30px 30px;
}
.order:hover {
	background-color:#afb7db;
}
.order:active {
	position:relative;
	top:1px;
}
	
</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
	<div class="container">
		<h2 class="title">MyPage</h2>
		<hr/>
		<div id="contents" class="set1">
		<img style=" padding-left: 15px; height:200px; width:30%; vertical-align:top; float: left;" src="./resources/images/alcohol.png" border="0">
		<div>${m.name}<h2 class="nim">님, 어서오세요!</h2></div>
		</div>
		<hr/>
		<div class="set2">
			<button class="order" type="button" onclick="fn_order(this.form)">주문 조회</button>
			<button class="order" type="button" onclick="fn_jjim(this.form)'">찜한 레시피</button>
			<button class="order" type="button" onclick="fn_mine(this.form)'">내가 쓴 게시물</button>
			<button class="order" type="button" onclick="fn_insert(this.form)'">회원 정보 수정</button>
		</div>
	</div>
	<br/><br/>
	<%@ include file="../include/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

//주문한 내역
function fn_order(obj) {
	alert("주문조회");
	obj.action = "${path}/shopping/myorderList.jsp";
	obj.submit();
}	

function fn_jjim(ob) {
	alert("찜한 레시피");
	ob.action = "${path}/board/recipejjim.jsp";
	ob.submit();
}	

function fn_mine(obj) {
	alert("작성한 게시물");
	obj.action = "${path}/board/myboard.jsp";
	obj.submit();
}	

function fn_insert(obj) {
	alert("회원정보수정");
	obj.action = "${path}/member/insertInfo.jsp";
	obj.submit();
}	


</script>
</body>
</html>