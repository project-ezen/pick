<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=divice-width, initial-scale=1" />
    <%@ include file="../include/header.jsp" %>


    <style>
    
    .bg {
		 background-image: url("/resources/images/background2.jpg");

         height: 100vh;        /*%로 주면 안되고 vh로 줘야함  */
         
         
		 background-attachment: fixed, scroll;
         background-position: center;
         background-repeat: no-repeat;
         background-size: cover; 
	}
    
    .container-fluid{
    margin-left: 80px;
    margin-right: auto;
    }
      .carousel-inner img {
        width: 100%;
        margin: auto;
        height: 300px !important;
      }
      /* 글리피콘 세모*/
      #btnDown {
        color: #05224e;
        margin-top: 40px;
        margin-left: 60px;
        display: none;
      }
      /* 글리피콘 세모*/

      /* 버튼 통합*/
      #alcSearchBtn,
      #doguSearchBtn,
      #furSearchBtn,
      #jucSearchBtn {
        margin: 0;
        background-color: rgb(115, 115, 189);
        color: #f8f8f2;
        font-size: 1.1em;
        border-radius: 4px 4px 4px 4px;
        white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
        white-space: -pre-wrap; /* Opera 4-6 */
        white-space: -o-pre-wrap; /* Opera 7 */
        word-wrap: break-word; /* Internet Explorer 5.5+ */
      }

      #alcSearchBtn,
      #doguSearchBtn,
      #furSearchBtn,
      #jucSearchBtn {
        margin-left: 30px;
        width: 100px;
        height: 30px;
        border: none;
        display: inline-block;
        text-transform: uppercase;
        overflow: hidden;
        position: relative;
      }
      /*버튼 통합*/

      /*술 버튼*/
      #alcSearchBtn span {
        position: relative;
        z-index: 1;
      }
      #alcSearchBtn:after {
        content: "";
        position: absolute;
        left: 0;
        top: 0;
        height: 700%;
        width: 300%;
        background-image: url("/resources/images/button.PNG");
        transition: all 0.5s ease-in-out;
        transform: translateX(-120%) translateY(-25%) rotate(45deg);
      }

      #alcSearchBtn:hover:after {
        -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
        transform: translateX(-9%) translateY(-25%) rotate(45deg);
      }
      /*술 버튼*/

      /*도구 버튼*/
      #doguSearchBtn span {
        position: relative;
        z-index: 1;
      }
      #doguSearchBtn:after {
        content: "";
        position: absolute;
        left: 0;
        top: 0;
        height: 700%;
        width: 300%;
        background-image: url("/resources/images/button.PNG");
        transition: all 0.5s ease-in-out;
        transform: translateX(-120%) translateY(-25%) rotate(45deg);
      }

      #doguSearchBtn:hover:after {
        -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
        transform: translateX(-9%) translateY(-25%) rotate(45deg);
      }
      /*도구 버튼*/

      /*과일 버튼*/
      #furSearchBtn span {
        position: relative;
        z-index: 1;
      }
      #furSearchBtn:after {
        content: "";
        position: absolute;
        left: 0;
        top: 0;
        height: 700%;
        width: 300%;
        background-image: url("/resources/images/button.PNG");
        transition: all 0.5s ease-in-out;
        transform: translateX(-120%) translateY(-25%) rotate(45deg);
      }

      #furSearchBtn:hover:after {
        -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
        transform: translateX(-9%) translateY(-25%) rotate(45deg);
      }
      /*과일 버튼*/

      /*음료 버튼*/
      #jucSearchBtn span {
        position: relative;
        z-index: 1;
      }
      #jucSearchBtn:after {
        content: "";
        position: absolute;
        left: 0;
        top: 0;
        height: 700%;
        width: 300%;
        background-image: url("/resources/images/button.PNG");
        transition: all 0.5s ease-in-out;
        transform: translateX(-120%) translateY(-25%) rotate(45deg);
      }

      #jucSearchBtn:hover:after {
        -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
        transform: translateX(-9%) translateY(-25%) rotate(45deg);
      }
      /*음료 버튼*/

      /*상품 정보*/
      #productInfo {
        padding-top: 60px;
      }

      .productInfo_in {
        border-radius: 5px;
        background-color: rgba(0, 0, 0, 0);
        color: #fff;
        margin: 10px;
        height: 300px !important;
        width: 330px;
        text-align: center;
      }
      .productInfo_in img {
        border-radius: 13%;
        height: 200px;
        width: 200px;
        margin: 10px;
        margin-top: 20px;
      }
      .productInfo_in:hover {
        background-color: #576fa0;
        transition: 0.7s;
        border-radius: 30%;
      }
      /*상품 정보*/

      /*검색 버튼*/
      #search_fromKeyword {
        margin-right: 30px;
        text-align: center;
        font-size: 20px;
        float: right;
      }

      #searchBtn_fromKeyword {
        width: 40px;
        height: 40px;
        color: #f7eeee;
      }
      #searchBtn_fromKeyword:hover {
        background-color: rgb(255, 255, 255);
      }

      #searchBtn_fromKeyword {
        line-height: 40px;
        padding: 0;
        background: transparent;
        position: relative;
        z-index: 2;
        color: #fff;
        -webkit-perspective: 300px;
        perspective: 300px;
        -webkit-transform-style: preserve-3d;
        transform-style: preserve-3d;
      }
      #searchBtn_fromKeyword:hover {
        color: #000;
      }
      #searchBtn_fromKeyword:after {
        position: absolute;
        content: "";
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: #000;
        z-index: -1;
        transform-origin: center bottom;
        transition: all 0.5s ease;
      }
      #searchBtn_fromKeyword:hover:after {
        -webkit-transform: rotateX(-180deg);
        transform: rotateX(-180deg);
      }
      body {
      background-color: white;
      }
      
      /*검색 버튼*/
	  
	  /*select css*/
	  .selectSearch{
	    margin-top: 30px;
	    border-style: none;
	    background-color: rgba(0, 0, 0, 0);
	    color:	#FFF;
	    width: 150px;
	    font-size: 17px;
	  }     
	  .selectSearch:focus{
	  	border-style: none;
	  	outline: none;
	  }
      /*select css*/
      
	  option {
	  	color: black;
	  }
	   option:hover {
	  	background-color: black;
	  	color: white;
	  }
      
    </style>
  </head>
  <body class="bg">
    <!-- Top Menu -->
     <%@ include file="../include/topMenu.jsp" %>
    

    <!-- 광고 배너 -->
    <br />
    <br />
   <div class="row">
    <div id="Advertising" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#Advertising" data-slide-to="0" class="active"></li>
        <li data-target="#Advertising" data-slide-to="1"></li>
        <li data-target="#Advertising" data-slide-to="2"></li>
      </ol>

      <!-- 광고 내용 또는 이미지 -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img src="/resources/images/gango.jpg" />
        </div>
        <div class="item">
          <img src="/resources/images/gango.jpg" />
        </div>
        <div class="item">
          <img src="/resources/images/gango.jpg" />
        </div>
      </div>

      <!-- 광고 옆으로 넘기기 -->
      <a
        class="left carousel-control"
        href="#Advertising"
        role="button"
        data-slide="prev"
      >
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a
        class="right carousel-control"
        href="#Advertising"
        role="button"
        data-slide="next"
      >
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <br/>

