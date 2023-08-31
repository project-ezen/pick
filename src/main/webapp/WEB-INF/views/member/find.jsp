<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    }
</style>
</head>
<script>
function checkNameAndTel() {
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
                var verificationCode = Math.floor(Math.random() * 900000) + 100000;
                alert("인증번호: " + verificationCode);
            } else {
                alert("이름과 전화번호가 일치하지 않습니다.");
            }
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}

function checkNameAndNick() {
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
                var verificationCode = Math.floor(Math.random() * 900000) + 100000;
                alert("인증번호: " + verificationCode);
            } else {
                alert("이름과 닉네임이 일치하지 않습니다.");
            }
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}

function checkIDAndTel() {
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
                var verificationCode = Math.floor(Math.random() * 900000) + 100000;
                alert("인증번호: " + verificationCode);
            } else {
                alert("이름과 닉네임이 일치하지 않습니다.");
            }
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
}

$(document).ready(function(){
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
});

</script>


<body>
	<%@ include file="../include/topMenu.jsp" %>
    <div class="container">
        <h2 class="text-center">아이디 / 비밀번호 찾기</h2><br/><br/>
        <ul class="nav nav-tabs text-center" style="width: 100%;">
		    <li class="active" style="width: 50%;"><a class="text-center" data-toggle="tab" href="#findID">아이디 찾기</a></li>
		    <li style="width: 50%;"><a class="text-center" data-toggle="tab" href="#findPW">비밀번호 찾기</a></li>
		</ul>

        <div class="tab-content">
            <div id="findID" class="tab-pane fade in active"><br/>
			    <h3 class="text-center">아이디 찾기</h3>
			    <form action="/member/findID" method="post">
				    <div class="form-group text-center">
				        <div class="radio" style="display:inline-block; margin-right:10px;">
				            <label><input type="radio" name="searchOption" value="tel" checked>휴대폰 번호로 찾기</label>
				        </div> &nbsp;
				        <div class="radio" style="display:inline-block;">
				            <label><input type="radio" name="searchOption" value="nickname">닉네임으로 찾기</label>
				        </div>
				    </div>
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
					            <button type="button" class="btn btn-default" onclick="checkNameAndTel()">인증번호 받기</button>
					        </div>
					    </div>
					</div>
					
				    <div class="form-group" id="telCode">
				    <div class="row col-md-offset-2">
				        <label>인증번호</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				     		   <input type="text" class="form-control" placeholder="인증번호를 입력하세요">
				     		</div>
				     		<div class="col-md-4">
					   	    	<button type="submit" class="btn btn-default">확인</button>
					        </div>
					    </div>
				    </div>
				    
				    <div class="form-group" id="m_nickname_div" style="display:none;">
				    <div class="row col-md-offset-2">
				        <label>닉네임</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				       			<input type="text" class="form-control" id="m_nickname" name="m_nickname" placeholder="닉네임을 입력하세요">
				       		</div>
				       		<div class="col-md-4">
				       			<button type="button" class="btn btn-default" onclick="checkNameAndNick()">인증번호 받기</button>
				        	</div>
				       	</div>
				    </div>
				    
				    <div id="nicknameCode" style="display:none;">
				    <div class="row col-md-offset-2">
				        <label>인증번호</label>
				    </div>
				        <div class="row">
				        	<div class="col-md-6 col-md-offset-2">
				        		<input type="text" class="form-control" placeholder="인증번호를 입력하세요">
				        	</div>
				        	<div class="col-md-4">
				        		<button type="submit" class="btn btn-default">확인</button>
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
					            <button type="button" class="btn btn-default" onclick="checkIDAndTel()">인증번호 받기</button>
					        </div>
					    </div>
					</div>
					
					<div class="form-group">
					<div class="row col-md-offset-2">
					    <label>인증번호</label>
					</div>
					    <div class="row">
					        <div class="col-md-6 col-md-offset-2">
					            <input type="text" class="form-control" placeholder="인증번호를 입력하세요">
					        </div>
					        <div class="col-md-4">
					            <button type="submit" class="btn btn-default">확인</button>
					        </div>
					    </div>
					</div>
				</form>
			</div>
		</div>
	</div>

    <%@ include file="../include/footer.jsp" %>
</body>


</html>
