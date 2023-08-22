<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@ include file="./WEB-INF/views/include/header.jsp" %>
    <style>
    	body 	{ 	
		   	background-image:url("./resources/images/background2.jpg");
		   	background-attachment: fixed, scroll;
		   	background-repeat:no-repeat;
		  	background-size:cover;
		}

        .login {
        	background-color:	#FFFFFF;
			text-align:			center;
			border-radius:		10px;
			padding: 30px 30px 30px 30px;
			margin: 0 auto;
		   	margin-top:		150PX ;
			margin-bottom: 150px;
            width: 400px;
        }
        
        .social-buttons {
            text-align: center;
            margin-top: 15px;
        }
        
        #kakao-login,
        #naver-login,
        #google-login {
            border-radius: 10px;
            width: 275px;
        }
        .form-control {
            border-radius: 0 10px 10px 0;
        }
        .input-group {
            margin-bottom: 10px;
        }
        .input-group-addon {
            border-radius: 10px 0 0 10px;
        }
        
        #login-button {
            width: 300px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
    <div class="login" >
    	
        <div>
            <div class="login-header">
                <h1 class="text-center">Login</h1><br><br>
            </div>
            <div>
                <form method="post" action="witchs_pick_login" id="login-form">
                
                	<!-- 로그인을 하지 않고 들어온 경우 -->
                	<c:if text="${member == null}">
                    <div class="form-group">
                        <div>
                            <div>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="User Name">
                                </div>
                            </div>
                            <div>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-lock"></span>
                                    </span>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="login-button">
                            <button type="submit" class="btn btn-primary" id="login-button" >로그인</button>
                        </div>
                    </div>
                    <div class="form-group">                            
                        <div class="text-center">
                            <a href="#">아이디 찾기&nbsp;&nbsp;</a> |
                            <a href="#">&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;</a> |
                            <a href="#">&nbsp;&nbsp;회원 가입&nbsp;&nbsp;</a>
                        </div>
                    </div><br>
                <div class="social-buttons">
                    <button type="submit" class="btn btn-warning" id="kakao-login">카카오 로그인</button>
                </div>
                <div class="social-buttons">
                    <button type="submit" class="btn btn-success" id="naver-login">네이버 로그인</button>
                </div>
                <div class="social-buttons">
                    <button type="submit" class="btn btn-danger" id="google-login">구글 로그인</button>
                </div>
                </c:if>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="./WEB-INF/views/include/footer.jsp" %>
    
    <script>
    	$(document).ready(function() {
    		$("#submit").on("click", function() {
    			
    		});
    	});
    </script>
</body>
</html>