<!-- 버튼 -->
      <nav id="searchBtn" class="col-sm-12">
        <button type="button" id="alcSearchBtn" class="col-sm-2" onclick="location.href='/store/productInfo?category=술'">
          <span>&nbsp;&nbsp;술&nbsp;&nbsp;</span>
        </button>
        <button type="button" id="jucSearchBtn" class="col-sm-2" onclick="location.href='/store/productInfo?category=음료'">
          <span>음료</span>
        </button>
        <button type="button" id="doguSearchBtn" class="col-sm-2" onclick="location.href='/store/productInfo?category=도구'">
          <span>도구</span>
        </button>
        <button type="button" id="furSearchBtn" class="col-sm-2" onclick="location.href='/store/productInfo?category=과일'">
          <span>과일</span>
        </button>
        
<!-- 검색 버튼 -->
    <div>
      <span
        id="btnDown"
        class="glyphicon glyphicon-triangle-bottom"
        style="font-size: 30px"
      ></span>
    </div>
	
	 <div id="search_fromKeyword">
	    <form action="/store/productInfo" method="GET">
	        <input type="hidden" name="category" value="${param.category}" />
	        <input type="text" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword.trim()}"/>	
	        <button type="submit" id="searchBtn_fromKeyword" class="glyphicon glyphicon-search"></button>
	    </form>
      <select class="selectSearch" name="select" onchange="selectSearch()" id="select">
      	<option value="def" <c:if test="${param.select eq 'def'}">selected</c:if>>기본</option>
      	<option value="lowPrice" <c:if test="${param.select eq 'lowPrice'}">selected</c:if>>낮은 가격순</option>
      	<option value="highPrice" <c:if test="${param.select eq 'highPrice'}">selected</c:if>>높은 가격순</option>
      </select>
	</div>
    
    <br />
    <br />
    
	<div class="container-fluid">
	<div class="row text-center" id="productInfo">
		<c:forEach var="product" items="${productList}">
			<a href="/store/productInfos?display_product_id=${product.display_product_id}">
				<div class="col-sm-3 productInfo_in">
					<img src="${path}/download.do?imageFileName=${product.product_image}" align="center"/>
					<p align="center">상품명 : ${product.product_name }</p>
					<p align="center">가격 : <fmt:formatNumber value="${product.product_price }" pattern="#,###"/>원</p>
				</div>
			</a>
		</c:forEach>
	</div>
      
         
         
  </div>
 <div align="center">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="First" onclick="updateURLParamsAndNavigate('page', 1); return false;">
                    <span aria-hidden="true" class="glyphicon glyphicon-backward"></span>
                </a>
            </li>
            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                <li class="${loop.index == currentPage ? 'active' : ''}">
                    <a href="#" onclick="updateURLParamsAndNavigate('page', ${loop.index}); return false;">${loop.index}</a>
                </li>
            </c:forEach>
            <li>
                <a href="#" aria-label="Last" onclick="updateURLParamsAndNavigate('page', ${totalPages}); return false;">
                    <span aria-hidden="true" class="glyphicon glyphicon-forward"></span>
                </a>
            </li>
        </ul>
    </nav>
