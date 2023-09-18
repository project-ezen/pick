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

.tt {
	color: white;
}
.tt:hover {
	background-color: rgba( 255, 255, 255, 0 );
}
</style>
<section class="navbar navbar-light fixed-top">
    <div class="container-fluid">
        <div class="navbar-header" style="padding-top: 10px;">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavbar">
                <span class="glyphicon glyphicon-align-justify"></span>
            </button>
            <a class="navbar-brand tt" href="/" style="font-size: 30px;">마녀의 pick</a>
        </div>
        <div class="collapse navbar-collapse" id="mainNavbar" style="padding-top: 10px;">
            <ul class="nav nav-pills navbar-nav">
                <li class="dropdown">
                    <a class="dropdown-toggle tt" data-toggle="dropdown" href="#">Alcohol</a>
                    <ul class="dropdown-menu">
                        <li id="lilist" class="base"><a href="#">베이스주</a></li>
<<<<<<< HEAD
	                    <li id="lilist" class="weski"><a href="#">위스키 베이스주</a></li>
	                    <li id="lilist" class="brandi"><a href="#">브랜디 베이스주</a></li>
	                    <li id="lilist" class="jin"><a href="#">진 베이스주</a></li>
	                    <li id="lilist" class="rum"><a href="#">럼 베이스주</a></li>
	                    <li id="lilist" class="bodcar"><a href="#">보드카 베이스주</a></li>
	                    <li id="lilist" class="dekilla"><a href="#">데킬라 베이스주</a></li>
=======
	                    <li id="lilist"><a href="#">위스키 칵테일</a></li>
	                    <li id="lilist"><a href="#">브랜디 칵테일</a></li>
	                    <li id="lilist"><a href="#">진 칵테일</a></li>
	                    <li id="lilist"><a href="#">럼 칵테일</a></li>
	                    <li id="lilist" class="cacktail"><a href="#">보드카 칵테일</a></li>
	                    <li id="lilist" class="hiball"><a href="#">데킬라 칵테일</a></li>
>>>>>>> 06905a6043a459ac06161bad03ee206936b88e0e
                    </ul>
                </li>
                <li><a class="tt" href="${path}/board/articleList">My Own Recipe</a></li>
                <li><a class="tt" href="${path}/store/productInfo/">Store</a></li>

            </ul>
            <ul class="nav nav-pills navbar-nav navbar-right">
                <c:choose>
                	<%-- 로그인이 된 경우 --%>
                	<c:when test="${ member != null }">
						<li><a class="tt" data-toggle="tooltip" title="로그아웃" style="margin-right: 20px; margin-top: 5px;" href="${path}/member/logout">LogOut</a></li>
						<li><a class="tt" data-toggle="tooltip" title="장바구니" style="margin-right: 20px; margin-top: 5px;" href="${path}/shopping/cart">Cart</a></li>
						<li><a class="tt" data-toggle="tooltip" title="내 페이지" style="margin-right: 20px; margin-top: 5px;" href="${path}/member/mypage">MyPage</a></li>
					</c:when>
					<%-- 로그인이 되지 않은 경우 --%>
					<c:when test="${ member == null }">
						<li><a class="tt" data-toggle="tooltip" title="로그인" style="margin-right: 20px; margin-top: 5px;" href="${path}/member/login">LogIn</a></li>
						<li><a class="tt" data-toggle="tooltip" title="회원가입" style="margin-right: 20px; margin-top: 5px;" href="${path}/member/join">Sign In</a></li>
					</c:when>
				</c:choose>
			</ul>
        </div>
    </div>
    
    <form id="formList" action="/sole/sole" method="get">
    	<input type="hidden" name="alcohole_category"/>
    </form>
                
    <form id="baseList" action="/sole/baseSole" method="get">
        <input type="hidden" name="alcohole_category"/>
    </form>
    

</section>

    <script>    
        $(document).ready(function() {
        	var formList = $("#formList");
        	var baseList = $("#baseList");
        	var category1 = 1;
        	var category2 = 2;
        	var category3 = 3;
        	var category4 = 4;
        	var category5 = 5;
        	var category6 = 6;
        	var category7 = 7;
        	
        	
        	$(".base").click(function() {
        		baseList.find("[name='alcohole_category']").val(category1);
        		baseList.submit();
        	})
        	
        	$(".weski").click(function (){
        		formList.find("[name='alcohole_category']").val(category2);
        		formList.submit();
        	});
        	
        	$(".brandi").click(function (){
        		formList.find("[name='alcohole_category']").val(category3);
        		formList.submit();
        	});
        	
        	$(".jin").click(function (){
        		formList.find("[name='alcohole_category']").val(category4);
        		formList.submit();
        	});
        	
        	$(".rum").click(function (){
        		formList.find("[name='alcohole_category']").val(category5);
        		formList.submit();
        	});
        	
        	$(".bodcar").click(function (){
        		formList.find("[name='alcohole_category']").val(category6);
        		formList.submit();
        	});
        	
        	$(".dekilla").click(function (){
        		formList.find("[name='alcohole_category']").val(category7);
        		formList.submit();
        	});
            	
        });   //// end $
    </script>
