<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <%@ include file="../include/header.jsp" %>
    
    <style>
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
		#insert-button {
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
	<div class="container" id="class">
		<div class="update-form">
			<h1 class="text-center">회원정보 수정</h1>
			<form id="update-form">
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" id="name" name="name">
				</div>
				<div class="form-group">
					<label for="nickname">닉네임</label>
					<div class="input-group">
						<input type="text" class="form-control" id="nickname" name="nickname">
						<span class="input-group-btn">
							<a href="#" class="check" onclick="fn_nickCheck();"> 중복확인 </a>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label>
					<input type="password" class="form-control" id="password" name="password">
				</div>
				<div class="form-group">
					<label for="confirm-password">비밀번호 확인</label>
					<input type="password" class="form-control" id="confirm-password" name="confirm-password">
				</div>
				<div class="form-group">
					<label for="contact">연락처</label>
					<input type="tel" class="form-control" id="contact" name="contact">
				</div>
				<div class="form-group">
					<label for="birthdate">생년월일</label>
					<input type="date" class="form-control" id="birthdate" name="birthdate">
				</div>
				<div class="form-group">
					<label>성별</label><br>
					<label class="radio-inline">
						<input type="radio" name="gender" value="male"> 남성
					</label>
					<label class="radio-inline">
						<input type="radio" name="gender" value="female"> 여성
					</label>
				</div>
				<div class="form-group">
					<label for="zipcode">우편번호</label>
					<input type="text" class="form-control" id="zipcode" name="zipcode" readonly>
					<input type="button" class="form-control" onclick="daumZipCode()" value="우편번호검색"/>
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" class="form-control" id="address" name="address">
				</div>
				<div class="form-group">
					<label for="detail-address">상세주소</label>
					<input type="text" class="form-control" id="detail-address" name="detail-address">
				</div>
				<div class="update-button-group">
					<button type="submit" class="submit" id="insert-button">수정</button>
					<button type="button" class="cancel" id="reset-button">취소</button>
				</div>
			</form>
		</div>
	</div>
	<br/>
	<%@ include file="../include/footer.jsp" %>
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
			document.getElementById('zipcode').value	= data.zonecode;
			document.getElementById('address').value	= fullAddress;
			
			// 커서를 상세주소 입력란으로 이동시킨다.
			document.getElementById('detail-address').focus();
        }
    }).open({
    	// 우편번호 팝업 창이 여러개 뜨는 것을 방지하기 위해서 popupName을 사용한다.
		popupName:	'postcodePopup'
    });
}
</script>
</html>
