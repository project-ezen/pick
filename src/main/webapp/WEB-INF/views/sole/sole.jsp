<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피술</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">

	.container { background-color: #fff; min-height: 600px; }
	
	.foot { padding-bottom: 150px; padding-top: 150px; margin:auto; }

	h1 { color: black; }
	#bigdiv {
		/*height: auto;    /* footer 아래로 고정 */
  		/*min-height: 100%;
  		padding-bottom: 63px;*/
	}
	.selectdiv {
		display: flex;
		justify-content: center;
		item-align: center;   /*셀렉박스 가운데정렬*/
	}
	select {
		width: 200px;
		padding: .8em .5em;
		font-family: inherit;
		background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		border: 1px solid #999;
		color: black;
		border-radius: 10px;
	}
	option {
	  padding: 4px;
	  font-size: 14px;
	  color: black;
	  /*background: #272822;*/
	}
	a:link {
		text-decoration-line: none;
		color: white;
	}
	a:visited {
		text-decoration-line: none;
		color: white;
	}
	
	a.alink:link {
		text-decoration-line: none;
		color: black;
	}
	
	a.alink:visited {
		text-decoration-line: none;
		color: black;
	}
	
	.soleimg {
		/*max-width: 100%;*/
		/*width: auto;
		height: auto;		/* 이미지 크기 자동조절*/
		/*position: absolute;*/
		/*object-fit: cover;*/
		width: 100%;
        margin: auto;
        height: 230px !important;
	}
	#searchBox {
		width: 15%;
		height: 34px;
		padding: 0px;
	}
	
	.pagination {
		margin: 0 0 0 300px;
		padding: 0px;
	}
</style>
</head>
<%@ include file="../include/topMenu.jsp" %>
<body>
<div class="foot">
	<div id="bigdiv" class="container">
		<h1 style="text-align:center">Alcohole</h1>
		<br>
		<!-- select  -->
		<div class="selectdiv">
			<select id="dosu">
				<option value="0">도수</option>
				<option value="8">약한도수</option>
				<option value="9">중간도수</option>
				<option value="10">강한도수</option>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select id="mat">
				<option value="모든">맛</option>
				<option value="단맛">단맛</option>
				<option value="쓴맛">쓴맛</option>
				<option value="신맛">신맛</option>
			</select>
		</div>
		<br/><br/><br/>
		<!-- items -->
		<div class="col-sm-12">			
			<c:forEach var="sole" items="${sole}">
				<!-- 게시글 목록에서 한 건씩 추출하여 화면에 출력시킨다. -->
				<div class="col-sm-3">
					<a href="/sole/soleDetail?recipe_code=${sole.recipe_code}&page=0"><img class="soleimg" src="${path}/download?recipe_image=${sole.alcohole_image}"/></a>
					<p style="text-align: center;"><a href="/sole/soleDetail?recipe_code=${sole.recipe_code}&page=0" class="alink">${sole.alcohole_name}</a></p>
				</div>
			</c:forEach>
			
			<div class="input-group col-sm-12" style="bottom: 5px;">	
            	<span class="input-group-addon"><span class="glyphicon glyphicon-search" id="searchBtn"></span></span>
            	
            	<input type="text" class="form-control" id="searchBox" value="${cri.keyword}"/>
            	
            	<form id="recipeList" action="/sole/sole" method="get">
					<input type="hidden" name="page"/>
					<input type="hidden" name="keyword"/>
					<input type="hidden" name="dosu"/>
					<input type="hidden" name="mat"/>
					<input type="hidden" name="alcohole_category"/>
				</form>
            	
            	<ul class="btn-group pagination col-sm-offset-6 col-sm-2">
					<c:if test="${pageMaker.prev}">
						<li>
							<a href='<c:url value="/sole/sole?page=${pageMaker.startPage-1}&keyword=${cri.keyword}"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
						</li>
					</c:if>
					
					<c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}" var="pageNum">
						<li>
							<a href='<c:url value="/sole/sole?page=${pageNum}&keyword=${cri.keyword}&dosu=${cri.dosu}&mat=${cri.mat}&alcohole_category=${cri.alcohole_category}"/>' class="alink"><i>${pageNum}</i></a>
						</li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li>
							<a href='<c:url value="/sole/sole?page=${pageMaker.endPage+1}&keyword=${cri.keyword}"/>'><span class="glyphicon glyphicon-chevron-right"></span></a>
						</li>
					</c:if>
				</ul>
			</div>			
		</div>
	</div>
	<br/><br/>
