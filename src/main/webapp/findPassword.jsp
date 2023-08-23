<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <%@ include file="./WEB-INF/views/include/header.jsp" %>
    <style>
        h3 {
            border-bottom: 2px solid gray;
            padding-bottom: 10px; 
        }
        .input-width {
            max-width: 350px; 
            margin-left: 450px;
        }
        .name-input {
            max-width: 225px; 
        }
        .radio-label { 
            text-align: left;
            padding-left: 450px;
        }
        .phone-container, .email-container, .confirm-container {
            display: flex; 
            justify-content: space-between; 
            align-items: flex-end; 
        }
        .phone-input, .confirm-input {
            flex: 2; 
        }
        .phone-button, .confirm-button {
            flex: 1; 
        }
        
    </style>
</head>
<body>
<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
    <div class="container">
        <h3 class="text-center">비밀번호 찾기</h3><br>
        <div class="radio radio-label">
            <label><input type="radio" name="findMethod" checked>휴대폰 번호로 찾기</label>
        </div>
        <div class="form-group input-width name-input">
            <label>이름</label>
            <input type="text" class="form-control">
        </div>
        <div class="form-group input-width phone-container">
            <div class="phone-input"> 
                <label>휴대전화</label>
                <input type="text" class="form-control">
            </div>&nbsp;&nbsp;&nbsp;
            <div class="phone-button"> 
                <label>&nbsp;</label> 
                <button class="btn btn-Secondary btn-block">인증번호 받기</button>
            </div>
        </div>
        <div class="form-group input-width confirm-container">
            <div class="confirm-input">
                <label>인증번호</label>
                <input type="text" class="form-control">
            </div>&nbsp;&nbsp;&nbsp;
            <div class="confirm-button">
                <label>&nbsp;</label>
                <button class="btn btn-primary btn-block">확인</button>
            </div>
        </div>
    </div>
    <br/>
<%@ include file="./WEB-INF/views/include/footer.jsp" %>
</body>
</html>