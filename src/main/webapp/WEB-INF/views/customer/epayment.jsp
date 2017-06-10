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
					        <form id="deliveryPay" name="deliveryPay" method="post" action="">
						             주문자<input type="text" id="name" name="name" placeholder="주문자">
						              주소<input type="button" id="address" onclick="sample6_execDaumPostcode()" value="주소검색">
						         <input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호"> 
						         <input type="text" id="sample6_address" name="address1" placeholder="주소"> 
						         <input type="text" id="sample6_address2" name="address2" placeholder="상세주소">
						         <input type="hidden" name="id" value="${ sessionScope.id }">
								 <input type="text" name="phone" id="phone">
						         <button type="button" id="btnDirectPay" class="btn btn-default add-to-cart" 
					        		     onclick="DirectPay('test')" style="float:right">결제하기</button>
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
</body>
</html>
