<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order</title>
<%@ include file="../include/header.jsp" %>
	<title>Home</title>
	<style>
    /* 체크박스 크기 설정 */
    #info{
        width: 15px;
        height: 15px;
    }
    /* 결제하기 버튼 위치 설정 */
    #pay {
        width: 85px;
		height: 40px;
		font-size: 15px;
		border-radius: 5px;
		border: none;
		background-color: #25556C;
		color: #fff;
    }
    /* 팝업 창 내 내용 보여주는 스타일 */
    #contract{
        overflow-y: scroll;
        height: 300px;
        border-radius: 5px;
        border: 1px solid black;
    }
    /* 개인정보 확인 여부  */
    #info:hover, #info_s:hover {
        cursor: default;
    }
    
    #class {
		background-color: #EBFBFF;
		padding: 10px 0;
	}
	
	
	.btn_sub:hover { background-color:#687AB6; }
	
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<br/><br/>
<div class="row">
	<div class="container" id="class">
	    <section class="container text-center" id="ff">
	        <div><h1>주문하기</h1></div>
	        <br/>
	        <form action="/shopping/orderdetail" method="post" id="orderConfirm">
	        <!-- 주문 상품 나열하기 -->
	        <div>
	            <table class="table table-stripted">
	                <thead>
	                    <tr>
	                        <th class="text-center">No.</th>
	                        <th class="text-center">썸네일</th>
	                        <th class="text-center">상품명</th>
	                        <th class="text-center">수량</th>
	                        <th class="text-center">가격</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach var="display" items="${displayOrder }" varStatus="displayStatus">
	 	                    <tr>
		                        <td class="form-group" style="vertical-align: middle;">
		                        	<input type="hidden" name="cart" value="${display.cart_id }">
								    <div><span>${displayStatus.count }</span></div>
								</td>
								<td class="form-group" style="vertical-align: middle;">
									<div class="col-md-12 text-center" id="item_thumbnail">
									    <a href="#" class="thumbnail">
									        <input type="image" src="/resources/product_images/${display.image }" width="161" height="133" disabled>
									    </a>
									</div>
								</td>
								<td class="form-group" style="vertical-align: middle;">
								    <input class="form-control text-center productName" type="text" value="${display.name }" disabled>
								    <input type="hidden" name="productName" value="${display.name }">
								</td>
								<td class="form-inline" style="vertical-align: middle;">
								    <div class="form-group">
								        <input class="form-control text-center cnt" width="30px" type="text" value="${display.count }" disabled>
								        <input type="hidden" name="productCount" value="${display.count }">
								    </div>
								</td>
								<td class="form-group" style="vertical-align: middle;">
									<input class="form-control text-center productPrice" type="text" value="${display.price }" disabled>
								</td>
		                    </tr>
	                    </c:forEach>
	                    <tr>
	                    	<td colspan="5"></td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	        <!-- 주문 상품 나열 끝 -->
	        
	        <div class="form-horizontal">
	            <div class="row">
	                <!-- 배송 정보 -->
	                <div class="col-md-6 col-sm-11">
	                    <div class="form-group">
	                        <label class="control-label col-sm-2">수령인</label>
	                        <div class="col-sm-10">
	                            <input type="text" class="form-control text-center" value="${member.m_name }" name="receiver_name" id="name">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="control-label col-sm-2">전화번호</label>
	                        <div class="col-sm-10">
	                            <input type="text" class="form-control text-center" value="${member.m_tel }" name="receiver_phonenum" id="phone">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="control-label col-sm-2">우편번호</label>
	                        <div class="col-sm-10">
	                            <input type="text" class="form-control text-center" value="${member.m_zipcode }" name="zipcode" id="zipcode">
								<input type="button" class="form-control" onclick="daumZipCode()" value="우편번호검색">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="control-label col-sm-2">주소</label>
	                        <div class="col-sm-10">
	                            <input type="text" class="form-control text-center" value="${member.m_address }" name="address" id="address">
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <label class="control-label col-sm-2">상세주소</label>
	                        <div class="col-sm-10">
	                            <input type="text" class="form-control text-center" value="${member.m_addressDetail }" name="address_detail" id="address_detail">
	                        </div>
	                    </div>
	                </div>
	                <!-- 배송 정보 끝 -->
	                
	                <!-- 구매 여부 확인 -->
	                <div class="col-md-offset-1 col-md-4 col-sm-offset-6 col-sm-5">
				        <div class="form-group text-right">
				            <table class="table table-scripted" style="border-radius: 5px;">
				                <tr>
				                    <td class="text-center" style="vertical-align: middle;">전체금액</td>
				                    <td align="center">
				                    	<label>
				                    		<input class="form-control text-center" id="totalPrice" type="text" value="${total_price }" disabled>
				                    	</label>
				                    </td>
				                </tr>
				                <tr>
				                    <td class="text-center" style="vertical-align: middle;">배송비</td>
				                    <td align="center">
				                    	<label>
				                    		<input class="form-control text-center" id="deliveryFee" type="text" value="0" disabled> <!-- 3000 -->
				                    	</label>
				                    </td>
				                </tr>
				                <tr>
				                    <td class="text-center" style="vertical-align: middle;">총금액</td>
				                    <td align="center">
				                    	<label>
				                    		<input class="form-control text-center" id="finalPrice" type="text" disabled>
				                    		<input class="form-control text-center" id="fnPrice" type="hidden" name="final_price">
				                    	</label>
				                    </td>
				                </tr>
				            </table>
				        </div>
				        <br>
	                    <div class="form-group text-right">
	                        <div class="checkbox">
	                            <h4>
	                                <label data-toggle="modal" data-target="#info_modal">
	                                    <span id="info_s">구매 서약 동의 여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	                                    <input type="checkbox" id="info" name="info" value="false" disabled>
	                                </label>
	                            </h4>
	                        </div>
	                    </div>
	                    <div class="form-group text-right">
	                    	<input type="hidden" name="order_number" value="${order_number }">
	                        <button type="button" class="btn_sub" id="pay" onclick="javascript: document.getElementById('orderConfirm').submit()" disabled>결제하기</button> <!-- onclick="requestPay()" -->
	                    </div>
	                </div>
	                <!-- 구매 여부 확인 끝 -->
	            </div>
	        </div>
	        </form>
	        
      		<!-- 개인 정보 수집 여부 label을 클릭했을 경우 modal(팝업)창 띄우기 -->
            <div class="modal fade" role="dialog" tabindex="-1" id="info_modal">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>
                            <h4>이용 약관</h4>
                        </div>
                        <div class="modal-body">
                            <div id="col-md-offset-2 col-md-8">
                                <p class="text-left" id="contract">
                                네이버 유료서비스 이용약관<br>
                                제1조 (목적)<br>
                                이 약관은 네이버㈜(이하 '회사'라 합니다)가 제공하는 네이버 유료서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항 기타 필요한 사항을 규정함을 목적으로 합니다.
                                <br>
                                제2조 (약관의 게시와 개정)<br>
                                ① 회사는 이 약관을 회원이 그 전부를 인쇄할 수 있고 확인할 수 있도록 기술적 조치를 취합니다.<br>
                                ② 회사는 회원이 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회 등과 같은 중요한 내용을 회원이 쉽게 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공합니다.<br>
                                ③ 회사는 ‘콘텐츠산업진흥법’, ‘전자상거래등에서의소비자보호에관한법률’, ‘약관의규제에관한법률’ 등 관련 법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
                                ④ 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 서비스 초기 화면에 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 30일 전부터
                                적용일자 전일까지 공지하며, 공지 외에 일정기간 서비스 내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.<br>
                                ⑤ 회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 전항의 공지기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를
                                하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.<br>
                                ⑥ 회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는
                                이용계약을 해지할 수 있습니다.<br>
                                ⑦ 회원은 전항에 따른 이용계약의 해지로 손해가 발생한 경우 회사에 이에 대한 배상을 청구할 수 있습니다.<br>
                                
                                제3조 (약관의 해석)<br>
                                이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 ‘콘텐츠진흥법’, ‘전자상거래등에서의소비자보호에관한법률’, ‘약관의규제에관한법률’, 문화체육관광부장관이 정하는 ‘콘텐츠이용자보호지침’, 기타 관계법령,
                                ‘네이버 이용약관’ 또는 상관례에 따릅니다.<br>
                                
                                제4조 (회원에 대한 통지)<br>
                                ① 회사가 회원에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.<br>
                                ② 회사는 회원 전체에 대한 통지의 경우 7일 이상 회사의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 제1항의 통지를 합니다.<br>
                                
                                제5조 (유료서비스의 내용 등의 게시)<br>
                                ① 회사는 다음 사항을 해당 네이버 유료서비스의 이용 초기화면이나 FAQ 등에 회원이 알기 쉽게 표시합니다.<br>
                                1. 네이버 유료서비스의 명칭 또는 제호<br>
                                2. 네이버 유료서비스 제공자의 성명(법인인 경우에는 법인의 명칭), 주소, 전화번호<br>
                                3. 네이버 유료서비스의 내용, 이용방법, 이용료, 기타 이용조건<br>
                                ② 회사의 유료서비스의 이용 가능 기기 및 이용에 필요한 최소한의 기술사양은 권장사양정보에 따릅니다.<br>
                                ③ 회사는 유료서비스를 제공함에 있어 유료 서비스의 교환·반품·보증과 그 대금 환불의 조건 및 절차에 관한 사항을 제공합니다.<br>
                                
                                제6조 (이용계약의 성립 등)<br>
                                ① 회원은 회사가 제공하는 다음 또는 이와 유사한 절차에 의하여 이용신청을 합니다. 회사는 계약 체결 전에 각 호의 사항에 관하여 회원이 정확하게 이해하고 실수 또는 착오 없이 거래할 수 있도록 정보를 제공합니다.<br>
                                1. 유료서비스의 확인 및 선택<br>
                                2. 결제방법의 선택 및 결제정보의 입력<br>
                                3. 유료서비스의 이용신청에 관한 확인 또는 회사의 확인에 대한 동의<br>
                                ② 회사는 회원의 이용신청이 다음 각 호에 해당하는 경우에는 승낙하지 않거나 승낙을 유보할 수 있습니다.<br>
                                1. 실명이 아니거나 타인의 명의를 이용한 경우<br>
                                2. 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우<br>
                                3. 미성년자가 ‘청소년보호법’ 등 관련 법령에 의해서 이용이 금지되는 유료서비스를 이용하고자 하는 경우<br>
                                4. 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우<br>
                                ③ 이용계약의 성립시기는 ‘가입완료’ 또는 ‘구매완료’를 신청절차 상에서 표시한 시점으로 합니다.<br>
                                ④ 회원이 유료서비스를 이용하기 위해서는 이 약관에 동의 후 각 서비스에 따른 이용조건에 따라 이용요금을 지급하여야 합니다.<br>
                                
                                제7조 (유료서비스의 중단 및 변경)<br>
                                ① 회사는 사업 종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 네이버 유료서비스를 제공할 수 없게 되는 경우에는 회사는 이 약관에서 정한 방법으로 회원에게 통지하고 당초 회사에서 제시한 조건 또는
                                ‘콘텐츠이용자보호지침’ 및 관련 법령 규정에서 정한 바에 따라 회원에게 보상합니다.<br>
                                ② 회사는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부의 네이버 유료서비스를 변경할 수 있고, 변경 전 해당 서비스 초기 화면에 관련 사항을 게시합니다. 다만, 변경된
                                내용이 중대하거나 회원에게 불리한 경우에는 이 약관에서 정한 방법으로 통지하고, 중대하거나 회원에게 불리한 변경 내용에 동의하지 않는 회원은 제8조에서 정한 바에 따라 네이버 유료서비스 이용계약을 해지할 수
                                있습니다.<br>
                                
                                제8조 (회원의 청약철회 및 계약해지)<br>
                                ① 회사와 네이버 유료서비스 이용계약을 체결한 회원은 관련 법령에서 정한 바에 따라 일정기간 내에 청약을 철회할 수 있습니다. 단, 네이버 유료서비스에는 ‘콘텐츠산업진흥법’, ‘전자상거래등에서의소비자보호에관한법률’
                                등에서 규정하는 청약철회가 불가능한 서비스가 포함되어 있습니다. 이 경우 회사는 청약철회권 제한을 위해 관련 법령상 필요한 조치를 취합니다.<br>
                                ② 회원은 다음 각 호의 사유가 있을 때 네이버 유료서비스 이용계약을 해지 또는 해제할 수 있습니다.<br>
                                1. 네이버 유료서비스의 하자를 회사가 보완, 수정할 수 없는 경우 네이버 유료서비스를 공급받은 날로부터 1개월 이내<br>
                                2. 네이버 유료서비스 회원이 이 약관의 개정 또는 제7조 제2항 단서에 따른 서비스 변경에 동의하지 않아 회원탈퇴 또는 네이버 유료 서비스 이용계약을 해지하는 경우<br>
                                ③ 회원이 전항에 따라 네이버 유료서비스 이용계약을 해지 또는 해제하는 경우 회사는 회원으로부터 지급받은 대금을 당초 회사에서 정한 조건 또는 ‘콘텐츠이용자보호지침’ 및 관련 법령 규정, 이 약관에서 정한 바에 따라
                                회원에게 환불합니다.<br>
                                ④ 회사, 네이버 유료서비스의 대금을 지급 받은 자 또는 회원과 네이버 유료서비스 이용계약을 체결한 자가 동일인이 아닌 경우에 각자는 청약철회 등과 관련한 의무의 이행에 있어서 연대하여 책임을 집니다.<br>
                                
                                제9조 (회사의 계약해제, 해지 및 이용제한)<br>
                                ① 회사는 회원이 네이버 이용약관에서 정한 금지행위를 하였을 경우 해당 조항에 따라 사전통지 없이 계약을 해제, 해지하거나 또는 기간을 정하여 서비스이용을 제한할 수 있습니다.<br>
                                ② 제1항의 사유로 환불이 필요할 경우 회사는 회원이 유료서비스 이용으로부터 얻은 이익 및 환불수수료(10% 또는 1,000원 중 큰 금액)에 해당하는 금액을 공제하고 다음 각호에 따라 환불합니다.<br>
                                1. 회사는 회원에게 계약해제, 해지의 의사표시에 대하여 회신한 날로부터 3영업일 이내에 대금의 결제와 동일한 방법으로 이를 환불하여야 하고 동일한 방법으로 환불이 불가능할 때에는 이를 사전에 고지하여야 합니다.
                                다만, 수납확인이 필요한 결제수단의 경우에는 수납확인일로부터 3영업일 이내에 이를 환불하도록 합니다.<br>
                                2. 회사는 위 대금을 환불함에 있어서 회원이 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록
                                요청합니다. 다만, 제2항 각 호외의 본문 및 제2항 제1호 단서의 경우에는 그러하지 아니할 수 있습니다.<br>
                                ③ 제1항의 해제, 해지는 회사가 정한 통지방법에 따라 회원에게 그 의사를 표시한 때에 효력이 발생합니다.<br>
                                ④ 회사의 해제, 해지 및 이용제한에 대하여 회원은 회사가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 회사가 인정하는 경우, 회사는 즉시 서비스의 이용을 재개합니다.<br>
                                
                                제10조 (사용기간 등)<br>
                                네이버 유료서비스의 사용기간은 사전에 별도로 표시되지 않는 한 구매일로부터 1년입니다. 해당 기간이 경과한 네이버 유료서비스는 이용권이 소멸되며 보유목록에서 삭제됩니다.<br>
                                
                                제11조 (유료서비스 하자 등에 의한 회원피해보상)<br>
                                회사는 유료서비스의 하자 등에 의한 회원의 피해보상 기준, 범위, 방법 및 절차에 관한 사항을 ‘콘텐츠이용자보호지침’에 따라 처리합니다.<br>
                                
                                제12조 (책임 제한)<br>
                                ① 회사는 관계법령의 변경, 천재지변 또는 이에 준하는 불가항력으로 인하여 유료서비스를 제공할 수 없는 경우에는 유료서비스 제공에 관한 책임이 면제됩니다.<br>
                                ② 회사는 회원의 귀책사유로 인한 유료서비스 이용의 장애에 대하여는 회사의 귀책사유가 없는 한 책임을 지지 않습니다.<br>
                                ③ 회사는 회원 상호간 또는 회원과 제3자간에 유료서비스를 매개로 하여 발생한 분쟁 등에 대하여 회사의 귀책사유가 없는 한 책임을 지지 않습니다.<br>
                                
                                [부칙]<br>
                                1. 이 약관은 2019년 11월 1일부터 적용됩니다.<br>
                                2. 2019년 7월 31일부터 시행되던 종전의 ‘네이버페이 이용약관’은 네이버페이(Naver Pay) 서비스 사업부문의 물적분할에 따라 본 약관으로 대체합니다.<br>
                                3. 종전의 ‘네이버페이 이용약관’에 동의한 회원의 경우, 해당 약관 제1장(네이버페이 서비스) 및 제3장(네이버페이 안전결제)에 따른 효력은 그대로 유지되며, 11월 1일자로 개정되는 ‘네이버 유료서비스
                                이용약관’, ‘네이버페이 이용약관’(11월 1일자로 분사되는 네이버파이낸셜㈜가 제공)에 대한 별도의 동의는 필요하지 않습니다.<br>
                                </p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" id="cancel"><span>Cancle</span></button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="submit"><span>Confirm</span></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Modal-->
	    </section>
   	</div>
</div>
<br><br><br><br>
<%@ include file="../include/footer.jsp" %>
</body>
<script>
//전자 결제 api
/* var IMP = window.IMP; // 생략 가능
IMP.init("imp42776330");

function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: ${order_number},
        name: "주문 진행",
        amount: document.getElementById("fnPrice").value,
        buyer_email: "${member.m_id}",
        buyer_name: document.getElementById("name").value,
        buyer_tel: document.getElementById("phone").value,
        buyer_addr: document.getElementById("address").value + ", " + document.getElementById("address_detail").value,
        buyer_postcode: document.getElementById("zipcode")
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직
            document.getElementById("orderConfirm").submit();
        } else {
            // 결제 실패 시 로직
            alert("payment Refuse");
        }
    });
} */

//우편번호 검색 api
function daumZipCode() {
	new daum.Postcode({
     oncomplete: function(data) {
     	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

			// 각 주소의 노출규칙에 따라서 주소를 조합한다.
			// 내려오는 변수가 값이 없을 경우에는 공백('') 값을 가지므로, 이를 참고해서 분기한다.
			var fullAddress	= '';	// 최종   주소 변수
			var subAddress	= '';	// 조합형 주소 변수
			
			// 사용자가 선택한 주소의 타입에 따라서 해당 주소값을 가져온다.
			if(data.userSelectedType == 'R') {	// 도로명 주소를 선택한 경우
				fullAddress = data.roadAddress;
			} else {	// 지번 주소를 선택한 경우
				fullAddress	= data.jibunAddress;
			}
			
			// 사용자가 선택한 주소가 도로명 타입일 떄는 주소를 조합한다.
			if(data.userSelectedType == 'R') {
				// 법정동명이 있을 경우 추가한다.
				if(data.bname != '') {
					subAddress += data.bname;
				}
				// 건물명이 있을 경우에 추가한다.
				if(data.buildingName != '') {
					subAddress += (subAddress != '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddress += (subAddress != '' ? '(' + subAddress + ')' : '');
			} // End - if(data.userSelectedType == 'R')
				
			// 추출한 우편번호와 주소정보를 입력항목에 나타낸다.
			document.getElementById('zipcode').value	= data.zonecode;
			document.getElementById('address').value	= fullAddress;
			
			// 커서를 상세주소 입력란으로 이동시킨다.
			document.getElementById('address_detail').focus();
     }
 }).open({
 	// 우편번호 팝업 창이 여러개 뜨는 것을 방지하기 위해서 popupName을 사용한다.
 	popupName: "postcodePopup"
 });
}

$(document).ready(function() {
	let submit = $("#submit");
	let cancel = $("#cancel");
	let info = $("#info");

	let total = $("#totalPrice").val();
	let delivery = $("#deliveryFee").val();
//----------------------------------------------------------------------------------------------------------------
	// 배송비 포함 최종 가격
	$("#finalPrice").prop("value", parseInt(total) + parseInt(delivery));
	$("#fnPrice").prop("value", parseInt(total) + parseInt(delivery));
//----------------------------------------------------------------------------------------------------------------
	// 구매 서약 동의 한 경우
    submit.on("click", function() {
        info.prop("checked", true);
        info.prop("value", true);
    	$("#pay").prop("disabled", false);
        // alert(info.is(":checked"));
    });
	// 구매 서약 동의 하지 않은 경우
    cancel.on("click", function() {
        info.prop("checked", false);
        info.prop("value", false);
   		$("#pay").prop("disabled", true);
        // alert(info.is(":checked"));
    });
//-----------------------------------------------------------------------------------------------------------------
	// $("#pay").click(requestPay());
});

</script>

</body>
</html>