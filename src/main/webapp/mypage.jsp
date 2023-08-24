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

body 	{ 	
   	background-image:url("./resources/images/background2.jpg");
   	background-attachment: fixed, scroll;
   	background-repeat:no-repeat;
  	background-size:cover;
}

#class	{
	background-color:	#FFFFFF;
	text-align:			center;
	border-radius:		10px;
	padding: 30px 30px 30px 30px;
   	margin-top:		150PX ;
	margin-bottom: 150px;
}	

img { float: left; }

.set1 { width: 100%; height: 200px; background-color:	#C3E7FA; margin-right: 0px; border-radius:10px; }

.set2 {width: 100%; padding-bottom: 3%; background-color:	#C3E7FA; margin-right: 0px; border-radius:10px;}

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
	<div class="container" id="class">
		<h2 class="title">MyPage</h2>
		<hr/>
		<div id="contents" class="set1">
		<img style=" padding-left: 15px; height:200px; width:30%; vertical-align:top; float: left;" src="./resources/images/alcohol.png" border="0">
		<div>${member.name}<h2 class="nim">님, 어서오세요!</h2></div>
		</div>
		<hr/>
		<div class="set2">
			<button class="order" type="button">주문한 내역</button>
			<button class="order" type="button">찜한 레시피</button>
			<button class="order" type="button">내가 쓴 게시물</button>
			<button class="order" type="button">회원 정보 수정</button>
		</div>
	</div>
	<br/>
	<%@ include file="./WEB-INF/views/include/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
</script>
</body>
</html>