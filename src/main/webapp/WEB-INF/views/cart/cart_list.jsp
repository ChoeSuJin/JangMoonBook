<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!-- views/shop/cart_list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js" ></script>
<script>
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="${path}/bookList.do"
	});
	/* $("#btnPay").click(function(){
		location.href="${path}/pay/orderForm.do"
	}); */
	var IMP = window.IMP; // 생략가능
	IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	
});


function DirectPay(name) {
	alert("btnPay clicked");
	var name = $("#name").val();
	var zipcode = $("#zipcode").val();
	var phone = $("#phone").val();
	var sum = <c:out value="${ map.sum }" />;
	alert(sum);
	if(name==""){
		alert("이름을 입력하세요");
		$("#name").focus();
		return;
	} 
	if(zipcode==""){
		alert("주소를 입력하세요");
		$("#zipcode").focus();
		return;
	}
	if(phone==""){
		alert("핸드폰 번호를 입력하세요");
		$("#phone").focus();
		return;
	}
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	alert("rsp.success");
	    	jQuery.ajax({
	    		url: "/book/pay/deliverPayment.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		},
	    		success : function(data) {
	    			var rsp = data.rsp;
	    			var everythings_fine = data.everythings_fine;
	    			
	    			if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
		    			
		    			alert(msg);
		    		} else {
		    			alert("아직 제대로 결제가 되지 않았습니다.");
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
	    		}
	    	});
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        
	        alert(msg);
	    }
	});
	IMP.request_pay(param, callback);
	$("#deliveryPay").submit();
}
</script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js" ></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>장바구니 확인</h2>
	<c:choose>
		<c:when test="${map.count == 0 }">
  	장바구니가 비었습니다.
  </c:when>
		<c:otherwise>
			<form id="form1" name="form1" method="post"
				action="${path}/cart/update.do">
				<table border="1">
					<tr>
						<th>제목</th>
						<th>가격</th>
						<th>수량</th>
						<th>금액</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach var="row" items="${map.list}">
						<tr>
							<td>${row.title}</td>
							<td><fmt:formatNumber value="${row.price}" pattern="###,###" /></td>
							<td><input type="number" style="width: 30px;" min="0"
								max="100" name="amount" value="${row.amount}"> <input
								type="hidden" name="isbn" value="${row.isbn}"></td>
							<td align="right"><fmt:formatNumber value="${row.money}"
									pattern="###,###" /></td>
							<td>
								<button id="btnDelete">
									<a href="/book/cart/delete.do?isbn=${row.isbn}">삭제</a>
								</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="right">주문상품 ${map.count} 개<br />
							총상품금액 : <fmt:formatNumber value="${map.sumMoney}"
								pattern="###,###" />원 <br> 배송비 : ${map.fee} 원<br> 최종
							결제금액 : 총 <fmt:formatNumber value="${map.sum}" pattern="###,###" />원
						</td>
					</tr>
				</table>
				<button id="btnUpdate">수정</button>
			</form>
			<h5>3만원 이상 구매하면, 배송비 무료!</h5>
		</c:otherwise>
	</c:choose>
	<button type="button" id="btnList">상품목록</button>
	<div class="container">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse1">배송주문</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse">
					<div class="panel-body">
						<h2>배송정보</h2>

						<form id="deliveryPay" name="deliveryPay" method="post"
							action="/book/pay/deliveryComplete.do">
							<div>
								주문자 <input type="text" id="name" name="name" placeholder="주문자">
							</div>

							<div>
								주소 <input type="text" id="zipcode" name="zipcode"
									placeholder="우편번호"> <input type="button"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="address1" name="address1"
									placeholder="주소"> <input type="text" id="address2"
									name="address2" placeholder="상세주소"><br>
							</div>
							<div>
								핸드폰 <input type="text" name="phone" id="phone">
							</div>
							<div style="width: 300px; text-align: center">
							<input type="hidden" name="orderno" value="">
								<button type="button" id="btnDirectPay" onclick="DirectPay('test')">결제하기</button>
							</div>

						</form>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse2">바로수령</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<h3>바로수령</h3>
						<form action="" method="post">
							지점 선택<input type="text" name="branch" onclick="selectBranch();">
							<br> 시간 선택<input type="text" name="time"> <br>
							<label class="radio-inline"> <input type="radio"
								name="nowPay">지금결제
							</label> <label class="radio-inline"> <input type="radio"
								name="getPay">현장결제
							</label>

							<div style="width: 300px; text-align: center">
								<button type="button" id="btnSave">결제하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

















