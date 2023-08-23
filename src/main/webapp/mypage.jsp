<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
<style>
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

.content	{
	margin-left: 25%;
	padding:	1px 16px;
}		

</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
	<div class="container" id="class">
		<h2 class="title">MyPage</h2>
		<div id="contents" class="submenu">
		<hr/>
		<section class="content">
			<article> 
				<img style="height:100px; width:100px; vertical-align:top;" src="./resources/images/alcohol.png" border="0">
				<h2>${member.name}</h2><h2>님</h2>
				
			</article>
			<article>
				<button>주문내역</button>
        		<button>찜한 게시물</button>
				<
			</article>
		</section>
		</div>
	</div>
	<%@ include file="./WEB-INF/views/include/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
</script>
</body>
</html>