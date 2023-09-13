<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="./WEB-INF/views/include/header.jsp" %>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            color: white;
        }
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
            opacity: 0;
            transition: opacity 2s ease;
        }
        
        .item:hover > ul{
            display: block;
            opacity 1;
        }

		.item {
		    transition: margin-top 1s ease; /* 마진 값에 대한 애니메이션 추가 */
		}

		.item:hover {
		    margin-top: 0; /* 호버 시 마진 값을 0으로 변경하여 이동 애니메이션 적용 */
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
    <div class="bg">
        <div class="container-fluid">
            <div class="col-sm-4">
                <h1 style="margin-top: 50px;">logo</h1>
                <div id="listid">          
                    <li class="item" style="margin-top: 50px;"><!-- 메 -->
	                   Alcoholddd
	                   <ul>
	                       <li id="lilist"><a href="#">진</a></li>
	                       <li id="lilist"><a href="#">럼</a></li>
	                       <li id="lilist"><a href="#">위스키</a></li>
	                       <li id="lilist"><a href="#">보드카</a></li>
	                       <li id="lilist"><a href="#">와인</a></li>
	                       <li id="lilist"><a href="#">칵테일</a></li>
	                       <li id="lilist"><a href="#">하이볼</a></li>
	                   </ul>
	          		</li>
	          		
                   	<div style="margin-top: 50px;">
                       <label id="solo"><a href="#">나만의 레시피</a></label>
                   	</div>

                   	<div style="margin-top: 50px;">
                       <label id="solo"><a href="">MyPage</a></label>
                   	</div>

                   	<div style="margin-top: 50px;">
                       <label id="solo"><a href="#">Store</a></label>
                   	</div>

                   	<div style="margin-top: 350px;" id="logindiv">
                       <label><a href="${path}/member/login">login</a> | <a href="${path}/member/join">sign on</a></label>
                   	</div>
                </div>
            </div>
        </div>
    </div>

    <script>
        
    </script>
</body>
</html>