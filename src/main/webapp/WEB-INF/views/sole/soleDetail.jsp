<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      	margin-left: 50px;
      	margin-top: 18px;
      }
      #star {
      	width: 8%;
      	height: 8%;
      }

      /*상세 설명, 리뷰*/
      
      #reviewcontent {   /*스크롤*/
      	overflow-y: scroll;
    	-ms-overflow-style: none;
    	scrollbar-width: none;
		word-wrap: break-word;
		height: 150px;
      }
      
      #reviewcontent::-webkit-scrollbar {   /*스크롤*/
   		display: none;
	  }
	  
	  .star1, .star2 , .star3, .star4, .star5 {     /*기본 별 디자인*/
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
	  }
	  
	  .likestar {       /*별점을 줫을때 디자인*/
	  	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99); 
	  	color: transparent;
	  }
	  .nojjim {
	  	font-size: 3em;
		color: transparent;
		text-shadow: 0 0 0 #f0f0f0;
		cursor: default;
	  }
	  .jjim {
	  	font-size: 3em;
	  	color: transparent;
	  	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	  	cursor: default;
	  }
	  
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
           	  <div class="reviewDiv">
           	  
           	  </div>	
           	  
					<!-- 페이징 부분 -->
			<div class="row">		
			  <div class="col-sm-offset-5 col-sm-3">
			  	<ul class="btn-group pagination">
					<c:if test="${rpgm.prev}">
						<li>
							<a class="paging-list" data-page="${rpgm.startPage -1}"><span class="glyphicon glyphicon-chevron-left"></span></a>
						</li>
					</c:if>
										
					<c:forEach begin="${rpgm.startPage}" end="${rpgm.endPage}" var="pageNum">
						<li>
							<a class="paging-list" data-page="${pageNum}"><i>${pageNum}</i></a>
								</li>
						</c:forEach>
										
					<c:if test="${rpgm.next}">
						<li>
							<a class="paging-list" data-page="${rpgm.endPage +1}"><span class="glyphicon glyphicon-chevron-right"></span></a>
						</li>
					</c:if>
				</ul>
			 </div>
              	<div class="col-md-offset-2 col-sm-1">
              		<form id="reviewForm" action="/sole/soleReview">
              			<input type="hidden" name="recipe_code"/>
              			<input type="hidden" name="m_id"/>
              			<button type="button" id="reviewBtn" class="btn btn-defualt">리뷰쓰기</button>
              		</form>
              	</div>
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
				reviewForm.find("[name='m_id']").val();
				reviewForm.submit();
			});	
			
			function loadReviews(pageNum) {
		        $.ajax({
		            url: "/sole/soleDetailAjax",
		            type: "GET",
		            dataType: "json",
		            data: {"recipe_code": ${recipe.recipe_code}, "page": pageNum},
		            success: function (data) {
		            	
		            	$(".ajaxDiv").empty();     // 페이지를 누를때 기존 내용으 지우고 새 페이지의 내용을 채움
		                
		            	console.log(data);

		                $.each(data.reviewList, function (index, review) {
		                    var starHtml = "";
		                    for (var i = 0; i < 5; i++) {
		                        starHtml += i < review.star ? '<span class="likestar">★</span>' : '<span class="star' + (i + 1) + '">★</span>';
		                    }

		                    if (review.image === null) {
		                        review.image = 'noimage.png';
		                        review.review_id = 'noimage'; // 동시에 id에도 할당
		                    }

		                    var reviewHtml = '<div class="row ajaxDiv">' +
		                        '<div class="col-sm-offset-1 col-sm-2">' +
		                        '<img src="${path}/ReviewDownload?review_image=' + review.image + '&review_id=' + review.review_id + '" width="100%" height="100%"/>' +
		                        '</div>' +
		                        '<div class="col-sm-2">' +
		                        '<p>' + review.m_id + '</p>' +
		                        '<p>' + review.writedate + '</p>' +
		                        '<p>' + starHtml + '</p>' +
		                        '</div>' +
		                        '<div class="col-sm-7">' +
		                        '<p id="reviewcontent">' + review.content + '</p>' +
		                        '</div>' +
		                        '</div>';

		                    $(".reviewDiv").append(reviewHtml);
		                });

		            },
		            error: function (xhr, status, error) {
		                console.error("AJAX Error:", error);
		                alert("실패");
		            }
		        });
		    }
			
			loadReviews(${rpgm.cri.page});
		    
		    $(".paging-list").click(function () {
		    	
		    	//$(".ajaxDiv").remove();
		    	
		        var pageNum = $(this).data("page"); // data-page 속성에서 페이지 번호 가져오기
		        loadReviews(pageNum);
		    });
		 
		    // 찜 하는 부분			
		    $(document).on("click", ".nojjim", function() {
		        $(this).removeClass("nojjim").addClass("jjim");
		    });

		    $(document).on("click", ".jjim", function() {
		        $(this).removeClass("jjim").addClass("nojjim");
		    });
			
		});   /// end $
    </script>
  </body>
</html>