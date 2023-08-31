<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 / 비밀번호 찾기</title>
    <%@ include file="./WEB-INF/views/include/header.jsp" %>
</head>
<style>
    .container {
        width: 			25%;
        margin:	 		auto;
        margin-top:		150PX ;
		margin-bottom: 	150px;
    	min-width: 		500px; 
    }
    .offset {
    	margin-left: 12%;
    }
    
    
    
</style>

<script>
$(document).ready(function(){
    $('input[type=radio][name=searchOption]').change(function() {
        if (this.value == 'tel') {
            $('#m_tel').show();
            $('#authCodeTel').show();
            $('#m_email').hide();
            $('#authCodeEmail').hide();
        }
        else if (this.value == 'email') {
            $('#m_email').show();
            $('#authCodeEmail').show();
            $('#m_tel').hide();
            $('#authCodeTel').hide();
        }
    });
});


</script>

<body>
	<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
    <div class="container">
    <br/>
        <h2 class="text-center">아이디 / 비밀번호 찾기</h2><br/><br/>
        <ul class="nav nav-tabs text-center" style="width: 100%;">
		    <li class="active" style="width: 50%;"><a class="text-center" data-toggle="tab" href="#findID">아이디 찾기</a></li>
		    <li style="width: 50%;"><a class="text-center" data-toggle="tab" href="#findPW">비밀번호 찾기</a></li>
		</ul>
	<br/>
        <div class="tab-content">
            <div id="findID" class="tab-pane fade in active"><br/>
			    <h3 class="text-center">아이디 찾기</h3>
			    <form action="/member/findID" method="post">
				    <div class="form-group text-center">
				        <div class="radio" style="display:inline-block; margin-right:10px;">
				            <label><input type="radio" name="searchOption" value="tel" checked>휴대폰 번호로 찾기</label>
				        </div> &nbsp;
				        <div class="radio" style="display:inline-block;">
				            <label><input type="radio" name="searchOption" value="email">이메일로 찾기</label>
				        </div>
				    </div>
				    <div class="form-group">
				    <div class="row col-md-offset-2">
					    <label>이름</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" id="name" name="m_name" required>
					        </div>
					    </div>
					</div>

				    <div class="form-group" id="m_tel">
				    <div class="row col-md-offset-2">
					    <label>전화번호</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" id="tel" name="m_tel" required>
					        </div>
					        <div class="col-md-4">
					            <button type="button" class="btn btn-default">인증번호 받기</button>
					        </div>
					    </div>
					</div>
					
				    <div class="form-group" id="authCodeTel">
				    <div class="row col-md-offset-2">
				        <label>인증번호</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				     		   <input type="text" class="form-control" required>
				     		</div>
				     		<div class="col-md-4">
					   	    	<button type="button" class="btn btn-default">확인</button>
					        </div>
					    </div>
				    </div>
				    
				    <div class="form-group" id="m_email" style="display:none;">
				    <div class="row col-md-offset-2">
				        <label>이메일</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				       			<input type="email" class="form-control" id="email" name="m_email" required>
				       		</div>
				       		<div class="col-md-4">
				       			<button type="button" class="btn btn-default">인증번호 받기</button>
				        	</div>
				       	</div>
				    </div>
				    
				    <div id="authCodeEmail" style="display:none;">
				    <div class="row col-md-offset-2">
				        <label>인증번호</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				        		<input type="text" class="form-control" required>
				        	</div>
				        	<div class="col-md-4">
				        		<button type="button" class="btn btn-default">확인</button>
				        	</div>
				      	</div>
				    </div>
				</form>
			</div>

			 <div id="findPW" class="tab-pane fade"><br/>
			    <h3 class="text-center">비밀번호 찾기</h3><br/>
			    <form action="/member/findPW" method="post">
			        <div class="form-group">
			        <div class="row col-md-offset-2">
			            <label>아이디</label>
			        </div>
			            <div class="row">
			                <div class="col-md-6 col-md-offset-2">
			                    <input type="text" class="form-control" id="id" name="m_id" required>
			                </div>
			            </div>
			        </div>
			        
			        <div class="form-group">
			        <div class="row col-md-offset-2">
					    <label>전화번호</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" id="tel" name="m_tel" required>
					        </div>
					        <div class="col-md-4">
					            <button type="button" class="btn btn-default">인증번호 받기</button>
					        </div>
					    </div>
					</div>
					
					<div class="form-group">
					<div class="row col-md-offset-2">
					    <label>인증번호</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" id="authCodePWTel" required>
					        </div>
					        <div class="col-md-4">
					            <button type="button" class="btn btn-default">확인</button>
					        </div>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br/><br/>
    <%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>
