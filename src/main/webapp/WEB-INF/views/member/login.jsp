<!-- session을 체트하기 위해서 상단에 page session값을 true로 설정해야 한다 -->
<%@ page session="true"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name ="google-signin-client_id" content="1020197686297-vdpv23o5pbik0rml0is9e4oqv3jl2j6n.apps.googleusercontent.com">
    <title>Login Page</title>
    <%@ include file="../include/header.jsp" %>
    <style>
        .login {
        	background-color:	#FFFFFF;
			text-align:			center;
			border-radius:		10px;
			padding: 30px;
			margin: 0 auto;
		   	margin-top:		150PX ;
			margin-bottom: 150px;
            width: 400px;
        }
        
        .foot { padding-bottom: 20px; padding-top: 20px; margin:auto; }
        
        .social-buttons {  text-align: center;  margin-top: 15px; }
        
        #kakaoLogin,
        .naverLogin,
        .googleLogin {
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
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js" integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
    <script>Kakao.init('8ebd75cf75f3f5574a71e06fbbc387a9');</script>  <!-- 사용하려는 앱의 JavaScript 키 입력 -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</head>

<script type="text/javascript"> // 로그인 된 상태로 뒤로가기를 눌러서 접근하면 메인페이지로 넘겨버림
	
	var referrer = document.referrer;

	window.onpageshow = function(event) {
    	if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
        	alert("메인 페이지로 이동합니다.");
        	
        	//var backUrl = "http://localhost:8056/#";
        	
        	window.location.href = referrer;    
        }
}     //
</script>

<body>
<%@ include file="../include/topMenu.jsp" %>
<div class="foot">
    <div class="login" >
    	<form class="form-horizontal" id="loginForm">
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
                    <button class="btn btn-primary" id="loginButton" >로그인</button>
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
	            <button type="button" class="btn btn-warning" id="kakaoLogin" onClick="loginWithKakao()" >카카오 로그인</button>
	           
	        </div>
	        <div class="social-buttons">
	            <button type="button" class="btn btn-success naverLogin" id="naverIdLogin_loginButton">네이버 로그인</button>
	        </div>
	        <!-- <ul>
	        	<li onclick="naverLogout(); return false;">
			      <a href="javascript:void(0)">
			          <span>네이버 로그아웃</span>
			      </a>
				</li>
			</ul> -->
			
			<div class="social-buttons">
	            <button type="button" class="btn btn-danger googleLogin" id="GgCustomLogin">구글 로그인</button>
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
    	// 카카오
	    function loginWithKakao() {
	    	console.log("ok");
	        Kakao.Auth.authorize({
	        	
	        });
	      }
	    
    	
	    /* function kakaoLogout() {
	        if (Kakao.Auth.getAccessToken()) {
	          Kakao.API.request({
	            url: '/v1/user/unlink',
	            success: function (response) {
	            	console.log(response)
	            },
	            fail: function (error) {
	              console.log(error)
	            },
	          })
	          Kakao.Auth.setAccessToken(undefined)
	        }
	      }  */
	    
	    
	    // 네이버
	    var naverLogin = new naver.LoginWithNaverId(
	    		{
	    			clientId: "jwxrW4EpGgFNKNpH_wNr", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
	    			callbackUrl: "http://localhost:8085/", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
	    			isPopup: false,
	    			// callbackHandle: true
	    		}
	    	);	

	    naverLogin.init();

	    /* window.addEventListener('load', function () {
	    	naverLogin.getLoginStatus(function (status) {
	    		if (status) {
	    			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
	        		
	    			console.log(naverLogin.user); 
	        		
	                if( email == undefined || email == null) {
	    				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
	    				naverLogin.reprompt();
	    				return;
	    			}
	    		} else {
	    			console.log("callback 처리에 실패하였습니다.");
	    		}
	    	});
	    });
	    
	    var testPopUp;
	    function openPopUp() {
	        testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	    }
	    function closePopUp(){
	        testPopUp.close();
	    }

	    function naverLogout() {
	    	openPopUp();
	    	setTimeout(function() {
	    		closePopUp();
	    		}, 1000);
	    } */
	    
	    
	  // 구글
	    function init() {
	    	gapi.load('auth2', function() {
	    		gapi.auth2.init();
	    		options = new gapi.auth2.SigninOptionsBuilder();
	    		options.setPrompt('select_account');
	            // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
	    		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
	            // 인스턴스의 함수 호출 - element에 로그인 기능 추가
	            // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
	    		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	    	})
	    }

	
	    function onSignIn(googleUser) {
	    	var access_token = googleUser.getAuthResponse().access_token
	    	$.ajax({
	        	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
	    		url: 'https://people.googleapis.com/v1/people/me'
	            // key에 자신의 API 키를 넣습니다.
	    		, data: {personFields:'birthdays', key:'AIzaSyDAYdJRrrmUJCUkUup3Zvih9g2dDqmxxRs', 'access_token': access_token}
	    		, method:'GET'
	    	})
	    	.done(function(e){
	            //프로필을 가져온다.
	    		var profile = googleUser.getBasicProfile();
	    		console.log(profile)
	    	})
	    	.fail(function(e){
	    		console.log(e);
	    	})
	    }
	    function onSignInFailure(t){		
	    	console.log(t);
	    }
	    
	    
	    //
    	$(document).ready(function() {
    		// 로그인 버튼을 눌렀을 경우
    		$("#loginButton").on("click", function() {
    			$("#loginForm").prop("action", "/member/login");
    			$("#loginForm").prop("method", "post");
    			
    			// 아이디와 비밀번호는 꼭 입력해야 한다.
    			// 아이디와 비밀번호는 4자리 이상 입력해야 한다.
    			
    			if($("#m_id").val() == "") {
    				alert("이메일을 입력해주세요.");
    				$("#m_id").focus();
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
