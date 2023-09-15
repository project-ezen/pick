<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listArticle</title>
<%@ include file="../include/header.jsp" %>
<style>

.foot { padding-bottom: 100px; padding-top: 100px; }


.thumb {
	margin-top: 50px;
	margin-left: 10px;
	border-radius: 5px;
}

.outer_div {
	min-height: 534px;
}

.inner_div {
	margin-top: 20px;
	margin-right: 20px;
	margin-bottom: 10px;
	margin-left: 45px;
	display: inline-block;
}


.page:link{text-decoration: none; color: #000}
.page:visited,.page:active{color: #000;}

.pagenav {
	display: inline-block;
	width: 50%;
	text-align: center;
	position: relative;
	left: 25%;
	bottom: 20px;
}

.searchbar {
	width: 300px;
	height: 30px;
	border-radius: 5px;
	border: solid 1px rgba(0,0,0,0.3);
	display: flex;
	justify-content: center;
	align-items: center;
	opacity: 1;
	background-color: rgb(233, 233, 233);
	margin-left: 36%;
}

.searchinput {
	width: 250px;
	border: none;
	margin-left: 10px;
	overflow: auto;
	font-size: 16px;
	background-color: rgb(233, 233, 233);
	outline: none;
}

.selectbtn {
	width: 150px;
	margin-left: auto;
}

.btnsub {
	border-radius: 10px;
	border: 2px solid #586389;
	width: 90px;
	height: 30px;
	text-align: center;
}

/*글쓰기 버튼*/
.wbtn {
	width: 70px;
	height: 35px;
	border-radius: 5px;
	border: none;
	background-color: #687AB6;
	color: #fff;
	float: right;
	margin-right: 50px;
	margin-bottom: 15px;
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
	height: 24px;
	position: absolute;
	bottom: 10px;
	text-align: center;
	padding-left: 10px;
}

.bi-chat::before {
    content: "\f268";
    font-size: 20px;
    margin-right: 4px;
}

.bi-heart::before {
    content: "\f417";
    font-size: 20px;
    margin-right: 4px;
}

.bi-heart-fill::before {
	content: "\f415";
	font-size: 20px;
	margin-right: 4px;
}

span {
	font-size: 15px;
}
 
</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<div class="foot">
	<div class="container" style="background-color: white;">
		<h2 align="center">나만의 레시피</h2>
		<br/>
		
		<div style="display: flex;">
			<div class="searchbar">
				<span class="bi bi-search bis" id="text"></span><input class="searchinput" type="text" placeholder="제목을 검색하세요" id="searchKeyword" value="${pcri.keyword}"/>
			</div>
		</div>
		<div class="selectbtn">

			<form action="/board/articleList" method="get" id="selectBtn">
				<select class="btnsub" name="selop" id="selop" onchange="selectOp(this)">
					<option value="one" >최신순</option>
					<option value="two" >찜 많은순</option>
				</select>
				<input type="hidden" name="selop"/>
			</form>
		</div>
		<form id="formBoList" action="/board/articleList" method="get">
			<input type="hidden" name="page"/>
			<input type="hidden" name="keyword"/>
		</form>
	<%---------------------------------- 검색 외 --------------------------------------%>			
		<div class="outer_div">
		<c:choose>
			<%--게시글이 하나도 없는 경우 --%>
			<c:when test="${empty articlesList}"> 
				<h3 style="font-size:22px; text-align: center;"><b>등록된 게시글이 없습니다.</b></h3>
			</c:when>
			<%-- 게시글이 하나라도 있는 경우 --%>
			<c:when test="${not empty articlesList}"> 
				<c:forEach var="article" items="${articlesList}" varStatus="articleNum">
						<div class="inner_div" style="background-color: #ADC4CE; height: 200px; width: 300px; border-radius: 10px;">
						<c:choose>
							<c:when test="${not empty article.thumbnail && article.thumbnail != 'null'}">
								<!-- <div class="thumb" >${article.thumbnail}</div> -->
								<input type="hidden" name="thumbnail" value="${article.thumbnail}"/>
								<img class="thumb" style="width:100px; height:100px; float:left;" src="${path}/thumbdown?board_id=${article.board_id}&thumbnail=${article.thumbnail}" id="thumbnail"/>
							</c:when>
							<c:otherwise>
								<img class="thumb" style="width:100px; height:100px; float:left;" src="/resources/images/defaultThumb.png"/>
							</c:otherwise>
						</c:choose>
							<div class="lele">
								<div class="top">
									<p class="title" ><a class="page"  href="${page}/board/recipedetail?board_id=${article.board_id}">${article.title}</a></p>
									<p class="writer">${article.nickname}</p>
								</div>
								<div class="bottom">
								<c:choose>
									<c:when test="${member != null}"> <!-- 로그인 했을 때 -->
										<i class="bi bi-chat"></i>
										<c:if test ="${article.reply_count != 0}">
										<span>${article.reply_count}</span>
										</c:if>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i id="heart" class="bi bi-heart"></i>
										<span class="jjim_count">${article.jjim_cnt}</span>
									</c:when>
									<c:otherwise> <!-- 비로그인 상태일 때, 찜 버튼 디폴트 -->
										<i class="bi bi-chat"></i>
										<c:if test ="${article.reply_count != 0}">
										<span>${article.reply_count}</span>
										</c:if>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<i class="bi bi-heart"></i>
										<span class="jjim_count">${article.jjim_cnt}</span>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
				</c:forEach>
			 <!-- 화면 하단의 페이지 영역 -->
	      </c:when>
		</c:choose>
	
	    </div>  
	      <div class="pagenav">
	         <ul class="btn-group pagination">
	            <c:if test="${pageMaker.prev}">
	               <li>
	                  <a class="page" href='<c:url value="/board/articleList?page=${pageMaker.startPage-1}&keyword=${pcri.keyword}"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
	               </li>
	            </c:if>
	            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
	               <li>
	                  <a class="page" href='<c:url value="/board/articleList?page=${pageNum}&selop=${pcri.selop}&keyword=${pcri.keyword}"/>'><i></i>${pageNum}</a>
	               </li>
	            </c:forEach>
	            <c:if test="${pageMaker.next}">
	               <li>
	                  <a class="page" href='<c:url value="/board/articleList?page=${pageMaker.endPage+1}&keyword=${pcri.keyword}"/>'><span class="glyphicon glyphicon-chevron-right"></span></a>
	               </li>
	            </c:if>
	         </ul>
	      </div>
		<button type="button" class="wbtn" onclick="javascript:fn_writeForm('${isLogOn}', '${page}/board/write', '${page}/member/login')">글쓰기</button>
		<br/><br/>
		
	</div>
<br/><br/>
		
</div>
<%@ include file="../include/footer.jsp" %>
<script type="text/javascript">
function fn_writeForm(isLogOn, articleForm, loginForm) {
	if(isLogOn != '' && isLogOn != false){
		location.href = articleForm;
	} else {
		alert("로그인 후 이용해주세요.");
		location.href= loginForm + '?action=/board/write';
	}
};

function selectOp(obj){
	alert("selectOp 값 : " + $(obj).val());
	var selop = $(obj).val();
	alert("selop 값 : " + selop);
	sortListSearch(selop);
};

function sortListSearch(selop){
	alert("sortListSearch(selop)값 : " + selop);
};

$(document).ready(function() {
    var formObj  = $("#formBoList");	// 키워드 검색 폼
    var formSort = $("#selectBtn");		// 최신순, 찜많은순 정렬 폼
    
    // 검색어 입력 시 엔터 키 이벤트 처리
    $("#searchKeyword").keydown(function(key) {
        if (key.keyCode === 13) { // Enter 키 코드는 13입니다.
            performSearch();
        }
    });

    // 검색 기능 수행 함수
    function performSearch() {
        var keywordB = $("#searchKeyword").val();
        var keywordBoardTrim = keywordB.trim();
        formObj.find("[name='keyword']").val(keywordBoardTrim);
        formObj.find("[name='page']").val("1");
        formObj.submit();
    }
});
</script>
</body>
</html>