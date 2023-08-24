<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
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
	background:linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color:#7892c2;
	border-radius:16px;
	display:inline-block;
	cursor:pointer;
	color:#fff;
	font-family:Arial;
	font-size:19px;
	text-decoration:none;
	margin: 50px 30px 30px 30px;
	padding: 30px 30px;
}
.order:hover {
	background:linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color:#476e9e;
}
.order:active {
	position:relative;
	top:1px;
}
	
</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
	<div class="container" id="">
		<h2 class="title">MyPage</h2>
		<hr/>
		<div id="contents" class="set1">
		<img style=" padding-left: 15px; height:200px; width:30%; vertical-align:top; float: left;" src="./resources/images/alcohol.png" border="0">
		<div>${member.name}<h2 class="nim">님, 어서오세요!</h2></div>
		</div>
		<hr/>
		<div class="set2">
			<button class="order" type="button" onclick="fn_order(this.form)">주문한 내역</button>
			<button class="order" type="button" onclick="fn_jjim(this.form)'">찜한 레시피</button>
			<button class="order" type="button" onclick="fn_mine(this.form)'">내가 쓴 게시물</button>
			<button class="order" type="button" onclick="fn_insert(this.form)'">회원 정보 수정</button>
		</div>
	</div>
	<br/><br/>
	<%@ include file="./WEB-INF/views/include/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

//주문한 내역
function fn_order(obj) {
	alert("주문한 내역");
	obj.action = "${path}/shopping/order.jsp";
	obj.submit();
}	

function fn_jjim(obj) {
	alert("찜한 레시피");
	obj.action = "${path}/board/.jsp";
	obj.submit();
}	

function fn_mine(obj) {
	alert("작성한 게시물");
	obj.action = "${path}/shopping/order.jsp";
	obj.submit();
}	

function fn_insert(obj) {
	alert("회원정보수정");
	obj.action = "${path}/shopping/order.jsp";
	obj.submit();
}	


</script>
</body>
</html>