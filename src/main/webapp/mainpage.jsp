<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
    <div class="bg">
        <div class="container-fluid">
            <div class="col-sm-4">
                <h1 style="margin-top: 50px;">logo</h1>
                
                <div id="listid">          
                    <li class="item" style="margin-top: 50px;">
	                   Alcohol
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
                       <label id="solo"><a href="#">MyPage</a></label>
                   	</div>

                   	<div style="margin-top: 50px;">
                       <label id="solo"><a href="#">Store</a></label>
                   	</div>

                   	<div style="margin-top: 350px;" id="logindiv">
                       <label><a href="#">login</a> | <a href="#">sign on</a></label>
                   	</div>
                </div>
            </div>
        </div>
    </div>

    <script>
        
    </script>
</body>
</html>