</div>
<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
    var listRecipe = $("#recipeList");
    var dosuSelect = $("#dosu");
    var matSelect = $("#mat");
    
    // 페이지 로드 시 셀렉트 박스 값 설정
    var selectedDosu = "${cri.dosu}";
    var selectedMat = "${cri.mat}";
    var selectedCategory = "${param.alcohole_category}";
    
    if (selectedDosu !== "") {
        dosuSelect.val(selectedDosu).change(); // 값을 선택한 상태로 설정하고 change 이벤트 발생
    }
    
    if (selectedMat !== "") {
        matSelect.val(selectedMat).change(); // 값을 선택한 상태로 설정하고 change 이벤트 발생
    }
    
    /////////////////////////////////////////////////////////////////////////////////    

    
    // 서브밋 버튼 클릭 이벤트 핸들러
    $("#searchBtn").click(function() {
        var keywordStr = $("#searchBox").val();
        var keywordStrTrim = keywordStr.trim();
        listRecipe.find("[name='keyword']").val(keywordStrTrim);
        listRecipe.find("[name='alcohole_category']").val(selectedCategory); // 카테고리 값 유지
        listRecipe.find("[name='dosu']").val(selectedDosu); // 카테고리 값 유지
        listRecipe.find("[name='page']").val("1");
        listRecipe.submit();
    });
    
    // 셀렉트 박스 값 변경 이벤트 핸들러
    dosuSelect.on("change", function() {
        var dosuValue = dosuSelect.val();
        if(dosuValue == 0) {
        	listRecipe.find("[name='dosu']").val(dosuValue);
        	listRecipe.find("[name='alcohole_category']").val(selectedCategory); // 카테고리 값 유지
        	listRecipe.find("[name='page']").val("1");
        	listRecipe.submit();
        }else {
	        listRecipe.find("[name='dosu']").val(dosuValue);
	        listRecipe.find("[name='alcohole_category']").val(selectedCategory); // 카테고리 값 유지
	        listRecipe.find("[name='mat']").val(selectedMat); // 카테고리 값 유지
	        listRecipe.find("[name='page']").val("1");
	        listRecipe.submit();
        }
    });
    
    // 셀렉박스 값 변경 이벤트 핸들러
    matSelect.on("change", function() {
        var matValue = matSelect.val();
        if(matValue == "모두") {
        	listRecipe.find("[name='mat']").val(matValue);
        	listRecipe.find("[name='alcohole_category']").val(selectedCategory); // 카테고리 값 유지
        	listRecipe.find("[name='page']").val("1");
        	listRecipe.submit();          
        }
        listRecipe.find("[name='mat']").val(matValue);
        listRecipe.find("[name='alcohole_category']").val(selectedCategory); // 카테고리 값 유지
        listRecipe.find("[name='dosu']").val(selectedDosu); // 카테고리 값 유지
        listRecipe.find("[name='page']").val("1");
        listRecipe.submit();
    });
    
	$("#searchBox").keydown(function(key) {    // 엔터키 누르면 쳐지는
		if(key.keyCode == 13) {
			var keywordStr = $("#searchBox").val();
			var keywordStrTrim = keywordStr.trim();
			listRecipe.find("[name='keyword']").val(keywordStrTrim);
			listRecipe.find("[name='alcohole_category']").val(selectedCategory); // 카테고리 값 유지
			listRecipe.find("[name='mat']").val(selectedMat); // 카테고리 값 유지
			listRecipe.find("[name='dosu']").val(selectedDosu); // 카테고리 값 유지
			listRecipe.find("[name='page']").val("1");
			listRecipe.submit();			
		}
	});
    
    
});
</script>
</body>
</html>