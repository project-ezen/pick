<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=divice-width, initial-scale=1" />
    <%@ include file="../include/header.jsp" %>


    <style>
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
        margin-top: -10px;
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
        margin-top: 20px;
      }

      .productInfo_in {
        border-radius: 5px;
        background-color: #032457;
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
      }
      .productInfo_in:hover {
        background-color: rgb(96, 104, 104);
        outline-color: brown;
        transition: 0.7s;
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
    </style>
  </head>
  <body>
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
          <img src="./images/gango1.jpg" />
        </div>
        <div class="item">
          <img src="./images/gango2.jpg" />
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

    <form>
      <nav id="searchBtn" class="col-sm-12">
        <button type="button" id="alcSearchBtn" class="col-sm-2">
          <span>&nbsp;&nbsp;술&nbsp;&nbsp;</span>
        </button>
        <button type="button" id="jucSearchBtn" class="col-sm-2">
          <span>음료</span>
        </button>
        <button type="button" id="doguSearchBtn" class="col-sm-2">
          <span>도구</span>
        </button>
        <button type="button" id="furSearchBtn" class="col-sm-2">
          <span>과일</span>
        </button>
    <div id="search_fromKeyword">
      <input type="text" id="searchKeyword" value="" placeholder="검색값" />	
      <button
        id="searchBtn_fromKeyword"
        class="glyphicon glyphicon-search"
      ></button>
    </div>
      </nav>
    </form>
    <div>
      <span
        id="btnDown"
        class="glyphicon glyphicon-triangle-bottom"
        style="font-size: 30px"
      ></span>
    </div>
    
    <br />
    <br />
    
	<div class="container-fluid">
	<div class="row text-center">
		<c:forEach var="product" items="${productList}">
			<a href="/store/productInfos?display_product_id=${product.display_Product_Id}">
				<div class="col-sm-3 productInfo_in">
					<img src="${path}/download.do?imageFileName=${product.product_image}" align="center"/>
					<p align="center">상품명 : ${product.product_Name }</p>
					<p align="center">가격 : ${product.product_Price }</p>
				</div>
			</a>
		</c:forEach>
	</div>
      
         
         
  </div>
 </div>
 </div> 
     
    <div class="row">
      <div id="footer">
        <%@ include file="../include/footer.jsp" %>
      </div>
    </div>
   
  </body>

  <script>
    // 술 버튼
    $(document).ready(function () {
      $("#alcSearchBtn").on("click", function () {
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
        $("#btnDown").css("margin-left", "60px");
        $("#btnDown").css("display", "inline-block");
        $("#productInfo").css("margin-top", "0px");

        // 높이 바꾸기
        $("#alcSearchBtn").css("height", "50px");
        $("#doguSearchBtn").css("height", "30px");
        $("#furSearchBtn").css("height", "30px");
        $("#jucSearchBtn").css("height", "30px");
      $.ajax({
    	 type:		"get",
    	 url:		"/store/productInfo",
    	 data: 		{ category : "술"},
    	 dataType:	"json",
    	 success:	function(data, textStatus){
    		console.log(data);
    	 },
    	 error: function(data, textStatus){
    		 alert("시발");
    	 }
      });
    });
  });

    // 도구 버튼
    $(document).ready(function () {
      $("#doguSearchBtn").on("click", function () {
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
        $("#btnDown").css("margin-left", "325px");
        $("#btnDown").css("display", "inline-block");
        $("#productInfo").css("margin-top", "0px");

        // 높이 바꾸기
        $("#alcSearchBtn").css("height", "30px");
        $("#doguSearchBtn").css("height", "50px");
        $("#furSearchBtn").css("height", "30px");
        $("#jucSearchBtn").css("height", "30px");
      });
    });

    // 과일 버튼
    $(document).ready(function () {
      $("#furSearchBtn").on("click", function () {
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
        $("#btnDown").css("margin-left", "455px");
        $("#btnDown").css("display", "inline-block");
        $("#productInfo").css("margin-top", "0px");

        // 높이 바꾸기
        $("#alcSearchBtn").css("height", "30px");
        $("#doguSearchBtn").css("height", "30px");
        $("#furSearchBtn").css("height", "50px");
        $("#jucSearchBtn").css("height", "30px");
      });
    });

    // 음료 버튼
    $(document).ready(function () {
      $("#jucSearchBtn").on("click", function () {
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
        $("#btnDown").css("margin-left", "190px");
        $("#btnDown").css("display", "inline-block");
        $("#productInfo").css("margin-top", "0px");

        // 높이 바꾸기
        $("#alcSearchBtn").css("height", "30px");
        $("#doguSearchBtn").css("height", "30px");
        $("#furSearchBtn").css("height", "30px");
        $("#jucSearchBtn").css("height", "50px");
      });
    });
  </script>
</html>

