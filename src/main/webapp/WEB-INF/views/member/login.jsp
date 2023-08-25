<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@ include file="../include/header.jsp" %>
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
        
        #kakaoLogin,
        #naverLogin,
        #googleLogin {
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
        
        #loginButton {
            width: 300px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
    <div class="login" >
    	
        <div>
            <div class="login-header">
                <h1 class="text-center">Login</h1><br><br>
            </div>
            <div>
                <form method="post" action="/member/login" id="loginForm">
                
                    <div class="form-group">
                        <div>
                            <div>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-user"></span>
                                    </span>
                                    <input type="text" class="form-control" id="id" name="id" maxlength="20" placeholder="User ID">
                                </div>
                            </div>
                            <div>
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-lock"></span>
                                    </span>
                                    <input type="password" class="form-control" id="passwd" name="passwd" maxlength="20" placeholder="Password">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="login-button">
                            <button type="submit" class="btn btn-primary" id="loginButton" >로그인</button>
                        </div>
                    </div>
                    <div class="form-group">                            
                        <div class="text-center">
                            <a href="/findId.jsp">아이디 찾기&nbsp;&nbsp;</a> |
                            <a href="/findPassword.jsp">&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;</a> |
                            <a href="/member/join">&nbsp;&nbsp;회원 가입&nbsp;&nbsp;</a>
                        </div>
                    </div><br>
                <div class="social-buttons">
                    <button class="btn btn-warning" id="kakaoLogin">카카오 로그인</button>
                </div>
                <div class="social-buttons">
                    <button class="btn btn-success" id="naverLogin">네이버 로그인</button>
                </div>
                <div class="social-buttons">
                    <button class="btn btn-danger" id="googleLogin">구글 로그인</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    	$(document).ready(function() {
    		// 로그인 버튼을 눌렀을 경우
    		$("#loginButton").on("click", function() {
    			// 아이디와 비밀번호는 꼭 입력해야 한다.
    			// 아이디와 비밀번호는 4자리 이상 입력해야 한다.
    			
    			if($("#id").val() == "") {
    				alert("이메일을 입력해주세요.");
    				$("#Id").focus();
    				return false;
    			}
    			
    			
    			document.getElementById("loginForm").submit();
    			return false;
    		});
    </script>
</body>
</html>
