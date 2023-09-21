<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <%@ include file="../include/header.jsp" %>
    
    <style>
  	.container { width: 700px; background-color: rgba(255, 255, 255, 0.88); }
  	
  	.foot { padding-bottom: 100px; padding-top: 100px; }
  	
    .update-form {
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
			
	.submit {
		width: 70px;
		height: 35px;
		font-size: 15px;
		border-radius: 5px;
		border: none;
		background-color: #25556C;
		font-family:'Cafe24Supermagic-Bold-v1.0';
		color: #fff;
		font-size:15px;
		padding:6px 13px;
		border-radius:17px;
	}
	.submit:hover { background-color: #51a1c7; }
	.submit:active {
		position:relative;
		top:1px;
	}
	
	.cancel {
		width: 70px;
		height: 35px;
		font-size: 15px;
		border-radius: 5px;
		border: none;
		font-family:'Cafe24Supermagic-Bold-v1.0';
		color: #fff;
		font-size:15px;
		padding:6px 13px;
		border-radius:17px;
		background-color: #cc0000;
		
	}

	.cancel:hover {background-color: #E96F84; }
	
	.cancel:active {
		position:relative;
		top:1px;
	} 
	
	.delete { 
		width: 80px;
		height: 28px;
		border: none;
		font-family:'Cafe24Supermagic-Bold-v1.0';
		color: #fff;
		font-size:13px;
		background-color: #bcbcbc;
		border-radius:15px;
		display:inline-block;
		cursor:pointer;
	}
	.delete:hover  	{ background-color: #999999;  }
	.delete:active 	{ position:relative; top:1px; }
    </style>
</head>

<body>
<%@ include file="../include/topMenu.jsp" %>
<div class="foot">
	<div class="container" id="class">
		<div class="update-form">
			<h1 class="text-center">회원정보 수정</h1>
			<form name="frm" id="update-form" method="post">
			
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" value="${member.m_id}" disabled>
					<input type="hidden" name="m_id" value="${member.m_id}">
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" id="m_pw" name="m_pw" value="${member.m_pw}">
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input type="password" class="form-control" id="m_repw" name="m_repw" value="${member.m_repw}">
				</div>
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" value="${member.m_name}" disabled>
				</div>
				<div class="form-group">
					<label>닉네임</label>
					<div class="input-group">
						<input type="text" class="form-control" id="m_nickname" name="m_nickname" value="${member.m_nickname}">
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
					<button type="submit" class="submit" id="editButton">수정</button>
					<button type="button" class="cancel" id="resetButton">취소</button>
				</div>
				<br/>
				<div style="float:right; padding-bottom:25px;">
					<button type="button" class="delete" id="deleteButton">회원탈퇴</button>
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
		success:	function(data) {
			
			if(data == 1) {
				alert("이미 사용 중인 닉네임입니다.\n다른 닉네임을 입력하십시오.");
				$("#m_nickname").focus();
			} else if(data == 0) {
				alert("사용 가능한 닉네임입니다.");
				$("#m_nickname").attr("value", "Y");
				$("#m_tel").focus();
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
	
	// 취소하기 버튼을 클릭했을 경우

	$(".cancel").on("click", function() {
		window.location.href = "/member/mypage";
	});
	
	// 회원탈퇴 버튼을 클릭했을 경우

	$('#deleteButton').on('click', function() {
        if (confirm("정말로 탈퇴하시겠습니까?")) {
            // 폼 액션 변경 및 제출
            alert("회원 탙퇴가 완료되었습니다.");
            $('#update-form').attr('action', '/member/delete').submit();
        }
    });
	
	
//빈칸 확인

	$("#editButton").on("click", function() {
	// 비밀번호, 비밀번호확인, 이름, 전화번호, 주소에 값이 있는지 검사한다.
	// 입력된 값이 없으면 입력해야 한다고 경고창을 띄운다.
	
		let ok = true;
	
		if($("#m_pw").val() == "") {
	        alert("비밀번호를 입력하셔야 합니다.");
	        $("#m_pw").focus();
	        ok = false;
	    }
		if($("#m_repw").val() == "") {
	        alert("비밀번호확인을 입력하셔야 합니다.");
	        $("#m_repw").focus();
	        ok = false;
	    }
		if($("#m_pw").val() != $("#m_repw").val()) {
	        alert("비밀번호 확인이 다릅니다.");
	        $("#m_repw").focus();
	        ok = false;
	    }
		if($("#m_nickname").val() == "") {
			alert("닉네임을 입력하셔야 합니다.");
			$("#m_nickname").focus();
			ok = false;
		}
		if($("#m_tel").val() == "") {
			alert("연락처를 입력하셔야 합니다.");
			$("#m_tel").focus();
			ok = false;
		}
		if($("#m_address").val() == "") {
			alert("주소를 입력하셔야 합니다.");
			$("#m_address").focus();
			ok = false;
		}
	
		document.getElementById("m_address").value = $("#m_address").val();
		
		if(ok) {
			alert("회원정보 수정이 완료되었습니다.");
			$("#update-form").submit();
		}
		
	    return false;
	
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
