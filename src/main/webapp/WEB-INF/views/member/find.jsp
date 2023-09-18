<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 / 비밀번호 찾기</title>
    <%@ include file="../include/header.jsp" %>
<style>
    .container {
        width: 25%;
        margin: auto;
        margin-top:		150PX ;
		margin-bottom: 150px;
		min-width: 500px;
        width: 			25%;
        margin: 		auto;
        margin-bottom: 150px; 
		margin-top: 	150px;
    }
    .foot { padding-bottom: 50px; padding-top: 	50px; }
    
</style>
</head>

<script>
let confirmCode ;

$(document).ready(function() {
    $('input[type=radio][name=searchOption]').change(function() {
        if (this.value == 'tel') {
            $('#m_tel_div').show();
            $('#telCode').show();
            $('#m_nickname_div').hide();
            $('#nicknameCode').hide();
        }
        else if (this.value == 'nickname') {
            $('#m_nickname_div').show();
            $('#nicknameCode').show();
            $('#m_tel_div').hide();
            $('#telCode').hide();
        }
    });
    
	// 아이디 찾기
	// 이름과 전화번호로 인증번호 받기.
	$("#checkNameAndTel").on("click", function() {
		
	    var name = $("#m_name").val();
	    var tel = $("#m_tel_ID").val();
	
	    if (!name) {
	        alert("이름을 입력하십시오.");
	        $("#m_name").focus();
	        return;
	    }
	    if (!tel) {
	        alert("전화번호를 입력하십시오.");
	        $("#m_tel_ID").focus();
	        return;
	    }
	
	    $.ajax({
	        url: '/member/checkNameAndTel',
	        type: 'POST',
	        dataType: 'json',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            m_name: name,
	            m_tel: tel
	        }),
	        success: function(data) {
	            if (data === 1) {
	                confirmCode = Math.floor(Math.random() * 900000) + 100000;
	                alert("인증번호는 " + confirmCode + "입니다.");
	            } else {
	                alert("이름과 전화번호가 일치하지 않습니다.");
	            }
	        },
	        error: function(error) {
	            console.error('Error:', error);
	        }
	    });
	});
	// 이름과 닉네임으로 인증번호 받기
	$("#checkNameAndNick").on("click", function() {
	
	    var name = $("#m_name").val();
	    var nick = $("#m_nickname").val();
	
	    if (!name) {
	        alert("이름을 입력하십시오.");
	        $("#m_name").focus();
	        return;
	    }
	    if (!nick) {
	        alert("닉네임을 입력하십시오.");
	        $("#m_nickname").focus();
	        return;
	    }
	
	    $.ajax({
	        url: '/member/checkNameAndNick',
	        type: 'POST',
	        dataType: 'json',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            m_name: name,
	            m_nickname : nick
	        }),
	        success: function(data) {
	            if (data === 1) {
	                confirmCode = Math.floor(Math.random() * 900000) + 100000;
	                alert("인증번호는 " + confirmCode + "입니다.");
	            } else {
	                alert("이름과 닉네임이 일치하지 않습니다.");
	            }
	        },
	        error: function(error) {
	            console.error('Error:', error);
	        }
	    });
	});

	// 인증번호 입력하기(ID 찾기)
 	$("#confirmCode_NTB").on("click", function() {
        var IDCode = $("#confirmCode_ID").val();
        var tel = $("#m_tel_ID").val();
        
        if (IDCode == confirmCode) {
        	
        	$.ajax({
        	    url: '/member/findID',
        	    type: 'POST',
        	    dataType: 'text',
        	    contentType: 'application/json',
        	    data: tel,
        	    success: function(data) {
        	        alert("아이디는 " + data + "입니다.");
        	    }, error: function(data) {
        	        alert("뭐가 문제인거시냐");
        	    }
        	});
        } else {
        			alert("인증번호가 일치하지 않습니다.");
        }
 	});
	
 	$("#confirmCode_NNB").on("click", function() {
        var IDCode = $("#confirmCode_ID2").val();
        var nick = $("#m_nickname").val();
        
        if (IDCode == confirmCode) {
        	
        	$.ajax({
        	    url: '/member/findID2',
        	    type: 'POST',
        	    dataType: 'text',
        	    contentType: 'application/json',
        	    data: nick,
        	    success: function(data) {
        	        alert("아이디는 " + data + "입니다.");
        	    }, error: function(data) {
        	        alert("뭐가 문제인거시냐");
        	    }
        	});
        } else {
        			alert("인증번호가 일치하지 않습니다.");
        }
 	});
        	

	// 비밀번호 찾기
	// 아이디와 전화번호로 인증번호 받기
	$("#checkIDAndTel").on("click", function() {
	
	    var id = $("#m_id").val();
	    var tel = $("#m_tel_PW").val();
	
	    if (!id) {
	        alert("아이디를 입력하십시오.");
	        $("#m_id").focus();
	        return;
	    }
	    if (!tel) {
	        alert("전화번호를 입력하십시오.");
	        $("#M_tel_PW").focus();
	        return;
	    }
	
	    $.ajax({
	        url: '/member/checkIDAndTel',
	        type: 'POST',
	        dataType: 'json',
	        contentType: 'application/json',
	        data: JSON.stringify({
	            m_id: id,
	            m_tel : tel
	        }),
	        success: function(data) {
	            if (data === 1) {
	                confirmCode = Math.floor(Math.random() * 900000) + 100000;
	                alert("인증번호는 " + confirmCode + "입니다.");
	            } else {
	                alert("아이디와 전화번호가 일치하지 않습니다.");
	            }
	        },
	        error: function(error) {
	            console.error('Error:', error);
	        }
	    });
	});
	
	// 인증번호 입력하기(PW)
	$("#confirmCode_ITB").on("click", function() {
        var IDCode = $("#confirmCode_PW").val();
        var ID = $("#m_id").val();
        
        if (IDCode == confirmCode) {
        	
        	$.ajax({
        	    url: '/member/findPW',
        	    type: 'POST',
        	    dataType: 'text',
        	    contentType: 'application/json',
        	    data: ID,
        	    success: function(data) {
        	        alert("비밀번호는 " + data + "입니다.");
        	    }, error: function(data) {
        	        alert("뭐가 문제인거시냐");
        	    }
        	});
        } else {
        			alert("인증번호가 일치하지 않습니다.");
        }
 	});
});

