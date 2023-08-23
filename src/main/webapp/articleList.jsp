<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listArticle</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
<style>


img {
margin-top: 50px;
margin-left: 5px;
border-radius: 5px;
}

.inner_div {
padding: 0px;
margin: 15px 15px;
}

body {
background-image: url("./resources/images/background2.jpg");
background-attachment : fixed, scroll;
background-repeat: no-repeat;
background-size: cover;
}
 
.search {
width: 700px;
position: relative;
margin-left: 400px;
justify-content: flex-start;
margin-bottom: 10px;
}

.search input {
  width: 43%;
  height: 30px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  background-color: rgb(233, 233, 233);
  margin: 0;
  padding: 10px 12px;
  text-align: center;
}

.bis {
position: absolute;
left: 15px;
top: 5px;
margin: 0;
}

.btnsub {
 border-radius: 10px;
 border: 2px solid #586389;
}

select {
width: 90px;
height: 30px;
}

.wbtn {
width: 70px;
height: 35px;
border-radius: 5px;
border: 2px solid #586389;
background-color: #687AB6;
color: #fff;
float: right;
margin-right: 50px;
margin-bottom: 20px;
}

.page_wrap {
	width: 100%;
	text-align:center;
	font-size:0;
	height: 40px;
	margin-left: 100px;
 }
.page_nation {
	display:inline-block;
	padding-top: 7px;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}

.page_nation .prev {
	background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left:7px;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}

.lele {
width: 180px;
height: 200px;
position: relative;
float: right;
}

.top {
text-align: center;
padding : 60px 0;
margin-right: 20px;
}

.top p.title {
font-size: 20px;
}

.top p.writer {
text-align: right;
margin-right: 5px;
}

.bottom {
width: 100%;
position: absolute;
bottom: 10px;
text-align: center;
}

.bi-chat::before {
    content: "\f268";
    font-size: 17px;
}

.bi-heart::before {
    content: "\f417";
    font-size: 17px;
}

span {
font-size: 15px;
}
.container {
padding: 0px;
}

</style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
<div class="container" style="background-color: white;">
	<h2 align="center">나만의 레시피</h2>
	<br/>
		<div class="search">
			<i class="bi bi-search bis"></i><input type="text" placeholder="검색"/>
			<div style="width: 100px; float: right;">
				<select class="btnsub">
					<option>최신순</option>
					<option>찜 많은순</option>
				</select>
			</div>
		</div>
	<div class="list">
	
	</div>
	<button type="button" class="wbtn" onclick="wbtn">글쓰기</button>
	<div class="page_wrap">
	   <div class="page_nation">
	      <a class="arrow prev" href="#"><i class="bi bi-caret-left-fill"></i></a>
	      <a href="#" class="active">1</a>
	      <a href="#">2</a>
	      <a href="#">3</a>
	      <a href="#">4</a>
	      <a href="#">5</a>
	      <a class="arrow next" href="#"><i class="bi bi-caret-right-fill"></i></a>
	   </div>
	</div> 
</div>
<br/>
<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>