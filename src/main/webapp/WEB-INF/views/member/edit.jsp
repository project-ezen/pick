<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <%@ include file="../include/header.jsp" %>
    
    <style>
    	.container { background-color: rgba(255, 255, 255, 0.88);}
    	
    	.foot { padding-bottom: 100px; padding-top: 100px;}
    	
        .update-form {
            width: 600px;
            margin: auto;
            padding: 30px;
        }
        .form-group {
			width: 350px;
			margin: auto;
			margin-bottom: 10px;
        }
        .update-button-group {
            text-align: center;
            margin-top: 20px;
        }
		#insertButton {
			margin-right: 50px;
		}
		
		.check {
		box-shadow:inset 0px 0px 15px 3px #276873;
		background:linear-gradient(to bottom, #599bb3 5%, #408c99 100%);
		background-color:#599bb3;
		border-radius:17px;
		border:1px solid #29668f;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:13px;
		padding:6px 13px;
		text-decoration:none;
		text-shadow:0px 1px 0px #3d768a;
			&:hover {
			background:linear-gradient(to bottom, #408c99 5%, #599bb3 100%);
			background-color:#408c99;
			}
		 	&:active {
			position:relative;
			top:1px;
			}
 		}
 		
		.submit {
		box-shadow:inset 0px 0px 15px 3px #1564ad;
		background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
		background-color:#79bbff;
		border-radius:17px;
		border:1px solid #337bc4;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:13px;
		padding:6px 13px;
		text-decoration:none;
		text-shadow:0px 1px 0px #528ecc;
			&:hover {
			background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
			background-color:#378de5;
			}
				&:active {
			position:relative;
			top:1px;
			}
		}
		.cancel {
		box-shadow:inset 0px 0px 15px 3px #f29c93;
		background:linear-gradient(to bottom, #fe1a00 5%, #ce0100 100%);
		background-color:#fe1a00;
		border-radius:17px;
		border:1px solid #d83526;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:13px;
		padding:6px 13px;
		text-decoration:none;
		text-shadow:0px 1px 0px #b23e35;
			&:hover {
			background:linear-gradient(to bottom, #ce0100 5%, #fe1a00 100%);
			background-color:#ce0100;
			}
			&:active {
			position:relative;
			top:1px;
			}	
		}
    </style>
</head>

<body>
<%@ include file="../include/topMenu.jsp" %>
<div class="foot">
	<div class="container" id="class">
		<div class="update-form">
			<h1 class="text-center">회원정보 수정</h1>
			<form name="frm" id="update-form">
			
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" value="${member.m_id}" disabled>
					<input type="hidden" name="m_id" value="${member.m_id}">
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="m_pw" name="m_pw">
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input type="password" class="form-control" id="m_repw" name="m_repw">
				</div>
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" value="${member.m_name}" disabled>
				</div>
				<div class="form-group">
					<label>닉네임</label>
					<div class="input-group">
						<input type="text" class="form-control" id="m_nickname" name="m_nickname">
						<span class="input-group-btn">
							<button class="btn btn-info" type="button" id="nickCheck" onClick="fn_nickCheck()">중복확인</button>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label>연락처</label>
					<input type="tel" class="form-control" id="m_tel" name="m_tel" value="${member.m_tel}">
				</div>
				<div class="form-group">
					<label>생년월일</label>
					<input type="text" class="form-control" value="${member.m_birthdate}" disabled>
				</div>

				<div class="form-group">
					<label>우편번호</label>
					<input type="text" class="form-control" id="m_zipcode" name="m_zipcode" value="${member.m_zipcode}" readonly>
					<input type="button" class="form-control" onclick="daumZipCode()" value="우편번호검색"/>
				</div>
				<div class="form-group">
					<label>주소</label>
					<input type="text" class="form-control" id="m_address" name="m_address" value="${member.m_address}">
				</div>
				<div class="form-group">
					<label>상세주소</label>
					<input type="text" class="form-control" id="m_addressDetail" name="m_addressDetail" value="${member.m_addressDetail}">
				</div>
				<div class="update-button-group">
					<button type="submit" class="submit" id="insertButton">수정</button>
					<button type="button" class="cancel" id="resetButton">취소</button>
				</div>
			</form>
		</div>
	</div>
	<br/><br/>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

//닉네임 중복 체크
function fn_nickCheck() {

	var nickname = $("#m_nickname").val();

	if (!nickname) { // 닉네임이 비어 있을 경우
		alert("닉네임을 입력하십시오.");
		$("#m_nickname").focus();
		return;
	}

	$.ajax({
		url:		"/member/nickCheck",
		type:		"post",
		dataType:	"json",
		data:		{"m_nickname" : nickname},
		async:		false,
		success:	function(data) {
			
			if(data == 1) {
				alert("이미 사용 중인 닉네임입니다.\n다른 닉네임을 입력하십시오.");
				$("#m_nickname").focus();
			} else if(data == 0) {
				alert("사용 가능한 닉네임입니다.");
				$("#m_nickCheck").attr("value", "Y");
				$("#m_tel").focus();
				nickIsValid = true;
			}
		}
	});
}

$(document).ready(function() {	

	// 수정하기 버튼을 클릭했을 경우
	$(".submit").on("click", function() {
		$("#update-form").prop("action", "/member/edit");
		$("#update-form").prop("method", "post");
	});
	
	
//빈칸 확인

	$(".joinButton").on("click", function() {
	// 비밀번호, 비밀번호확인, 이름, 전화번호, 주소에 값이 있는지 검사한다.
	// 입력된 값이 없으면 입력해야 한다고 경고창을 띄운다.
	
		if($("#m_passwd").val() == "") {
			alert("비밀번호를 입력하셔야 합니다.");
			$("#m_pw").focus();
			return false;
		}
		if($("#m_repasswd").val() == "") {
			alert("비밀번호확인을 입력하셔야 합니다.");
			$("#m_repw").focus();
			return false;
		}
		if($("#pw").val() != $("#repw").val()) {
	         alert("비밀번호 확인이 다릅니다.");
	         $("#repw").focus();
	         return false;
	    }
		if($("#m_nickname").val() == "") {
			alert("닉네임을 입력하셔야 합니다.");
			$("#m_nickname").focus();
			return false;
		}
		if($("#m_tel").val() == "") {
			alert("연락처를 입력하셔야 합니다.");
			$("#m_tel").focus();
			return false;
		}
		if($("#m_address").val() == "") {
			alert("주소를 입력하셔야 합니다.");
			$("#m_address").focus();
			return false;
		}
		
	
		document.getElementById("m_address").value = $("#m_address").val();
	
	});
});

function daumZipCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

			// 각 주소의 노출규칙에 따라서 주소를 조합한다.
			// 내려오는 변수가 값이 없을 경우에는 공백('') 값을 가지므로, 이를 참고해서 분기한다.
			var fullAddress	= '';	// 최종   주소 변수
			var subAddress	= '';	// 조합형 주소 변수
			
			// 사용자가 선택한 주소의 타입에 따라서 해당 주소값을 가져온다.
			if(data.userSelectedType == 'R') {	// 도로명 주소를 선택한 경우
				fullAddress = data.roadAddress;
			} else {	// 지번 주소를 선택한 경우
				fullAddress	= data.jibunAddress;
			}
			
			// 사용자가 선택한 주소가 도로명 타입일 떄는 주소를 조합한다.
			if(data.userSelectedType == 'R') {
				// 법정동명이 있을 경우 추가한다.
				if(data.bname != '') {
					subAddress += data.bname;
				}
				// 건물명이 있을 경우에 추가한다.
				if(data.buildingName != '') {
					subAddress += (subAddress != '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddress += (subAddress != '' ? '(' + subAddress + ')' : '');
			} // End - if(data.userSelectedType == 'R')
				
			// 추출한 우편번호와 주소정보를 입력항목에 나타낸다.
			document.getElementById('m_zipcode').value	= data.zonecode;
			document.getElementById('m_address').value	= fullAddress;
			
			// 커서를 상세주소 입력란으로 이동시킨다.
			document.getElementById('m_addressDetail').focus();
        }
    }).open({
    	// 우편번호 팝업 창이 여러개 뜨는 것을 방지하기 위해서 popupName을 사용한다.
		popupName:	'postcodePopup'
    });
}

</script>

</html>
