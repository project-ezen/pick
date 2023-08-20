<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@ include file="./WEB-INF/views/include/header.jsp" %>
    <style>
        .login {
            width: 400px;
            margin: 0 auto;
            margin-top: 50px;
        }
        .social-buttons {
            text-align: center;
            margin-top: 15px;
        }
		
        .form-control {
            border-radius: 0 10px 10px 0;
        }
       
        #login-button {
            width: 400px;
            border-radius: 10px;
        }
        
        .col-sm-6 {
		padding-left:	150px;	
		}
		
		.group {
			align-content: center;
		}
        
        body { 	
    	background-image:url("./resources/images/background2.jpg");
    	background-attachment: fixed, scroll;
    	background-repeat:no-repeat;
   	 	background-size:cover;
		}

		#class {
		background-color:	#FFFFFF;
		text-align:			center;
		border-radius:		10px;
		padding: 30px 30px 30px 30px;
    	margin-top:		150PX ;
    	width:			500px;
    	height:			500px;
		margin-bottom: 150px;
		}
		
		.googlebtn {
		box-shadow:inset 0px 1px 0px 0px #f5978e;
		background:linear-gradient(to bottom, #f24537 5%, #c62d1f 100%);
		background-color:#f24537;
		border-radius:6px;
		border:1px solid #d02718;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:15px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px 1px 0px #810e05;
			&:hover {
			background:linear-gradient(to bottom, #c62d1f 5%, #f24537 100%);
			background-color:#c62d1f;
			}
			 &:active {
				position:relative;
				top:1px;
			}
		}
		
		
    </style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
    <div class="container" id="class">
    	<form class="form-horizontal"  method="post" id="loginForm">
		    <!-- 로그인을 하지 않고 들어온 경우 -->
				<c:if test="${member==null}">
					<div class="form-group">
						<div class="col-sm-2"></div>
						<h2 align="center">Login</h2>
					</div>
					<div class="group">
						<div class="form-group">
							<div class="center">
								<input type="text"  name="id" id="id" placeholder="아이디를 입력하세요" maxlength="10"/>
							</div>
						</div>	
							
						<div class="form-group">
							<div class="center">
								<input type="password"  name="passwd" id="passwd" placeholder="비밀번호를 입력하세요" maxlength="10"/>
							</div>	
						</div>
						<div>
							<a href="#">아이디 찾기&nbsp;&nbsp;</a> |
				   	        <a href="#">&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;</a> |
				  	        <a href="#">&nbsp;&nbsp;회원 가입&nbsp;&nbsp;</a>
						</div>
						<div class="form-group">
							<button class="btn btn-success" type="submit" id="submit">로그인</button>
							<button class="btn btn-primary" type="button" id="registerBtn">회원가입</button>
							<button class="btn btn-danger cancel" type="button">취소</button>
						</div>
					</div>
				</c:if>
					
				<!-- 로그인을 하고 들어온 경우 -->
				<!-- session을 체트하기 위해서 상단에 page session값을 true로 설정해야 한다 -->
				<c:if test="${member!=null}">
					<div class="form-group">
						<a href=".member/mypage.do">MyPage(${member.id})</a>
					</div>
				</c:if>
				<!-- msg가 false인 경우 -->
				<c:if test="${msg==false}">
					<div class="col-sm-8">
						<div class="jumbotron">
							<h2 align="center">로그인을 실패하였습나다. 아이디와 비밀번호를 확인하신 후에 다시 입력해주세요.</h2>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-8">
							<div style="background: #dcdcdc; color:#B9062F;">로그인을 실패하였습나다. 아이디와 비밀번호를 확인하신 후에 다시 입력해주세요.</div>
						</div>
					</div>
				</c:if>
				<c:if test="${result== 'fall'}">
					<p>로그인에 실패하였습니다.</p>
				</c:if>         
            </form>
        </div>
	<br/>
    <%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>
