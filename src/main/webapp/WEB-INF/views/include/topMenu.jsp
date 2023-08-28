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
.container-fluid {
color: #fff;
}
</style>
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
<<<<<<< HEAD
=======
        <div class="navbar-footer" id="user_information_large">

            <a class="navbar-right" data-toggle="tooltip" title="회원가입" style="margin-right: 20px; margin-top: 5px;"href="${path}/member/join">회원가입</a>
            <a class="navbar-right" data-toggle="tooltip" title="로그인" style="margin-right: 20px; margin-top: 5px;" href="${path}/member/login">로그인</a>
        
        </div>
>>>>>>> 6fa0901b806b0ee1d4ca9b68bba7b570e58cac9c
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
<<<<<<< HEAD
=======
                
                <li id="user_information_small">

                    <a class="navbar-right" data-toggle="tooltip" title="로그인" style="margin-right: 20px; margin-top: 5px;" href="${path}/member/login">로그인</a>
                    <a class="navbar-right" data-toggle="tooltip" title="회원가입" style="margin-right: 20px; margin-top: 5px;"href="${path}/member/join">회원가입</a>
                
                </li> 
>>>>>>> 6fa0901b806b0ee1d4ca9b68bba7b570e58cac9c
            </ul>
        </div>
    </div>
</section>