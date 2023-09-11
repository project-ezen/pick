<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<%@ include file="../include/header.jsp" %>
<style>
@media ( min-width: 946px ) {
  .class {
  	width: auto;
  }
}

.class 	{ width: 900px; min-height: 600px; border-radius: 10px; margin:auto;  background-color: rgba( 255, 255, 255, 0.8 ); }

.foot 	{ padding-bottom: 100px; padding-top: 100px; margin:auto; }

.ll		{ float: left; }

.set1 	{ width: 90%; height: 200px;  margin-left: 50px; border-radius:10px; }

.set2 	{ width: 90%; text-align:center; padding-bottom:3%; margin-left: 45px ; margin-right: 45px; border-radius:10px; display: inline-block; padding-top: 30px; }

.nim 	{ text-align : center; line-height : 200px; width: 70%; height: 200px; float: right; margin:0 auto; }

.box_1,.box_2,.box_3, .box_4  
			{ width: 150px; height: 100px; float:left; margin: 30px 25px; display: inline-block; border-radius: 5%;  background-color: rgba(20, 69, 101, 0.7);  }

.AA 		{ text-align: center; line-height : 100px; float: center; margin:0 auto; display: inline-block; color: #fff; 
			  text-decoration: none; cursor:pointer; font-family:'Cafe24Supermagic-Bold-v1.0'; font-size:20px;  }

.AA:hover 	{ text-decoration: none; color: #ccd6d9; }

.box_1 		{ margin-left: 30px; } 

/* 모달 스타일 */
.modal-open {
    overflow: hidden;
}

.modal-open .backdrop {
    display: block;  /* backdrop를 활성화 */
}

#passwordModal {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    width: 300px;
    background-color: #ffffff;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.4);
    z-index: 2;
    display: none;
}

.passwordField {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-top: 10px;
}

.confirmButton {
    margin-right: 15px;
    padding: 5px 10px;
    border: none;
    background-color: #2ECC71;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.closeButton {
    padding: 5px 10px;
    border: none;
    background-color: #E74C3C;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.closeButton:hover {
    background-color: #C0392B;
}

.confirmButton:hover {
    background-color: #34495E;
}
.backdrop {
    position: fixed; 
    top: 0; 
    left: 0; 
    width: 100%; 
    height: 100%; 
    background-color: rgba(0,0,0,0.5); 
    z-index: 1; 
    display: none; 
}
.closeButton {
    margin-top: 10px;
    padding: 5px 10px;
    border: none;
    background-color: #E74C3C;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.closeButton:hover {
    background-color: #C0392B;
}

</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<div class="foot">
	<div class="class">
	<br/>
		<h2 class="title" style="text-align : center;">MyPage</h2>
		<hr/>		
		<div id="contents" class="set1">
		<img class="ll" style=" padding-left: 15px; height:200px; width:30%; vertical-align:top; float: left;" src="${path}/resources/images/alcohol.png" border="0">

		<div><h2 class="nim">${member.m_id}님, 어서오세요!</h2></div>
		</div>
		<hr/>
		<div class="set2">
			<div class="box_1"><a class="AA" href="${path}/shopping//myOrderList">주문 조회</a></div>
			<div class="box_2"><a class="AA" href="${path}/member/mylist">좋아요♥</a></div>
			<div class="box_3"><a class="AA" href="${path}/member/myboard">내가 쓴 게시물</a></div>
			<div class="box_4"><a class="AA" href="javascript:void(0);" onclick="openModal()">회원 정보 수정</a></div>
		</div>
	</div>
	<br/><br/>
</div>
	<%@ include file="../include/footer.jsp" %>
	
	<div class="backdrop" id="backdrop"></div>
	<!-- 비밀번호 확인 모달 -->
    <div id="passwordModal">
	    <div style="text-align: center;">
	        <h2>비밀번호 확인</h2>
	        <input type="password" id="passwordInput" class="passwordField" placeholder="비밀번호를 입력하세요">
	        <br>
	        <button onclick="checkPassword()" class="confirmButton">확인</button>
	        <button onclick="closeModal()" class="closeButton">닫기</button>
	    </div>
	</div>
    
    <!-- 모달 -->
    <script>
    function openModal() {
        document.getElementById("passwordModal").style.display = "block";
        document.body.classList.add("modal-open");  // 클래스 추가

        // 모달 외의 배경을 클릭하면 모달이 닫히도록 이벤트 추가
        document.getElementById("backdrop").addEventListener('click', closeModal);
        
        // passwordInput에 자동 포커스
        var passwordInput = document.getElementById('passwordInput');
        passwordInput.focus();

        // passwordInput에서 엔터 키를 감지하여 checkPassword 함수 실행
        passwordInput.addEventListener('keydown', function(event) {
            if (event.key === "Enter") {
                checkPassword();
            }
        });
    }

    function closeModal() {
        document.getElementById("passwordModal").style.display = "none";
        document.body.classList.remove("modal-open");  // 클래스 제거

    	 // 비밀번호 입력 필드 값 초기화
        document.getElementById('passwordInput').value = "";
        
        // 모달 외의 배경 클릭 이벤트 제거
        document.getElementById("backdrop").removeEventListener('click', closeModal);
    }

        function checkPassword() {
            var inputPassword = document.getElementById('passwordInput').value;
    
            // Simple password check, replace with actual server check
            if (inputPassword === "${member.m_pw}") {
                window.location.href = "${path}/member/edit";
            } else {
                alert("비밀번호가 틀렸습니다.");
            }
        }
    </script>
</body>
</html>