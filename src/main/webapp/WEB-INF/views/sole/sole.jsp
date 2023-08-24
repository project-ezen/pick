<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
	.bg {
		 background-image: url("/resources/images/background2.jpg");
         height: 100vh;        /*%로 주면 안되고 vh로 줘야함  */
		 background-attachment: fixed, scroll;
         background-position: center;
         background-repeat: no-repeat;
         background-size: cover; 
	}
	h1 {
		color: black;
	}
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
	  color: #fff;
	  background: #272822;
	}
	a:link {
		text-decoration-line: none;
		color: black !important;
	}
	a:visited {
		text-decoration-line: none;
		color: black !important;
	}
	
	img {
		max-width: 100%;
		width: auto;
		height: auto;		/* 이미지 크기 자동조절*/
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
<body class="bg">
	<div id="bigdiv" class="container" style="background-color:white;">
		<h1 style="text-align:center">Alcohole</h1>
		<br>
		<!-- select  -->
		<div class="selectdiv">
			<select id="dosu">
				<option value="">도수</option>
				<option value="8">약한도수</option>
				<option value="9">중간도수</option>
				<option value="10">강한도수</option>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select id="mat">
				<option>맛</option>
				<option value="단맛">단맛</option>
				<option value="쓴맛">쓴맛</option>
				<option value="신맛">신맛</option>
			</select>
		</div>
		<br/><br/><br/>
		<!-- items -->
		<div class="col-sm-12">			
			<c:forEach var="livesole" items="${sole}">
				<!-- 게시글 목록에서 한 건씩 추출하여 화면에 출력시킨다. -->
				<div class="col-sm-3">
					<a href="#"><img src="${path}/download?recipe_image=${livesole.recipe_image}"/></a>
					<p style="text-align: center;"><a href="#">${livesole.alcohole_name}</a></p>
				</div>
			</c:forEach>
			
			<div class="input-group col-sm-12" style="bottom: 5px;">	
            	<span class="input-group-addon"><span class="glyphicon glyphicon-search" id="searchBtn"></span></span>
            	
            	<input type="text" class="form-control" id="searchBox"/>
            	
            	<form id="formList" action="/sole/sole" method="get">
					<input type="hidden" name="page"/>
					<input type="hidden" name="keyword"/>
					<input type="hidden" name="dosu"/>
					<input type="hidden" name="mat"/>
				</form>
            	
            	<ul class="btn-group pagination col-sm-offset-6 col-sm-2">
					<c:if test="${pageMaker.prev}">
						<li>
							<a href='<c:url value="/sole/sole?page=${pageMaker.startPage-1}&keyword=${cri.keyword}"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
						</li>
					</c:if>
					
					<c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}" var="pageNum">
						<li>
							<a href='<c:url value="/sole/sole?page=${pageNum}&keyword=${cri.keyword}&dosu=${cri.dosu}&mat=${cri.mat}"/>'><i>${pageNum}</i></a>
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
	<br/>
<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("#formList");
		
		$("#searchBox").keydown(function(key) {
			if(key.keyCode === 13) {
				var keywordStr = $("#searchBox").val();
				formObj.find("[name='keyword']").val(keywordStr);
				formObj.find("[name='page']").val("1");
				formObj.submit();
			}
		});
		
		$("#searchBtn").click(function () {
			var keywordStr = $("#searchBox").val();
			formObj.find("[name='keyword']").val(keywordStr);
			formObj.find("[name='page']").val("1");
			formObj.submit(); 
		});
		
		$("#dosu").on("change", function() {
			var dosuint = $("#dosu").find(":selected").val();
			alert(dosuint);
			formObj.find("[name='dosu']").val(dosuint);
			formObj.find("[name='page']").val("1");
			formObj.submit();
		});
		
		$("#mat").on("change", function() {
			var mat = $("#mat").find(":selected").val();
			alert(mat);
			formObj.find("[name='mat']").val(mat);
			formObj.find("[name='page']").val("1");
			formObj.submit();
		});
	});
</script>
</body>
</html>