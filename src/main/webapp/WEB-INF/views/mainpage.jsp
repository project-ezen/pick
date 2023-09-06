<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session ="true" %>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<title>Insert title here</title>
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
            display: none;
            color: white;
        }
        
        .item:hover > ul{
            display: block;
        }

        ul {
            list-style: none;
        }
        li {
            list-style: none;
        }
        .item {
            font-size: 30px;
        }
        #logindiv {
            position: fixed;
            bottom: 10px;
            width: 100;
            font-size: large;
            color:white;
        }
        a:link {
            color: white;
            text-decoration-line: none;
        }
        #solo {
            font-size: 25px;
        }
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
                <h1 style="margin-top: 50px;">logo</h1>
                <form id="formList" action="/sole/sole" method="get">
                	<input type="hidden" name="alcohole_category"/>
                </form>
                <div id="listid">          
                    <li class="item" style="margin-top: 50px;"><!-- 잠시 -->
	                   Alcohol
	                   <ul>
	                       <li id="lilist"><a href="#">진</a></li>
	                       <li id="lilist"><a href="#">럼</a></li>
	                       <li id="lilist"><a href="#">위스키</a></li>
	                       <li id="lilist"><a href="#">보드카</a></li>
	                       <li id="lilist"><a href="#">와인</a></li>
	                       <li id="lilist" class="cacktail"><a href="#">칵테일</a></li>
	                       <li id="lilist" class="hiball"><a href="#">하이볼</a></li>
	                   </ul>
	          		</li>
	          		
                   	<div style="margin-top: 50px;">
                       <label id="solo"><a href="${path}/board/articleList">나만의 레시피</a></label>
                   	</div>

                   	<div style="margin-top: 50px;">
                       <label id="solo"><a href="javascript:fn_mypage('${member.m_id}','${path}/member/mypage','${path}/member/login')">MyPage</a></label>
                   	</div>

                   	<div style="margin-top: 50px;">
                       <label id="solo"><a href="#">Store</a></label>
                   	</div>
                   	<div style="margin-top: 350px;" id="logindiv">
                   	<c:choose>
						<%-- 로그인이 되지 않은 경우 --%>
						<c:when test="${ isLogOn != true }">
	                       <label><a href="${path}/member/login">login</a> | <a href="${path}/member/join">sign on</a></label>
	                   	</c:when>
	                   	<%-- 로그인이 된 경우 --%>
	                	<c:when test="${ isLogOn == true }">
	                       <label><a href="${path}/member/logout">logout</a></label>
	                   	</c:when>
                   	</c:choose>
                   	</div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function fn_mypage( member , mypageForm , loginForm) {
        	if(member != '' || member != null) {        // 세션 member의 값이 '' 이거나 
        		location.href = mypageForm;
    		} else{
    			alert("로그인을 해주세요");
    			location.href = loginForm + '?action=/member/mypage';
    		} 
        }
        
        $(document).ready(function() {
        	var formList = $("#formList");
        	var category1 = 1;
        	var category2 = 2;
        	
        	$(".cacktail").click(function (){
        		formList.find("[name='alcohole_category']").val(category1);
        		formList.submit();
        	});
        	
        	$(".hiball").click(function (){
        		formList.find("[name='alcohole_category']").val(category2);
        		formList.submit();
        	});
        });
    </script>
</body>
</html>