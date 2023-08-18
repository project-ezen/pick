<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@ include file="../include/header.jsp" %>
<style>
/* 체크박스 크기 설정 */
#check{
    height: 15px;
    width: 15px;
}
/* disable cursor 스타일 */
input.form-control:hover{
    cursor: default;
}
/* 배경 화면 */
body { 	
    background-image:url("/resources/images/background2.jpg");
    background-attachment: fixed, scroll;
    background-repeat:no-repeat;
    background-size:cover;
}

#class {
	background-color: #EBFBFF;
	padding: 10px 0;
}

</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<div class="row">
		<div class="container" id="class">
			<section class="container text-center" style="margin: auto;">
				<h2 align="center">장바구니</h2>
			   <!-- 구매 상품 확인하기 -->
			   <br/>
			   <div>
			       <table class="table table-bordered">
			       	<tr>
			       		<th class="text-center">선택</th>
			            <th class="text-center">No.</th>
			            <th class="text-center">상품(Thumbnail)</th>
			            <th class="text-center">상품명</th>
			            <th class="text-center">수량</th>
			            <th class="text-center">가격</th>
			           </tr>
			           <tr>
			               <td class="form-group" style="vertical-align: middle;">
			                   <div>
			                       <label>
			                           <input id="check" type="checkbox">
			                       </label>
			                   </div>
			               </td>
			               <td class="form-group" style="vertical-align: middle;">
			                   <div><span>1</span></div>
			               </td>
			               <td class="form-group" style="vertical-align: middle;">
	                        <div class="col-md-12" id="item_thumbnail">
	                            <a href="#" class="thumbnail">
	                                <input class="text-center" type="image" src="/resources/images/alcohol.png" width="161" height="133" id="pdt_thumbnail" name="pdt_thumbnail" disabled>
	                            </a>
	                        </div>
	                    </td>
			               <td class="form-group" style="vertical-align: middle;">
			                   <input class="form-control" type="text" id="pdt_price" name="pdt_price" disabled>
			               </td>
			               <td class="form-inline" style="vertical-align: middle;">
			                   <div class="form-group">
			                       <button type="button" id="minus" class="btn btn-default"><span class="glyphicon glyphicon-minus"></span></button>
			                       <input class="form-control text-center" width="30px" type="text" id="count" name="count" value="1">
			                       <button type="button" id="plus" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></button>
			                   </div>
			               </td>
			               <td class="form-group" style="vertical-align: middle;">
			                   <input class="form-control" type="text" id="pdt_price" name="pdt_price" disabled>
			               </td>
			           </tr>
			   		</table>
			   </div>
			   <!-- 구매 상품 확인하기 끝 -->
			 <hr>
			</section>
			<!-- 결재 금액 확인하기 -->
			<section class="container">
			    <form>
			        <table class="table table-bordered">
			            <tr align="center">
			                <th class="text-center">전체 금액</th>
			                <th class="text-center">배송비</th>
			                <th class="text-center">총 금액</th>
			            </tr>
			            <tr class="action">
			                <td class="form-group">
			                    <input class="form-control" type="text" id="hole_price" name="hole_price" disabled>
			                </td>
			                <td class="form-group">
			                    <input class="form-control" type="text" id="delivery_fee" name="delivery_fee" disabled>
			                </td>
			                <td class="form-group">
			                    <input class="form-control" type="text" id="total_price" name="total_price" disabled>
			                </td>
			            </tr>
			        </table>
			        <div class="text-right">
			            <button type="button" id="pay" name="pay" class="btn btn-primary" onclick="fn_order()">결제하기</button>
			        </div>
			    </form>
			</section>
		</div>
	<!-- 결재 금액 확인하기 끝 -->
	<br/><br/><br/><br/>
	</div>
	<br/>
	<div class="row">
		<%@ include file="../include/footer.jsp" %>
	</div>
</body>
<script>
function fn_order() {
	document.location.href="/shopping/order";
}
</script>
</html>