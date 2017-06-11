<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
    <title>StarBooks</title>
    <link href="${resources}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${resources}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${resources}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${resources}/css/price-range.css" rel="stylesheet">
    <link href="${resources}/css/animate.css" rel="stylesheet">
	<link href="${resources}/css/main.css" rel="stylesheet">
	<link href="${resources}/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="${resources}/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resources}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${resources}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resources}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${resources}/images/ico/apple-touch-icon-57-precomposed.png">
  	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head><!--/head-->

<body>
	<!-- header -->
	<jsp:include page="customerHeader.jsp"/>
	<!-- header -->
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="category-tab shop-details-tab"><!--category-tab-->
					<div class="login-form">
						<c:forEach var="row" items="${map.elist}" varStatus="status">
							<form id="deliveryCart${ status.index }" name="deliveryCart${ status.index }" action="/book/pay/saleInsert.do">
							    <input type="hidden" value="${ row.title }" name="title">
							    <input type="hidden" value="${ row.price }" name="dPrice">
							    <input type="hidden" value="${ row.isbn }" name="isbn">
							    <input type="hidden" value="${ sessionScope.id }" name="id">
							    <input type="hidden" value="online" name="branchName">
							    <input type="hidden" value="${ row.amount }" name="quantity">
							    <input type="hidden" value="${ row.cartno }" name="cartno">
							    <c:set value="${ status.index }" var="length"/>
				            </form>
				        </c:forEach>
			            <input type="hidden" value="${ length + 1 }" id="lengthOfList">
						<div>
					        <form id="ebookPay" name="ebookPay" method="post" action="">
						             주문자<input type="text" id="name" name="name" placeholder="주문자">
						         <label> Ebook은 구매 즉시 마이페이지-보유Ebook에서 이용 가능합니다. </label>
						         <input type="hidden" name="id" value="${ sessionScope.id }">
						         <button type="button" id="btnDirectPay" class="btn btn-default add-to-cart" 
					        		     onclick="EbookPay('test')" style="float:right">결제하기</button>
					        </form>
					    </div>
					</div>
				</div>
			</div>
		</div><!--/category-tab-->
	</section><!--/form-->
	
	<!-- footer -->
	<jsp:include page="customerFooter.jsp" />
	<!-- footer -->
	
    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js" ></script>
    <script>
    function EbookPay(name) {
    	var sum = <c:out value="${ map.sum }" />;
    	var cartCount = $("#lengthOfList").val();
    	
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
    	    	jQuery.ajax({
    	    		url: "/book/pay/ebookPayment.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    	    		type: 'POST',
    	    		dataType: 'json',
    	    		data: {
    		    		imp_uid : rsp.imp_uid
    		    		//기타 필요한 데이터가 있으면 추가 전달
    	    		},
    	    		success : function(data) {
    	    			var rsp = data.rsp;
    	    			rsp=JSON.stringify(rsp);
    	            	var newVal = JSON.parse(rsp);
    	    			var everythings_fine = data.everythings_fine;
    	    			
    	    			if ( everythings_fine ) {
    		    			var msg = '결제가 완료되었습니다.';
    		    			
    		    			
    		    			sendCart();
    		    			
    		    			/* 결제완료 이후 이동하는 창은 추후 수정 요망 */
    		    			window.location.href="../book/starBooks.do?cmd=main";
    		    		} else {
    		    			alert("아직 제대로 결제가 되지 않았습니다.");
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
    	
    }
    </script>
</body>
</html>
