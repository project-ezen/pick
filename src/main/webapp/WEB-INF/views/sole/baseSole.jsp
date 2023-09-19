<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
	h1 {
		color: black;
	}
	#bigdiv {
		height: auto;    /* footer 아래로 고정 */
  		min-height: 100%;
  		padding-bottom: 63px;
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
	
	a.custom-link:link,
	a.custom-link:visited {
    	color: black; 
	}
	
	.foot { padding-bottom: 20px; padding-top: 20px; margin:auto; }
	
	.soleimg {
		/*max-width: 100%;
		width: auto;
		height: auto;		/* 이미지 크기 자동조절*/
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
	<div id="bigdiv" class="container" style="background-color:white;">
		<h1 style="text-align:center">Base Alcohole</h1>
		<br>
		<!-- select  -->
		<div class="selectdiv">
			<select id="jongryu">
				<option value="전부">종류</option>
				<option value="위스키">위스키</option>
				<option value="브랜디">브랜디</option>
				<option value="진">진</option>
				<option value="럼">럼</option>
				<option value="보드카">보드카</option>
				<option value="데킬라">데킬라</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<br/><br/><br/>
		<!-- items -->
		<div class="col-sm-12">			
			<c:forEach var="sole" items="${basesole}">
				<!-- 게시글 목록에서 한 건씩 추출하여 화면에 출력시킨다. -->
				<div class="col-sm-3">
					<a href="/store/productInfos?product_display_id=${sole.alcohole_name}"><img class="soleimg" src="${path}/Basedownload?alcohole_image=${sole.alcohole_image}"/></a>
					<p style="text-align: center;"><a class="custom-link" href="/store/productInfos?product_display_id=${sole.alcohole_name}">${sole.alcohole_name}</a></p>
				</div>
			</c:forEach>
			
			<div class="input-group col-sm-12" style="bottom: 5px;">	
            	<span class="input-group-addon"><span class="glyphicon glyphicon-search" id="searchBtn"></span></span>
            	
            	<input type="text" class="form-control" id="searchBox" value="${cri.keyword}"/>
            	
            	<form id="BaseList" action="/sole/baseSole" method="get">
					<input type="hidden" name="page"/>
					<input type="hidden" name="sole_jongryu"/>
					<input type="hidden" name="alcohole_category"/>
					<input type="hidden" name="keyword"/>
				</form>
            	
            	<ul class="btn-group pagination col-sm-offset-6 col-sm-2">
					<c:if test="${pageMaker.prev}">
						<li>
							<a href='<c:url value="/sole/baseSole?page=${pageMaker.startPage-1}&keyword=${cri.keyword}"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
						</li>
					</c:if>
					
					<c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}" var="pageNum">
						<li>
							<a href='<c:url value="/sole/baseSole?page=${pageNum}&sole_jongryu=${cri.sole_jongryu}&alcohole_category=${cri.alcohole_category}"/>'><i style="color:black">${pageNum}</i></a>
						</li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li>
							<a href='<c:url value="/sole/baseSole?page=${pageMaker.endPage+1}&keyword=${cri.keyword}"/>'><span class="glyphicon glyphicon-chevron-right"></span></a>
						</li>
					</c:if>
				</ul>
			</div>			
		</div>
	</div>
	</div>
	<br/><br/>
<%@ include file="../include/footer.jsp" %>
</body>
<script>
	$(document).ready(function() {
		var baseForm = $("#BaseList");
		var jong	= $("#jongryu");
		
		// 페이지 로드시 셀렉트박스 값 설정
		var selectJong = "${cri.sole_jongryu}";
		var selectCategory = "${param.alcohole_category}";
		
		if(selectJong !== "") {   // 값을 선택했을 때 셀렉박스를 값 선택한 모양으로
			jong.val(selectJong).change();
		}
		
		/// 서치박스
		$("#searchBtn").click(function() {
			var keywordStr = $("#searchBox").val();
			var keywordStrTrim = keywordStr.trim();
			baseForm.find("[name='keyword']").val(keywordStrTrim);
			baseForm.find("[name='sole_jongryu']").val(selectJong);
			baseForm.find("[name='alcohole_category']").val(selectCategory);
			baseForm.find("[name='page']").val("1");
			baseForm.submit();
		});
		
		/// 엔터키 누르면
		$("#searchBox").keydown(function(key) {
			if(key.keyCode == 13) {
				var keywordStr = $("#searchBox").val();
				var keywordStrTrim = keywordStr.trim();
				baseForm.find("[name='keyword']").val(keywordStrTrim);
				baseForm.find("[name='sole_jongryu']").val(selectJong);
				baseForm.find("[name='alcohole_category']").val(selectCategory);
				baseForm.find("[name='page']").val("1");
				baseForm.submit();
			}
		});
		
		////// 셀렉박스
		jong.on("change", function() {
			var jongValue = jong.val();
			baseForm.find("[name='sole_jongryu']").val(jongValue);
			baseForm.find("[name='alcohole_category']").val(selectCategory);
			baseForm.find("[name='page']").val("1");
			baseForm.submit();
		});
		
	});//// end $
</script>

</html>