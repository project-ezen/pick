<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
<style>
<<<<<<< Updated upstream
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
		
.tab 	{
	width: 207px;
  	display: inline-block;
  	vertical-align: top;
  	margin-top: 50px;
}

.ul	{
	list-style-type: none;
	width: 		25%;
	padding: 	0;
	margin: 	0;
	position:	fixed;
	height:		100%;
	overflow:	auto; 
}

li a	{
	text-decoration: none;
	display:	block;
	color:		#000;
	padding: 	8px 15px 8px 15px;
	font-weight: bold;
}

.content	{
	margin-left: 25%;
	padding:	1px 16px;
	height:		1000px;
}		

aside	{
    flex-grow: 1;
    height:1200px;
}
</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
	<div class="container" id="class">
			<h2 class="title">MyPage</h2>
		<div id="contents" class="submenu">
			<hr/>
			<aside>
			<ul class="tab">
				<li class='tabmenu'><a href="#">구매내역</a></li>
				<li class='tabmenu'><a href="#">찜한 게시물</a></li>
				<li class='tabmenu'><a href="#">내가 쓴 게시물</a></li>
				<li class='tabmenu'><a href="#">회원정보수정</a></li>
			</ul>
			</aside>
		</div>
		<div id="content">
		<h2>아리랑</h2>
		</div>
	</div>
	<%@ include file="./WEB-INF/views/include/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
</script>

</body>
</html>