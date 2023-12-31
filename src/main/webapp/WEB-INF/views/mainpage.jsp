<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session ="true" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<title>메인페이지</title>
<%@ include file="./include/header.jsp" %>
    <style>
        body, html {  height: 100%;  margin: 0;  color: white; }
        .bg {
            background-image: url("./resources/images/background2.jpg");
            background-attachment: scroll;
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .item > ul{
            visibility: hidden;
    		max-height: 0;
    		overflow: hidden;
    		color: white;
    		transition: visibility 0.5s ease, max-height 0.5s ease; /* 모든 효과를 하나의 트랜지션 속성에 포함시킵니다 */

        }
        
        .item:hover > ul{
          visibility: visible;
          max-height: 1000px; /* 충분히 큰 값을 설정하여 서서히 펼쳐지도록 만듭니다 */
        }

        ul { list-style: none; }
        
        li { list-style: none; }
        
        .item { font-size: 30px;  }
        
        #logindiv {
            position: fixed;
            bottom: 10px;
            width: 100;
            font-size: large;
            color:white;
        }
        a:link { color: white; text-decoration-line: none; }
        
        a:visited {  color: white;  text-decoration-line: none;  }
        
        #solo 	{ font-size: 25px; }
        
        .AA 	{ font-size: 20px; }
       
    </style>
</head>
<body>
<% if (request.getAttribute("logout") != null && request.getAttribute("logout").equals("true")) { %>
<script>
    alert("로그아웃 되었습니다.");
</script>
<% } %>
    <div class="bg">
        <div class="container-fluid">
            <div class="col-sm-4">
                <h1 style="margin-top: 50px; font-size: 50px;">마녀의 pick</h1>
                <form id="formList" action="/sole/sole" method="get">
                   <input type="hidden" name="alcohole_category"/>
                </form>
                
                <form id="baseList" action="/sole/baseSole" method="get">

                   <input type="hidden" name="alcohole_category"/>

                </form>
                
                <div id="listid">   
                	<li class="item" style="margin-top: 50px;">       
	                   Alcohol
	                   	<ul>
	                       	<li id="lilist" class="base"><a href="#" class="AA">Base Alcohol </a></li>
	                       	<li id="lilist" class="weski"><a href="#" class="AA">위스키 칵테일</a></li>
	                       	<li id="lilist" class="brandi"><a href="#" class="AA">브랜디 칵테일</a></li>
                       		<li id="lilist" class="jin"><a href="#" class="AA">진 칵테일</a></li>
	                      	<li id="lilist" class="rum"><a href="#" class="AA">럼 칵테일</a></li>
	                       	<li id="lilist" class="bodcar"><a href="#" class="AA">보드카 칵테일</a></li>
                    	 	<li id="lilist" class="dekilla"><a href="#" class="AA">데킬라 칵테일</a></li>
	                   	</ul>
	                </li>
	          		
                   	<div style="margin-top: 50px;">
                       <label id="solo"><a href="${path}/board/articleList">나만의 레시피</a></label>
                      </div>

                      
                      <c:choose>
                         <%-- 로그인이 되지 않은 경우 --%>
                         <c:when test="${empty member.m_id || member.m_id eq ''}">
                            <div style="margin-top: 50px;">
                                <label id="solo"><a href="${path}/member/login">MyPage</a></label>
                            </div>
                         </c:when>
                         <%-- 로그인이 된 경우 --%>
                         <c:otherwise>
                            <div style="margin-top: 50px;">
                                <label id="solo"><a href="${path}/member/mypage">MyPage</a></label>
                            </div>
                         </c:otherwise>
                      </c:choose>


                      <div style="margin-top: 50px;">
                       <label id="solo"><a href="/store/productInfo">Store</a></label>

                   	</div>
                   	<div style="margin-top: 350px;" id="logindiv">
                   	<c:choose>
						<%-- 로그인이 되지 않은 경우 --%>
						<c:when test="${ member == null }">
	                       <label><a href="${path}/member/login">Login</a> | <a href="${path}/member/join">Join</a></label>
	                   	</c:when>
	                   	<%-- 로그인이 된 경우 --%>
	                	<c:when test="${ member != null }">
	                       <label><a href="${path}/member/logout">LogOut</a></label>
	                   	</c:when>
                   	</c:choose>
                   	</div>

                </div>
            </div>
        </div>
    </div>

    <script>    
        $(document).ready(function() {
        	var formList = $("#formList");
        	var baseList = $("#baseList");
        	var category1 = 1;
        	var category2 = 2;
        	var category3 = 3;
        	var category4 = 4;
        	var category5 = 5;
        	var category6 = 6;
        	var category7 = 7;
        	
        	
        	$(".base").click(function() {
        		baseList.find("[name='alcohole_category']").val(category1);
        		baseList.submit();
        	})
        	
        	$(".weski").click(function (){
        		formList.find("[name='alcohole_category']").val(category2);
        		formList.submit();
        	});
        	
        	$(".brandi").click(function (){
        		formList.find("[name='alcohole_category']").val(category3);
        		formList.submit();
        	});
        	
        	$(".jin").click(function (){
        		formList.find("[name='alcohole_category']").val(category4);
        		formList.submit();
        	});
        	
        	$(".rum").click(function (){
        		formList.find("[name='alcohole_category']").val(category5);
        		formList.submit();
        	});
        	
        	$(".bodcar").click(function (){
        		formList.find("[name='alcohole_category']").val(category6);
        		formList.submit();
        	});
        	
        	$(".dekilla").click(function (){
        		formList.find("[name='alcohole_category']").val(category7);
        		formList.submit();
        	});
        	
            	

        });   //// end $
    </script>
</body>
</html>