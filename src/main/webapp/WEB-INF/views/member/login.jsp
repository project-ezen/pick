<!-- session을 체트하기 위해서 상단에 page session값을 true로 설정해야 한다 -->
<%@ page session="true"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@ include file="../include/header.jsp" %>
    <style>
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
        
        .foot { padding-bottom: 20px; padding-top: 20px; margin:auto; }
        
        .social-buttons {  text-align: center;  margin-top: 15px; }
        
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
<div class="foot">
    <div class="login" >
    	<form  class="form-horizontal" action="/member/login" method="post" id="loginForm">
        <div class="login-header">
            <h1 class="text-center">Login</h1><br><br>
        </div>
            <div class="form-group">
                <div>
                    <div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-user"></span>
                            </span>
                            <input type="text" class="form-control" id="m_id" name="m_id" maxlength="20" placeholder="User ID">
                        </div>
                    </div>
                    <div>
                        <div class="input-group">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password" class="form-control" id="m_pw" name="m_pw" maxlength="20" placeholder="Password">
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
                    <a href="/member/find">아이디 / 비밀번호 찾기&nbsp;&nbsp;</a> |
                    <a href="/member/join">&nbsp;&nbsp;회원 가입&nbsp;&nbsp;</a>
                </div>
	        </div>
	        <br>
	        <div class="social-buttons">
	            <button class="btn btn-warning" id="kakaoLogin">카카오 로그인</button>
	        </div>
	        <div class="social-buttons">
	            <button class="btn btn-success" id="naverLogin">네이버 로그인</button>
	        </div>
	        <div class="social-buttons">
	            <button class="btn btn-danger" id="googleLogin">구글 로그인</button>
	        </div>
	        
	        <!-- msg가 false인 경우 -->
			<c:if test="${msg == false}">
				<script>
				alert("로그인을 실패하였습니다. 아이디와 비밀번호를 확인해주세요.");
				</script>
			</c:if>
	    </form>
	</div>
</div>
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    	$(document).ready(function() {
    		// 로그인 버튼을 눌렀을 경우
    		$("#loginButton").on("click", function() {
    			// 아이디와 비밀번호는 꼭 입력해야 한다.
    			// 아이디와 비밀번호는 4자리 이상 입력해야 한다.
    			
    			if($("#m_id").val() == "") {
    				alert("이메일을 입력해주세요.");
    				$("#m_Id").focus();
    				return false;
    			}
    			if($("#m_pw").val() == "") {
    				alert("비밀번호를 입력해주세요.");
    				$("#m_pw").focus();
    				return false;
    			}
    			
    			
    			document.getElementById("loginForm").submit();
    			return false;
    		});
    	});
    </script>
</body>
</html>
