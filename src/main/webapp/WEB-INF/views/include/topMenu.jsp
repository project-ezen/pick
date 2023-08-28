<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#user_information_small {
    display: none;
}

@media all and (max-width: 767px) {
    #user_information_large {
        display: none;
    }
    #user_information_small {
        display: block;
    }
}
</style>
<c:if test="${member == null }">
<section class="navbar navbar-light fixed-top">
    <div class="container-fluid">
        <div class="navbar-header" style="padding-top: 10px;">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavbar">
                <span class="glyphicon glyphicon-align-justify"></span>
            </button>
            <a class="navbar-brand" href="/">Home</a>
        </div>
<<<<<<< HEAD
        <div class="navbar-footer" id="user_information_large">

            <a class="navbar-right" data-toggle="tooltip" title="회원가입" style="margin-right: 20px; margin-top: 5px;"href="${path}/member/join">회원가입</a>
            <a class="navbar-right" data-toggle="tooltip" title="로그인" style="margin-right: 20px; margin-top: 5px;" href="${path}/member/login">로그인</a>
        
        </div>
=======
>>>>>>> 4eac6f5c3f712778326c6c05268e67123e67033e
        <div class="collapse navbar-collapse" id="mainNavbar" style="padding-top: 10px;">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Alcohol</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">list</a></li>
                    </ul>
                </li>
                <li><a href="#">My Own Recipe</a></li>
                <li><a href="#">Board</a></li>
                <li><a href="${path }/shopping/cart">Store</a></li>
<<<<<<< HEAD
                
                <li id="user_information_small">

                    <a class="navbar-right" data-toggle="tooltip" title="로그인" style="margin-right: 20px; margin-top: 5px;" href="${path}/member/login">로그인</a>
                    <a class="navbar-right" data-toggle="tooltip" title="회원가입" style="margin-right: 20px; margin-top: 5px;"href="${path}/member/join">회원가입</a>
                
                </li> 
=======
>>>>>>> 4eac6f5c3f712778326c6c05268e67123e67033e
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                	<%-- 로그인이 된 경우 --%>
                	<c:when test="">
						<li><a data-toggle="tooltip" title="로그아웃" style="margin-right: 20px; margin-top: 5px;" href="#">로그아웃</a></li>
						<li><a data-toggle="tooltip" title="내 페이지" style="margin-right: 20px; margin-top: 5px;" href="#">내 페이지</a></li>
					</c:when>
					<%-- 로그인이 되지 않은 경우 --%>
					<c:when test="">
						<li><a data-toggle="tooltip" title="로그인" style="margin-right: 20px; margin-top: 5px;" href="#">로그인</a></li>
						<li><a data-toggle="tooltip" title="회원가입" style="margin-right: 20px; margin-top: 5px;" href="#">회원가입</a></li>
					</c:when>
				</c:choose>
			</ul>
        </div>
    </div>
</section>
</c:if>
<c:if test="${member != null }">
<section class="navbar navbar-light fixed-top">
    <div class="container-fluid">
        <div class="navbar-header" style="padding-top: 10px;">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Home</a>
        </div>
        <div class="navbar-footer" id="user_information_large">

            <a class="navbar-right" data-toggle="tooltip" title="로그아웃" style="margin-right: 20px; margin-top: 5px;" href="/member/logout">로그아웃</a>
            <a class="navbar-right" data-toggle="tooltip" title="내 페이지" style="margin-right: 20px; margin-top: 5px;" href="#">내 페이지</a>

        </div>
        <div class="collapse navbar-collapse" id="mainNavbar" style="padding-top: 10px;">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Alcohol</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">list</a></li>
                    </ul>
                </li>
                <li><a href="${path }/board/articleList">My Own Recipe</a></li>
                <li><a href="${path }/shopping/cart">Store</a></li>
                
                <li id="user_information_small">

                    <a class="navbar-right" data-toggle="tooltip" title="로그아웃" style="margin-right: 20px; margin-top: 5px;" href="/member/logout">로그아웃</a>
                    <a class="navbar-right" data-toggle="tooltip" title="내 페이지" style="margin-right: 20px; margin-top: 5px;" href="#">내 페이지</a>
                    
                </li> 
            </ul>
        </div>
    </div>
</section>
</c:if>