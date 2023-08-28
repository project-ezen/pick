<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>상품 상세 페이지</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />

    <!-- 부가적인 테마 -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"
    />

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
    
	    .bg {
			 background-image: url("/resources/images/background2.jpg");
	
	         height: 100vh;        /*%로 주면 안되고 vh로 줘야함  */
	         
	         
			 background-attachment: fixed, scroll;
	         background-position: center;
	         background-repeat: no-repeat;
	         background-size: cover; 
		}
    
      /*상품 관련 이미지, 위치*/
      .product-img {
        width: 400px;
        height: 400px;
        
        margin-top: 100px;
      }
      .product-info {
        margin-top: 50px;
      }
      /*상품 관련 이미지, 위치*/

      /*테이블*/
      .table {
        height: 300px;
        font-size: 18px;
      }
      .table th,
      .table td {
        vertical-align: middle !important;
        color: #FFF;
      }
      h1 {
        text-align: center;
        color: #FFF;
      }
      .table th {
        background-color: rgb(171, 173, 175);
        width: 160px;
        text-align: center;
      }
      /*테이블*/

      /*수량 증가 감소*/
      .quantity-group {
        display: flex;
        align-items: center;
      }
      .quantity-group input {
        width: 50px;
        text-align: center;
      }
      #decrease,
      #increase {
        background-color: rgb(171, 173, 175);
        margin: 3px;
      }
      /*수량 증가 감소*/

      /*구매 버튼들*/
      .buy-now {
        background-color: rgb(150, 232, 250);
      }
      .add-to-cart {
        background-color: rgb(59, 59, 59);
        width: 140px;
        margin-left: 10px;
      }
      .buy-button {
        color: aliceblue;
        float: right;
        height: 40px;
      }
      /*구매 버튼들*/

      /*합계*/
      .bold-line {
        height: 1px;
        background-color: rgb(135, 135, 135);
        width: 100%;
        margin-top: 8px;
        margin-bottom: 10px;
      }
      #totalkr {
        font-size: 20px;
        margin: 30px;
      }
      #total {
        margin-left: 90px;
        width: 330px;
        height: 36px;
        text-align: right;
        font-size: 22px;
        border-radius: 6px;
        border: 1px solid rgba(202, 202, 202, 0.9);
        background-color: rgba(202, 202, 202, 0.9);
        color: rgba(67, 67, 67, 0.9);
      }
      /*합계*/

      /*상세 설명, 리뷰*/
      input:focus {
        outline: none;
      }
      .infoAndReview li {
        width: 120px;
        text-align: center;
        font-size: 15px;
        color: rgb(0, 0, 0);
      }

      .infoAndReview li a {
        background-color: rgb(139, 139, 139);
      }
      a:link {
        color: black;
      }
    #wrapper{
		 height: auto;
 		 min-height: 100%;
  		 padding-bottom: 600px;
	}
	
	.multiline {
	   white-space: pre-line;
	}
	
      /*상세 설명, 리뷰*/
    </style>
  </head>
  <body class="bg">
    <%@ include file="../include/topMenu.jsp" %>
    
    <br />
    <br />
    <br />
    
   <c:forEach var="product" items="${product}">
    <form>
      <div class="container">
        <div class="row">
          <!--상품 이미지-->
          <div class="col-md-6">
            <img src="${path}/download.do?imageFileName=${product.product_image}" class="product-img img-responsive" />
          </div>
          <!--상품 간단 정보-->
          <h1>${product.product_name }</h1>
          
          <div class="col-md-6 product-info">
            <table class="table table-bordered table">
              <tbody>
                <tr>
                  <th>제조사</th>
                  <td>${product.menufacturer }</td>
                </tr>
                <tr>
                  <th>원산지</th>
                  <td>${product.origin }</td>
                </tr>
                <tr>
                  <th>도수</th>
                  <td>${product.alcohol_content }</td>
                </tr>
                <tr>
                  <th>용량</th>
                  <td>${product.capacity }</td>
                </tr>
                <tr>
                  <th>판매가</th>
                  <td id="price"><fmt:formatNumber value="${product.product_price }" pattern="#,###"/></td>
                </tr>
              </tbody>
            </table>
            <div>
              <!--증가, 감소 버튼, total가격-->
              <div class="quantity-group">
                <button id="decrease" class="btn btn-default">-</button>
                <input
                  type="text"
                  id="quantity"
                  value="1"
                  onkeypress="return checkNumber(event)"
                />
                <button id="increase" class="btn btn-default">+</button>
                <div class="buy-buttons col-md-12">
                  <button class="btn buy-button add-to-cart">
                    장바구니 추가
                  </button>
                  <button class="btn buy-button buy-now">바로구매</button>
                </div>
              </div>
              <div class="bold-line"></div>
              <span id="totalkr">합계</span>
              <input type="text" id="total" readonly/>
            </div>
          </div>
        </div>

        <!---------------------------------------------여백------------------------------------------------------------------------>
        <br />
        <br />
        <br />
        <br />
        <div class="container">
          <!--상세설명&리뷰-->
          <ul class="nav nav-tabs infoAndReview">
            <li class="active">
              <a data-toggle="tab" href="#description">상세설명</a>
            </li>
            <li><a data-toggle="tab" href="#review">리뷰</a></li>
          </ul>
          <div class="tab-content">
            <div id="description" class="tab-pane fade in active">
              <h3>상세설명</h3>
	              <!--상세 설명 와라락-->
	              <div align="center">
	            <p class="multiline">아니 근데 <br/> 아닌가?</p>
	              	<pre class="multiline">${product.product_info}</pre>
	              </div>
	              
            </div>
            <div id="review" class="tab-pane fade">
              <h3>리뷰</h3>
              <!--리뷰 와라락-->
            </div>
          </div>
        </div>
      </div>
    </form>
  </c:forEach>
    
	<%@ include file="../include/footer.jsp" %>
	
    <script>
      // 증가 버튼
      $(document).ready(function () {
        $("#increase").click(function (event) {
          event.preventDefault();
          let currentQuantity = parseInt($("#quantity").val());
          $("#quantity").val(currentQuantity + 1);
          updateTotal();
        });

        // 감소 버튼
        $("#decrease").click(function (event) {
          event.preventDefault();
          let currentQuantity = parseInt($("#quantity").val());
          if (currentQuantity > 1) {
            $("#quantity").val(currentQuantity - 1);
            updateTotal();
          }
        });
      });

    // 총 금액 보여주기
       function updateTotal() {
    	    const priceString = document.getElementById("price").textContent;
    	    const quantity = parseInt(document.getElementById("quantity").value);
    	    
    	    const price = parseInt(priceString.replace(/[^\d]/g, "")); // 쉼표와 숫자 이외의 문자 제거
    	    
    	    const total = price * quantity;
    	    
    	    const formattedTotal = new Intl.NumberFormat("ko-KR").format(total) + "원";
    	    document.getElementById("total").value = formattedTotal; // value로 값을 설정
    	}
    
      updateTotal();

      // 바뀔 때마다 총 금액 보여주기
      $("#quantity").on("change", updateTotal);
      
      $("#quantity").on("input", checkNumber);

      function checkNumber(event) {
          const inputValue = $(this).val();
          const onlyDigits = /^[0-9]*$/; // 숫자만 허용하는 정규식

          if (!onlyDigits.test(inputValue)) {
              $(this).val(inputValue.replace(/[^0-9]/g, "")); // 숫자 이외의 문자 제거
          }
      }
    </script>
  </body>
</html>
