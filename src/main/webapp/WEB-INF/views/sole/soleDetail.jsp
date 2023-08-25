<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>상품 상세 페이지</title>
	<%@ include file="../include/header.jsp" %>
    <style>
      /*상품 관련 이미지, 위치*/
	  .bg {
		 background-image: url("/resources/images/background2.jpg");

         height: 100vh;        /*%로 주면 안되고 vh로 줘야함  */
         
         
		 background-attachment: fixed, scroll;
         background-position: center;
         background-repeat: no-repeat;
         background-size: cover; 
	  }
      .product-img {
        /*width: 400px;
        height: 400px;
        
        margin-top: 100px;*/
        max-width: 100%;
		width: auto;
		height: auto;
      }
      .product-info {
        margin-top: 39px;
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
      }
      h1 {
        text-align: center;
      }
      .table th {
        background-color: rgb(171, 173, 175);
        width: 160px;
        text-align: center;
      }
      /*테이블*/     

      /*상세 설명, 리뷰*/
      input:focus {
        outline: none;
      }
      .infoAndReview li {
        width: 50%;
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
      #reviewBtn {
      	float: right;
      	margin-right: 10px;
      	margin-bottom: 10px;
      }
      #star {
      	width: 8%;
      	height: 8%;
      }

      /*상세 설명, 리뷰*/
    </style>
  </head>
  <%@ include file="../include/topMenu.jsp" %>
  <body class="bg">
    <br />
    <br />
    <br />
    
   
    <div>
      <div class="container" style="background-color:white">
        
        <div class="row" >
          <!--상품 이미지-->
          <div class="col-md-6">
          	<br/>
            <img src="${path}/download?recipe_image=${recipe.alcohole_image}" class="product-img img-responsive" />
          </div>
          <!--상품 간단 정보-->
          <h1>${recipe.alcohole_name}</h1>
          <div class="col-md-6 product-info">
            <table class="table table-bordered">
              <tbody>
                <tr>
                  <th>설명</th>
                  <td>${recipe.content }</td>
                </tr>
                <tr>
                  <th>도수</th>
                  <td>${recipe.alcohole_dosu }도</td>
                </tr>
                <tr>
                  <th>맛</th>
                  <td>${recipe.favor }</td>
                </tr>
              </tbody>
            </table>
            <!-- 즐겨찾기 부분 -->
			<div align="right">
				<span><img src="/resources/images/yellowStar.png" id="star"/></span>
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
              <a data-toggle="tab" href="#description">재료정보</a>
            </li>
            
            <li>
            	<a data-toggle="tab" href="#review">리뷰</a>
            </li>
          </ul>
          <div class="tab-content">
            <div id="description" class="tab-pane fade in active">
            	<br/>
                 <c:forEach var="recipeDetail" items="${recipeDetail}">
                 	<div align="center">
                    	<p>${recipeDetail.ingredient_name}&nbsp;${recipeDetail.ingredient_cpcty}</p>
                 	</div>
                 </c:forEach>
            </div>
            <div id="review" class="tab-pane fade">
              <br/>
              <!--리뷰 와라락-->
                 <div align="center">
                    <p>dsadsadsadasdas</p>
                 </div>             
              	<div>
              		<form id="reviewForm" action="/sole/soleReview">
              			<input type="hidden" name="recipe_code"/>
              			<button type="button" id="reviewBtn" class="btn btn-defualt">리뷰쓰기</button>
              		</form>
              	</div>
            </div>
          </div>
        </div>
        </div>
    </div>
  
    
   <%@ include file="../include/footer.jsp" %>
   
    <script>
		$(document).ready(function () {
			var reviewForm = $("#reviewForm");
			
			$("#reviewBtn").click(function() {
				reviewForm.find("[name='recipe_code']").val("${recipe.recipe_code}");
				reviewForm.submit();
			});
		});
    </script>
  </body>
</html>