<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listArticle</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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


</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
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
	<c:choose>
		<c:when test="${articlesList == null}"> <!-- 게시글이 하나도 없는 경우 -->
			<tr>
				<td colspan="4">
					<p align="center">
						<b><span style="font-size:22px;">등록된 게시글이 없습니다.</span></b>
					</p>
				</td>
			</tr>
		</c:when>
		<c:when test="${articlesList != null}"> <!-- 게시글이 하나라도 있는 경우 -->
			<c:forEach var="article" items="${articlesList }" varStatus="articleNum">
				<div style="width: 370px; height: 230px; float: left;">
					<div class="inner_div" style="background-color: #888; height: 200px; width: 300px">
						<img alt="" src="${path}/resources/images/cat1.jpg" width="100px" height="100px">
						<div class="lele">
							<div class="top">
								<p class="title">${article.title}</p>
								<p class="writer">${article.m_id}</p>
							</div>
							<div class="bottom">
								<i class="bi bi-chat" style="width: 20px; height: 20px;"></i><span>100</span>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<i class="bi bi-heart"></i><span>100</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		
		 <!-- 화면 하단의 페이지 영역 -->
      <div class="col-sm-offset-3">
         <ul class="btn-group pagination">
            <c:if test="${pageMaker.prev}">
               <li>
                  <a href='<c:url value="/board/articleList?page=${pageMaker.startPage-1}"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
               </li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
               <li>
                  <a href='<c:url value="/board/articleList?page=${pageNum}"/>'><i></i>${pageNum}</a>
               </li>
            </c:forEach>
            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
               <li>
                  <a href='<c:url value="/board/articleList?page=${pageMaker.endPage+1}"/>'><span class="glyphicon glyphicon-chevron-right"></span></a>
               </li>
            </c:if>
         </ul>
      </div>
      
      <form id="formList" action="/board/listArticlesPaging" method="get">
         <input type="hidden" name="page" />
         <input type="hidden" name="size"/>
         <input type="hidden" name="searchType"/>
         <input type="hidden" name="keyword" />      
      </form>
      </c:when>
	</c:choose>
      
      
     
      
	<button type="button" class="wbtn" onclick="javascript:fn_writeForm('${isLogOn}', '${page}/board/write', '${page}/member/login')">글쓰기</button>
	
<br/>
</div>
<%@ include file="../include/footer.jsp" %>
<script>
function fn_writeForm(isLogOn, articleForm, loginForm) {
	if(isLogOn != '' && isLogOn != false){
		location.href = articleForm;
	} else {
		alert("로그인 후 이용해주세요.");
		location.href= loginForm + '?action=/board/write';
	}
}
</script>
</body>
</html>