<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=divice-width, initial-scale=1">
	<title>footer</title>

    <style>
        .logo {
            /* width: 100px; */
            text-align: center;
        }
        
        .info {
            /* width: 580px; */
        }
        
        .customer {
            /* width: 200px; margin-top: -20px; */
        }
        
        .sns {
          /*  width: 270px; */
        }
        
        html,body {
        height: 100%;
        padding: 0px;
        margin: 0px;
      	}
      	
      	#footer_ft {
      	background-color: rgba(255,255,255,0.3);
      	padding: 10px 0px;
      	color: #fff;
      	}
      	
      	a {
      	color: inherit;
      	text-decoration: none;
      	}
    	
    </style>
</head>
<body>
    <footer class="jumbotron" id="footer_ft">
        <div class="container-fluid" id="footer_foot">
            <div class="row" style="width: 100%; overflow: hidden;" id="footer_ff">
                <div class="col-sm-3 logo"><h2><a href="#"><img src="./images/alcohol.png"></a></h2></div>
                <div class="col-sm-3 info">
				<br/>
                    <b>(주)마녀의 Pick</b><br>
                    CEO:이동범<br>
                    고객센터:070-1111-1111<br>
                    주소:서울특별시 종로구 종로 78 미려빌딩 6층<br>
                    개인정보보호책임자:권준오(juno_admin@naver.com)<br><br>
                    고객님의 안전거래를 위한 현금등으로 결제 시<br>PG사의 구매안전서비스를 이용하실 수 있습니다.(서비스가입사실확인)<br><br>
                    <a href="#">(C)마녀의 Pick.ALL RIGHTS RESERVED. designed by DB.</a>
                </div>

                <div class="col-sm-3 customer">
                    <h3>Customer Center</h3>
                    <h3>070-2222-2222</h3>
                    <br>
                    <h5><b>교환/반품 주소지</b></h5>
                    <h5>서울특별시 종로구 종로 78 미려빌딩 6층</h5>
                    <br>
                    <h5><b>계좌정보</b></h5>
                    <h5>국민 666666-00-001111</h5>
                    <h5>(주)마녀의 Pick</h5>
                </div>

                <div class="col-sm-3 sns">
                    <h3><b>SNS</b></h3>
                    <br>
                    <img style="height: 45px; width: 45px;" src="${path}/resources/images/youtube.png">
                    <img style="height: 45px; width: 45px;" src="${path}/resources/images/facebook.png">
                    <img style="height: 45px; width: 45px;" src="${path}/resources/images/instagram.png">
                </div>
            </div>
        </div>
    </footer>
</body>
<script>

</script>
</html>