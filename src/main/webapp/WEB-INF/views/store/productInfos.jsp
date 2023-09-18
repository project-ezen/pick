<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.edu.member.dto.MemberDTO" %>
<%
   MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
   String memberId = (memberDTO != null) ? memberDTO.getM_id() : null;
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="../include/header.jsp" %>
    <title>상품 상세 페이지</title>
    <style>
    
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
        color: black;
      }
      h1 {
        text-align: center;
        color: black;
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
	
	/*modal : 장바구니 보내는*/
	#cart_modal {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        display: none;
        background-color: rgba(0, 0, 0, 0.1);
      }
      
  	#cart_modal_body {
	  height: 600px;
	  padding: 40px;
	  text-align: center;
	  border-radius: 10px;
	}
	
	
	 #cart_modal_content {
	 background-color: rgba(0,0,0,0);
	 box-shadow: none;
	 border: 0px;
	}
	
	
	#goToCart, #moreProduct {
	 height: 80px;
	 width: 30%;
	 margin: 15px;
	 margin-top: 100px;
	}
	
	#cart_coment{
	 color: #FFF;
	 font-size: 30px;
	 margin-top: 200px;
	}
	
	#modal-icon {
		font-size: 20px;

	}
	/*modal : 장바구니 보내는*/
	
	/*리뷰 자세히*/
	#reviewContent{
		word-wrap:break-word;
		width: 600px;
		height: 225px;
		overflow-y: scroll;
	}
	
	#reviewContent::-webkit-scrollbar {
  		display: none;
	}
	
	#reviewContent {
  		-ms-overflow-style: none; /* 인터넷 익스플로러 */
  		scrollbar-width: none; /* 파이어폭스 */
	}
	
	#idAndStar{
		margin-top: 30px;
		margin-bottom: 30px;	
	}
	
	#star {
	margin-top: 70px;
	}
	
	.col-sm-12{
	margin-top: 30px;
	}
	
	#writeReviewBtn{
		float: right;
	}
	
	#reviewTable {
		color: black;
	}
	
	#reviewImg {
		width: 200px;
		height: 200px;
	}
     /*리뷰 자세히*/
     
    #whiteBg{
    	background-color:rgba(255,255,255,0.8);
	  	border-radius: 10px;
	  	padding-bottom: 30px;
    }
    
    #detailDescription{
	    font-family: 'Cafe24Supermagic-Bold-v1.0';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/Cafe24Supermagic-Bold-v1.0.woff2') format('woff2');
		font-style: normal;
		font-size: 30px;
    }
    
    #loginTf{
    	float: right;
    }

    </style>
  </head>
  <body class="bg">
    <%@ include file="../include/topMenu.jsp" %>
    
    <br />
    <br />
    <br />
    
   <c:forEach var="productItem" items="${product}" varStatus="status">
	<input type="hidden" id="productIdInput" value="${productInfo[status.index].product_display_id }"/>
      <div class="container" id="whiteBg">
        <div class="row">
          <!--상품 이미지-->
          <div class="col-md-6">
            <img src="/resources/product_images/${productItem.product_image}" class="product-img img-responsive" />
            <input type="hidden" value="${productItem.product_image}" id="imageHidden"/>
          </div>
          <!--상품 간단 정보-->
          <h1>${productItem.product_name }</h1>
          <input type="hidden" value="${productItem.product_name }" id="nameHidden"/>
          
          <div class="col-md-6 product-info">
            <table class="table table-bordered table">
              <tbody>
                <tr>
                  <th>제조사</th>
                  <td>${productInfo[status.index].manufacturer }</td>
                </tr>
                <tr>
                  <th>원산지</th>
                  <td>${productInfo[status.index].origin }</td>
                </tr>

                <tr>
    			  <th>도수</th>
                  <td>${productInfo[status.index].alcohol_content }</td>
                </tr>
               
                <tr>
                  <th>용량</th>
                  <td>${productInfo[status.index].capacity }</td>
                </tr>
                <tr>
                  <th>판매가</th>
                  <td id="price"><fmt:formatNumber value="${productItem.product_price }" pattern="#,###"/></td>
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
                  <button class="btn buy-button add-to-cart" data-toggle="modal" data-target="#cart_modal">
                    장바구니 추가
                  </button>
                  <button class="btn buy-button buy-now" id="buyNow">바로구매</button>
                </div>
              </div>
              <div class="bold-line"></div>
              <span id="totalkr">합계</span>
              <input type="text" id="total" readonly/>
              <input type="hidden" id="displayParam" value="${param.product_display_id}"/>
            </div>
          </div>
        </div>

        <!---------------------------------------------여백------------------------------------------------------------------------>
        <br />
        <br />
        <br />
        <br />
        <div>
          <!--상세설명&리뷰-->
          <ul class="nav nav-tabs infoAndReview">
            <li class="active">
              <a data-toggle="tab" href="#description">상세설명</a>
            </li>
            <li><a data-toggle="tab" href="#review" id="reviewReadBtn">리뷰</a></li>
          </ul>
          <div class="tab-content">
            <div id="description" class="tab-pane fade in active">
              <h3>상세설명</h3>
	              <!--상세 설명 와라락-->
	              <div align="center">
	              	<pre class="multiline" id="detailDescription">${productInfo[status.index].product_info}</pre>
	              </div>              
            </div>
            
            <!-- 리뷰 & 페이징 -->
            <div id="review" class="tab-pane fade">
            	<br/>
					<% if (memberId != null) { %>
						    <button class="btn btn-info" id="writeReviewBtn" data-toggle="modal" data-target="#writeReview">리뷰 작성하기</button>
						<% } else { %>
						    <button class="btn btn-warning"id="loginTf">로그인 후에 리뷰를 작성할 수 있습니다.</button>
						<% } %>
             <div class="reviewDiv">
             </div>           
             <div class="row">		
			  <div class="col-sm-offset-5 col-sm-3">
			  	<ul class="btn-group pagination">
					<c:if test="${prpgm.prev}">
						<li>
							<a class="paging-list" data-page="${prpgm.startPage -1}"><span class="glyphicon glyphicon-chevron-left"></span></a>
						</li>
					</c:if>
										
					<c:forEach begin="${prpgm.startPage}" end="${prpgm.endPage}" var="pageNum">
						<li>
							<a class="paging-list" data-page="${pageNum}"><i>${pageNum}</i></a>
								</li>
						</c:forEach>								
					<c:if test="${prpgm.next}">
						<li>
							<a class="paging-list" data-page="${prpgm.endPage +1}"><span class="glyphicon glyphicon-chevron-right"></span></a>
						</li>
					</c:if>
				</ul>
			 </div>
            </div>
			           
          </div>
        </div>
      </div>
    
  </c:forEach>
    	<!-- 장바구니 모달  -->
            <div class="modal" id="cart_modal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" align="center" id="cart_modal_content">
                            <button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>
                            <h4 id="cart_coment">장바구니에 상품을 넣었습니다.</h4>
                        <div class="modal-body" id="cart_modal_body">
                            <div id="col-md-2 col-md-4" align="center">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" id="goToCart"><span class="glyphicon glyphicon-shopping-cart" id="modal-icon"></span><span>&nbsp;장바구니 바로 가기</span></button>
                          	<button type="button" class="btn btn-primary" data-dismiss="modal" id="moreProduct"><span class="glyphicon glyphicon-repeat" id="modal-icon"></span><span>&nbsp;상품 더 담기</span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Modal-->
            
            <!-- 리뷰 작성하기 모달 -->
    		<div class="modal" id="writeReview">
    			<div class="modal-dialog modal-lg">
					<h1>리뷰 작성하기</h1>
						<div class="container">
							<form name="articleForm" method="post" action="/store/reviewWrite?product_display_id=${param.product_display_id}" enctype="multipart/form-data">
								<table class="table" id="reviewTable">
									<tr>
										<td align="right">작성자</td>
										<td colspan="2" align="left">
											<input type="text" size="50" name="id" maxlength="50" value="<%=memberId%>"readonly style="color:black"/>
										</td>
									</tr>
									
									<tr>
										<td align="right" valign="top">글내용</td>
										<td colspan="2" align="left">
											<textarea name="content" rows="10" cols="100" maxlength="4000" style="color:black"></textarea>
										</td>
									</tr>
									<tr>
										<td align="right">이미지파일 첨부</td>
										<td>
											<input type="file" name="imageFileName" onchange="readURL(this);"/><br/>
											<img id="preview" src="/resources/product_review_images/no_image/no_image.jpg" width="200" height="200"/>
										</td>
									</tr>
									<tr>
										<td align="right"></td>
										<td colspan="2">
											<input class="btn btn-primary" type="submit" value="글쓰기"/>
											<input class="btn btn-danger"  type="reset"  value="다시작성하기"/>
										</td>
									</tr>
								</table>
							</form>
						</div>
  
    
    			</div>
    		</div>
	<%@ include file="../include/footer.jsp" %>

    <script>
    
    // DisplayOrderVO temp = new DisplayOrderVO(cart_id[i], image[i], product_name[i], product_price[i], count[i]);
    // 세션 아이디
	    var memberId = "<%= memberId %>"; 
	    var productIdInputs = $("#productIdInput").val();   	
    // 페이징 Ajax
    $(document).ready(function () {
    
    	function productLoadReviews(pageNum) {
        $.ajax({
            url: "/store/reviewDetailAjax",
            type: "GET",
            dataType: "json",
            data: {"product_display_id": productIdInputs, "page": pageNum},
            success: function (data) {
            	
            	
            	$(".ajaxDiv").empty();     // 페이지를 누를때 기존 내용으 지우고 새 페이지의 내용을 채움
            	console.log(data);

                $.each(data.ProductReviewList, function (index, review) {

                	 var reviewHtml =
                         '<div class="row ajaxDiv">' +
                         '<br/>' +
                         '<div class="col-sm-12">' +
                         '<div class="col-sm-3">';
                     
                     if (review.image == null) {
                         reviewHtml += '<img src="${path}/reviewDownload.do?imageFileName=no_image.jpg&reviewId=no_image" id="reviewImg">';
                     } else {
                         reviewHtml += '<img src="${path}/reviewDownload.do?imageFileName=' + review.image + '&reviewId=' + review.review_id + '" id="reviewImg">';
                     }

                     reviewHtml +=
                         '</div>' +
                         '<div class="col-sm-2" id="idAndStar">' +
                         '<p> 아이디 : ' + review.member_id + '</p>' +
                         '</div>' +
                         '<div class="col-sm-7" id="reviewContent">' +
                         '<p> 내용 : ' + review.content + '</p>' +
                         '</div>';

                     if (memberId === review.member_id) {
                         reviewHtml += '<button id="reviewRemoveBtn"><span class="glyphicon glyphicon-remove"></span></button>';
                     }

                     reviewHtml +=
                         '<input type="hidden" id="reviewIdInput" value="' + review.review_id + '"/>' +
                         '</div>' +
                         '</div>';

                     $(".reviewDiv").append(reviewHtml);
                 });

            },
            error: function (xhr, status, error) {
                //console.error("AJAX Error:", error);
                console.log(error);
                alert("실패");
            }
        });
    }
   	
    productLoadReviews(${prpgm.cri.page});
    
    // 페이징 클릭
    $(".paging-list").click(function () {
    	
        var pageNum = $(this).data("page"); // data-page 속성에서 페이지 번호 가져오기
        productLoadReviews(pageNum);
    });
    	
   });   /// end jquery
    
    
    
    
    // 리뷰 삭제하기
    $(document).ready(function(){  	
    	$(document).on("click", '#reviewRemoveBtn', function () {
            alert("삭제되었습니다.");
            var reviewIdInput = $("#reviewIdInput").val();
            var productIdInput = $("#productIdInput").val();
            var locate = "/store/reviewRemove?reviewId=" + reviewIdInput + "&product_display_id=" + productIdInput;
            location.href = locate;
        });
    });

    	
    
	// 사진 프리뷰 보여주기
    function readURL(input) {	// 파일을 선택해서 변화가 생겼을 때
    	// 파일을 선택해서 파일이 있는 경우. files[0] : 선택한 첫번째 파일
    	if(input.files && input.files[0]) {
    		var reader = new FileReader();
    		reader.onload = function(e) {
    			$('#preview').attr('src', e.target.result);
    		}
    		reader.readAsDataURL(input.files[0]);
    	}
    }
    
    // 장바구니 바로 가기 버튼
    $(document).ready(function (){	
    	$("#goToCart").on("click", function(){
    		if(memberId != 'null'){		
        		var quantity = parseInt($("#quantity").val());
        		var param = $("#displayParam").val();
        		var locate = "/store/addToCart?product_display_id=" + param + "&quantity=" + quantity + "&cartOrStore=cart";
        		location.href = locate;
   		
        		}else if (memberId == 'null'){
        			alert("로그인이 필요한 서비스입니다.");
        			var currentURL = window.location.href; // 현재 페이지의 URL을 가져옴
        	        location.href = "/member/login?action=" + encodeURIComponent(currentURL);	
        		}
    	});
    });
    
    // 상품 더 담기 버튼
    $(document).ready(function (){
    	$("#moreProduct").on("click", function(){
    		if(memberId != 'null'){		
    		var quantity = parseInt($("#quantity").val());
    		var param = $("#displayParam").val();
    		var locate = "/store/addToCart?product_display_id=" + param + "&quantity=" + quantity + "&cartOrStore=store";
    		location.href = locate;
    		
    		
    		}else if (memberId == 'null'){
    			alert("로그인이 필요한 서비스입니다.");
    			var currentURL = window.location.href; // 현재 페이지의 URL을 가져옴
    	        location.href = "/member/login?action=" + encodeURIComponent(currentURL);	
    		}
	
    	});
    });
    
    
    
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
      
      // 바로 구매
    $(document).ready(function(){
    	$('#buyNow').on("click", function(){
    		
    		
    		if(memberId != 'null'){		
    			
    		const priceString = document.getElementById("price").textContent;
    		const price = parseInt(priceString.replace(/[^\d]/g, ""));
    		var productID = $("#productIdInput").val();
    		var count = $("#quantity").val();
    		var image = $("#imageHidden").val();
    		var name  = $("#nameHidden").val();
    		var total = price * count;
    		var encodedName = encodeURIComponent(name);
    		var locate = "/store/addToCart?product_display_id=" + productID +"&quantity=" + count + "&cartOrStore=buyNow&image=" + image + "&name=" + name + "&total=" + total +"&price=" + price;
			
    		console.log(productID);
    		console.log(price);
    		console.log(count);
    		console.log(image);
    		console.log(name);
    		console.log(total);
    			
    		location.href = locate;

        		}else if (memberId == 'null'){
        			alert("로그인이 필요한 서비스입니다.");
        			var currentURL = window.location.href; // 현재 페이지의 URL을 가져옴
        	        location.href = "/member/login?action=" + encodeURIComponent(currentURL);	
        		}
    		
    		
    		
    		
    		
    		
    		
    	});
    });
    
    </script>
  </body>
</html>