</div>
 </div>

    <div class="row">
      <div id="footer">
        <%@ include file="../include/footer.jsp" %>
      </div>
    </div>
   
  </body>

  <script>
  function selectSearch() {
	  var select = document.getElementById("select");
	  var choose = select.options[select.selectedIndex].value;
	  
	  if(choose == 'def') {
		  select.options[0].selected = true;
		  updateURLParamsAndNavigateSelect('select', 'def'); return false;
		  
	  }else if(choose == 'lowPrice') {
		  select.options[1].selected = true;
		  updateURLParamsAndNavigateSelect('select', 'lowPrice'); return false;

	  }else if(choose == 'highPrice') {
		  select.options[2].selected = true;
		  updateURLParamsAndNavigateSelect('select', 'highPrice'); return false;
	  }
  }

  
  $(document).ready(function(){
	  $("#searchBtn_fromKeyword").on("click", function(){
	    var searchKeyword = $("#searchKeyword").val();
	    var trimmedKeyword = searchKeyword.trim();
	    $("#searchKeyword").val(trimmedKeyword);
	  });
	});
  
    // 술 버튼
      var arcCheck  = 0;
      var doguCheck = 0;
      var furCheck  = 0;
      var jucCheck  = 0;
      
      var searchParams = new URLSearchParams(location.search);

      for (var param of searchParams) {
        console.log(param);
      }
      
      
    $(document).ready(function () {
      $("#alcSearchBtn").on("click", function () {    	 
        arcButton();
        if(arcCheck == 1){
        	backStore();
        }
    });
      if (searchParams.get("category") === "술") {
          arcButton();
          arcCheck++;
      }
  });

    // 도구 버튼
    $(document).ready(function () {
      $("#doguSearchBtn").on("click", function () {
    	  doguButton();
    	  if(doguCheck == 1){
          	backStore();
          }
      });
      if (searchParams.get("category") === "도구") {
          doguButton();
          doguCheck++;
      }
    });

    // 과일 버튼
    $(document).ready(function () {
      $("#furSearchBtn").on("click", function () {
    	  furButton();
    	  if(furCheck == 1){
          	backStore();
          }       
      });
      if (searchParams.get("category") === "과일") {
          furButton();
          furCheck++;
      }
    });

    // 음료 버튼
    $(document).ready(function () {
      $("#jucSearchBtn").on("click", function () {
    	  jucButton();
    	  if(jucCheck == 1){
            	backStore();
            }              
      });
      if (searchParams.get("category") === "음료") {
          jucButton();
          jucCheck++;
      }
    });
    
    // 현재 파라미터 값을 가져오는 펑션
    function getCurrentURLParams() {
        var urlParams = new URLSearchParams(window.location.search);
        return urlParams.toString(); // 파라미터를 문자열 형태로 반환
      }
    
    // page 파라미터 업데이트
    function updateURLParamsAndNavigate(newParam, newValue) {
        var currentParams = getCurrentURLParams(); // 현재 파라미터 값을 가져옴
        var urlParams = new URLSearchParams(currentParams);

        // 'page' 파라미터가 이미 있다면 제거
        if (urlParams.has('page')) {
          urlParams.delete('page');
        }

        // 새로운 파라미터 추가
        urlParams.append(newParam, newValue);

        var newURL = window.location.pathname + '?' + urlParams.toString(); // 새로운 파라미터가 있는 URL 생성
        window.location.href = newURL; // 새로운 URL로 이동
      }
    
    // select 파라미터 업데이트
    function updateURLParamsAndNavigateSelect(newParam, newValue) {
        var currentParams = getCurrentURLParams(); // 현재 파라미터 값을 가져옴
        var urlParams = new URLSearchParams(currentParams);

        // select가 있다면 제거
        if (urlParams.has('select')) {
        	urlParams.delete('select');
        }

        // 새로운 파라미터 추가
        urlParams.append(newParam, newValue);

        var newURL = window.location.pathname + '?' + urlParams.toString(); // 새로운 파라미터가 있는 URL 생성
        window.location.href = newURL; // 새로운 URL로 이동
      }
    
    
    // 술 펑션
    function arcButton() {
    	// 색상바꾸기
        $("#doguSearchBtn").css("background-color", "rgb(115, 115, 189)");
        $("#furSearchBtn").css("background-color", "rgb(115, 115, 189)");
        $("#jucSearchBtn").css("background-color", "rgb(115, 115, 189)");

        // 이미지 바꾸기
        $("#alcSearchBtn").css(
          "background-image",
          "url('/resources/images/button.PNG')"
        );
        $("#doguSearchBtn").css("background-image", "none");
        $("#furSearchBtn").css("background-image", "none");
        $("#jucSearchBtn").css("background-image", "none");

        // 글리피콘 세모 바꾸기
        $("#btnDown").css("margin-left", "-470px");
        $("#btnDown").css("display", "inline-block");
        $("#productInfo").css("margin-top", "0px");

        // 높이 바꾸기
        $("#alcSearchBtn").css("height", "50px");
        $("#doguSearchBtn").css("height", "30px");
        $("#furSearchBtn").css("height", "30px");
        $("#jucSearchBtn").css("height", "30px");
    }
    
    // 도구 펑션
    function doguButton(){
    	 // 색상바꾸기
        $("#alcSearchBtn").css("background-color", "rgb(115, 115, 189)");
        $("#furSearchBtn").css("background-color", "rgb(115, 115, 189)");
        $("#jucSearchBtn").css("background-color", "rgb(115, 115, 189)");

        // 이미지 바꾸기
        $("#doguSearchBtn").css(
          "background-image",
          "url('/resources/images/button.PNG')"
        );
        $("#alcSearchBtn").css("background-image", "none");
        $("#furSearchBtn").css("background-image", "none");
        $("#jucSearchBtn").css("background-image", "none");

        // 글리피콘 세모 바꾸기
        $("#btnDown").css("margin-left", "-210px");
        $("#btnDown").css("display", "inline-block");
        $("#productInfo").css("margin-top", "0px");

        // 높이 바꾸기
        $("#alcSearchBtn").css("height", "30px");
        $("#doguSearchBtn").css("height", "50px");
        $("#furSearchBtn").css("height", "30px");
        $("#jucSearchBtn").css("height", "30px");
    }
    
    // 과일 펑션
    function furButton(){
    	
    	 // 색상바꾸기
        $("#alcSearchBtn").css("background-color", "rgb(115, 115, 189)");
        $("#doguSearchBtn").css("background-color", "rgb(115, 115, 189)");
        $("#jucSearchBtn").css("background-color", "rgb(115, 115, 189)");

        // 이미지 바꾸기
        $("#furSearchBtn").css(
          "background-image",
          "url('/resources/images/button.PNG')"
        );
        $("#alcSearchBtn").css("background-image", "none");
        $("#doguSearchBtn").css("background-image", "none");
        $("#jucSearchBtn").css("background-image", "none");

        // 글리피콘 세모 바꾸기
        $("#btnDown").css("margin-left", "-80px");
        $("#btnDown").css("display", "inline-block");
        $("#productInfo").css("margin-top", "0px");

        // 높이 바꾸기
        $("#alcSearchBtn").css("height", "30px");
        $("#doguSearchBtn").css("height", "30px");
        $("#furSearchBtn").css("height", "50px");
        $("#jucSearchBtn").css("height", "30px");
    }
    
    // 음료 펑션
    function jucButton(){
    	 // 색상바꾸기
        $("#alcSearchBtn").css("background-color", "rgb(115, 115, 189)");
        $("#doguSearchBtn").css("background-color", "rgb(115, 115, 189)");
        $("#furSearchBtn").css("background-color", "rgb(115, 115, 189)");

        // 이미지 바꾸기
        $("#jucSearchBtn").css(
          "background-image",
          "url('/resources/images/button.PNG')"
        );
        $("#alcSearchBtn").css("background-image", "none");
        $("#doguSearchBtn").css("background-image", "none");
        $("#furSearchBtn").css("background-image", "none");

        // 글리피콘 세모 바꾸기
        $("#btnDown").css("margin-left", "-340px");
        $("#btnDown").css("display", "inline-block");
        $("#productInfo").css("margin-top", "0px");

        // 높이 바꾸기
        $("#alcSearchBtn").css("height", "30px");
        $("#doguSearchBtn").css("height", "30px");
        $("#furSearchBtn").css("height", "30px");
        $("#jucSearchBtn").css("height", "50px");
    }
    
    function backStore(){
    	location.href = "/store/productInfo";
    }
    
  </script>
</html>