</script>

<body>
	<%@ include file="../include/topMenu.jsp" %>
<div class="foot">	
    <div class="container">
    <br/>
        <h2 class="text-center">아이디 / 비밀번호 찾기</h2><br/><br/>
        <ul class="nav nav-tabs text-center" style="width: 100%;">
		    <li class="active" style="width: 50%;"><a class="text-center" data-toggle="tab" href="#findID">아이디 찾기</a></li>
		    <li style="width: 50%;"><a class="text-center" data-toggle="tab" href="#findPW">비밀번호 찾기</a></li>
		</ul>
		
        <div class="tab-content">
            <div id="findID" class="tab-pane fade in active"><br/>
			    <h3 class="text-center">아이디 찾기</h3>
			    <form method="post">
				<br/>
				    <div class="form-group text-center">
				        <div class="radio" style="display:inline-block; margin-right:10px;">
				            <label><input type="radio" name="searchOption" value="tel" checked>휴대폰 번호로 찾기</label>
				        </div> &nbsp;
				        <div class="radio" style="display:inline-block;">
				            <label><input type="radio" name="searchOption" value="nickname">닉네임으로 찾기</label>
				        </div>
				    </div>
				    
				    <!-- 이름 / 전화번호로 찾기 -->
				    <div class="form-group">
				    <div class="row col-md-offset-2">
					    <label>이름</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" id="m_name" name="m_name" placeholder="이름을 입력하세요">
					        </div>
					    </div>
					</div>

				    <div class="form-group" id="m_tel_div">
				    <div class="row col-md-offset-2">
					    <label>전화번호</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" id="m_tel_ID" name="m_tel" placeholder="ex) 010-1234-5678">
					        </div>
					        <div class="col-md-4">
					            <button type="button" class="btn btn-default" id="checkNameAndTel">인증번호 받기</button>
					        </div>
					    </div>
					</div>
					
				    <div class="form-group" id="telCode">
				    <div class="row col-md-offset-2">
				        <label>인증번호</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				     		   <input type="text" class="form-control" id="confirmCode_ID" placeholder="인증번호를 입력하세요">
				     		</div>
				     		<div class="col-md-4">
					   	    	<button type="button" class="btn btn-default" id="confirmCode_NTB">확인</button>
					        </div>
					    </div>
				    </div>
				    
				    <!-- 이름 / 닉네임으로 찾기 -->
				    <div class="form-group" id="m_nickname_div" style="display:none;">
				    <div class="row col-md-offset-2">
				        <label>닉네임</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				       			<input type="text" class="form-control" id="m_nickname" name="m_nickname" placeholder="닉네임을 입력하세요">
				       		</div>
				       		<div class="col-md-4">
				       			<button type="button" class="btn btn-default" id="checkNameAndNick">인증번호 받기</button>
				        	</div>
				       	</div>
				    </div>
				    
				    <div id="nicknameCode" style="display:none;">
				    <div class="row col-md-offset-2">
				        <label>인증번호</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				        		<input type="text" class="form-control" id="confirmCode_ID2" placeholder="인증번호를 입력하세요">
				        	</div>
				        	<div class="col-md-4">
				        		<button type="button" class="btn btn-default" id="confirmCode_NNB">확인</button>
				        	</div>
				      	</div>
				    </div>
				</form>
			</div>

			 <div id="findPW" class="tab-pane fade"><br/>
			    <h3 class="text-center">비밀번호 찾기</h3><br/>
			    <form method="post">
			        <div class="form-group">
			        <div class="row col-md-offset-2">
			            <label>아이디</label>
			        </div>
			            <div class="row">
			                <div class="col-md-6 col-md-offset-2">
			                    <input type="text" class="form-control" id="m_id" name="m_id" placeholder="아이디를 입력하세요">
			                </div>
			            </div>
			        </div>
			        
			        <div class="form-group">
			        <div class="row col-md-offset-2">
					    <label>전화번호</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" id="m_tel_PW" name="m_tel" placeholder="ex) 010-1234-5678">
					        </div>
					        <div class="col-md-4">
					            <button type="button" class="btn btn-default" id="checkIDAndTel">인증번호 받기</button>
					        </div>
					    </div>
					</div>
					
					<div class="form-group">
					<div class="row col-md-offset-2">
					    <label>인증번호</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" id="confirmCode_PW" placeholder="인증번호를 입력하세요">
					        </div>
					        <div class="col-md-4">
					            <button type="button" class="btn btn-default" id="confirmCode_ITB">확인</button>
					        </div>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br/><br/>
</div>	
    <%@ include file="../include/footer.jsp" %>
</body>


</html>
