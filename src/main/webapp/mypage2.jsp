<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
<style>
@media ( min-width: 946px ) {
  .set1 {
  	width: auto;
  }
}

.class { width: 900px; background-color: #fff; min-height: 600px; border-radius: 10px; margin-left: 500px; margin-right:400px;  background-color: rgba( 255, 255, 255, 0.8 );}

img { float: left; }

.set1 { width: 90%; height: 200px;  margin-left: 50px; border-radius:10px; }

.set2 { width: 90%; text-align:center; padding-bottom:3%; margin-left: 45px ; margin-right: 45px; border-radius:10px; display: inline-block;}

.nim { text-align : center; line-height : 200px; width: 70%; height: 200px; float: right; margin:0 auto; }

.box { width: 150px; height: 150px; float:left; margin: 0 15px;  background-color: #092042; }

 a 	 { text-align: center; line-height : 200px; float: center; margin:0 auto; display: inline-block; }

</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
	<div class="class">
	<br/>
		<h2 class="title" style="text-align : center;">MyPage</h2>
		<hr/>		
		<div id="contents" class="set1">
		<img style=" padding-left: 15px; height:200px; width:30%; vertical-align:top; float: left;" src="./resources/images/alcohol.png" border="0">

		<div><h2 class="nim">${member.m_nickname}님, 어서오세요!</h2></div>
		</div>
		<hr/>
		<div class="set2">
			<div class="box"><a href="${path}/shopping/myorderList.jsp">주문 조회</a></div>
			<div class="box"><a href="${path}/board/recipejjim.jsp">찜한 레시피</a></div>
			<div class="box"><a href="${path}/board/myboard.jsp">내가 쓴 게시물</a></div>
			<div class="box"><a href="${path}/member/edit">회원 정보 수정</a></div>
		</div>
		
	</div>
	<br/><br/>
	<%@ include file="../WEB-INF/views/include/footer.jsp" %>
</body>
</html>