<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>상품 상세 페이지</title>
	<%@ include file="../include/header.jsp" %>
	<!--<script type="text/javascript">	
		history.pushState(null, null, location.href);
	    window.onpopstate = function () {
	    	location.href="/sole/sole?alcohole_category=" + ${recipe.alcohole_category};
		};        
	</script> /// 왜 실행이 안될까  ==> 왜 실행이 되는걸까 , 쓰면서도 뭔 소린지 모르겠음 ==> 하루지나니까 다시 실행이 안됨 왜 ? -->
	
    <style>
    /*상품 관련 이미지, 위치*/
	 
    .product-img {
    /*width: 400px;
    height: 400px;
    margin-top: 100px;*/
    /*max-width: 100%;
	width: auto;
	height: auto;*/
	width: 100%;
    margin: auto;
    height: 500px !important;
	}
   	.product-info {
		margin-top: 39px;
    }
    /*상품 관련 이미지, 위치*/
	
    /*테이블*/
	.t {
	 	height: 300px;
	  	font-size: 18px;
	}
	.t th,
	.t td {
	  	vertical-align: middle !important;
	}
	h1 {
	  	text-align: center;
	}
	.t th {
	  	background-color: rgba(37,85,108,0.8);
	  	color:white;
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
	    background-color: rgba(37,85,108,1);;
	}
	
    a:link {
	    text-decoration-line: none;
	    color: white;
	}
	a:visited {
    	color: white;
    	text-decoration-line: none;
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
	.noliked {
		font-size: 3em;
		color: transparent;
		text-shadow: 0 0 0 #f0f0f0;
		cursor: pointer;
 	}
	.liked {
	 	font-size: 3em;
	 	color: transparent;
	 	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	 	cursor: pointer;
	}
	 
	.btnAndliked {
		display: flex; 
	 	flex-direction: row; 
	 	align-items: center;
	}
	 
 	.right {
	 	margin-left: auto;
	}
	 
	.imgclass {
	 	width: 100%;
	    margin: auto;
	    height: 165px !important;
	}
	  
	.list  {
		margin-bottom: 20px;
		float: right;
		background-color:#25556C;
		border-radius:8px;
		border:none;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family: 'Cafe24Supermagic-Bold-v1.0';
		font-size:12px;
		font-weight:bold;
		padding:8px 18px;
		text-decoration:none;
		float: right;
		margin-bottom:10px; 
	}
	 
	.list:hover { background-color: #51a1c7; }
	
	.list:active { position:relative; top:1px; }
	 
	table {
	    width: 60%;
	    border-top: 1px solid #25556C;
	    border-collapse: collapse;
  		text-align: center;
  		box-shadow: 0 2px 5px rgba(0,0,0,.25);
  	} 
  	
  	thead { background-color: rgba(37,85,108,0.7); color:white; }
  	
  	th, td {
	    border-bottom: 1px solid #25556C;
	    border-left: 1px solid #25556C;
	    padding: 10px;
	    font-size: 20px;
	    text-align: center;
	}
	th:first-child, td:first-child {
	    border-left: none;
	}
  	
  	#reviewBtn {
		width: 90px;
		height: 35px;
		font-size: 15px;
		border-radius: 5px;
		border: none;
		background-color: #E96F84;
		color: #fff;
		margin-left: 50px;
    	margin-top: 18px;
	}

	#reviewBtn:hover { background-color: #c90076; }
  	
  	
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
            <table class="table table-bordered t" style="margin:0px;">
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
            <div class="btnAndliked">
	            <div>
	            	<button type="button" id="moklok" class="list">목록으로 돌아가기</button>
	            </div>
            <!-- 즐겨찾기 부분 -->
			<c:choose>
			    <c:when test="${empty member.m_id || member.m_id eq ''}">
			        <div align="right" class="right">
			            <span class="noliked" id="mark">★</span>
			        </div>
			    </c:when>
			    
			    <c:when test="${not empty likedselect.liked_id}">
			        <div align="right" class="right">
			            <span class="liked" id="mark">★</span>
			        </div>
			    </c:when>
			    
			    <c:otherwise>
			    	<div align="right" class="right">
			            <span class="noliked" id="mark">★</span>
			        </div>
			    </c:otherwise>
			</c:choose>
			</div>
          </div>
          
        </div>

        <!---------------------------------------------여백------------------------------------------------------------------------>
        <br />
        <br />
        <br />
        <br />
        <div class="container1" >
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
               	<div align="center">
           		<table>
           			<thead>
           			<tr>
           				<th>재료</th>
           				<th>용량</th>
           			</tr>
           			</thead>
                 	<c:forEach var="recipeDetail" items="${recipeDetail}">
               			<tr>
               				<td>${recipeDetail.ingredient_name}</td>
               				<td>${recipeDetail.ingredient_cpcty}</td>
               			</tr>
                 	</c:forEach>
                </table>
                <br/>
               	</div>
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
							<a class="paging-list" data-page="${pageNum}"><i style="color:black">${pageNum}</i></a>
								</li>
						</c:forEach>
										
					<c:if test="${rpgm.next}">
						<li>
							<a class="paging-list" data-page="${rpgm.endPage +1}"><span class="glyphicon glyphicon-chevron-right"></span></a>
						</li>
					</c:if>
				</ul>
			 </div>
			 <br/>
              	<div class="col-md-offset-2 col-sm-1">
              		<form id="reviewForm" action="/sole/soleReview" method="post">
              			<input type="hidden" name="recipe_code"/>
              			<input type="hidden" name="m_id"/>
              			<button type="button" id="reviewBtn" class="btn btn-defualt">리뷰쓰기</button>
              		</form>
              	</div>
			</div>
			<br/><br/>
            </div>
          </div>
        </div>
       </div>
    </div>
  
    <br/><br/>
   <%@ include file="../include/footer.jsp" %>
   
    <script>
		$(document).ready(function () {
			var reviewForm = $("#reviewForm");
			var page = ${rpgm.cri.page} || 1;
			var encodedPage = encodeURIComponent(page);
			
			$("#reviewBtn").click(function() {
							
				if("${member.m_id}" != null) {
					reviewForm.find("[name='recipe_code']").val("${recipe.recipe_code}");
					reviewForm.find("[name='m_id']").val("${member.m_id}");
					reviewForm.submit();
				}
				
				if("${member.m_id}" == null || "${member.m_id}" == '') {
					alert("로그인하셔야 작성할 수 있습니다.");
				 	
				 	var actionParam = "/sole/soleDetail?recipe_code=" + "${recipe.recipe_code}" + "&page=" + page;
					location.href = "/member/login?action=" + actionParam;
				}
			});	
					
			///// ajax 
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
		                        '<img class="imgclass" src="${path}/ReviewDownload?review_image=' + review.image + '&review_id=' + review.review_id + '" width="100%" height="100%"/>' +
		                        '</div>' +
		                        '<div class="col-sm-2">' +
		                        '<p>' + review.m_id + '</p>' +
		                        '<p>' + review.writedate + '</p>' +
		                        '<p>' + starHtml + '</p>' +
		                        '</div>' +
		                        '<div class="col-sm-6">' +
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
		    	
		        var pageNum = $(this).data("page"); // data-page 속성에서 페이지 번호 가져오기
		        loadReviews(pageNum);
		    });
		 
//////////////////////////////////////////////////////////////////////////// 찜 하는 부분			
		    $(document).on("click", ".noliked", function() {
		    	if("${member.m_id}" == null || "${member.m_id}" == '') {
		    		alert("로그인 하셔야 찜 할 수 있습니다.");
		    	}else {
		        	likedInsert($(this));
		    	}
		    });

		    $(document).on("click", ".liked", function() {
		        likedDelete($(this));
		    });
		    
		    
		    function likedInsert() {
		    	$.ajax({
		    		url: "/sole/likedInsert",
		    		type: "GET",
		    		dataType: "text",
		    		data: {"recipe_code": "${recipe.recipe_code}", "m_id": "${member.m_id}"},
		    		success: function() {
		    			$("#mark").removeClass("noliked").addClass("liked");
		    		},
		    		error: function(error) {
		    			console.error("error : " + error);
		    			alert("실패");
		    		}
		    	});
		    } ///////////// end likedInsert
		    
		    function likedDelete() {
		    	$.ajax({
		    		url: "/sole/likedDelete",
		    		type: "GET",
		    		dataType: "text",
		    		data: {"recipe_code": "${recipe.recipe_code}", "m_id": "${member.m_id}"},
		    		success: function() {
		    			$("#mark").removeClass("liked").addClass("noliked");
		    		},
		    		error: function(error) {
		    			console.error("error : " + error);
		    			alert("실패");
		    		}
		    	});
		    } ///////////// end likedDelete
		    
		    // 목록으로 돌아가기
		    $("#moklok").click(function() {
		    	location.href="/sole/sole?alcohole_category=" + ${recipe.alcohole_category};
		    });
		});   /// end $
    </script>
  </body>
</html>