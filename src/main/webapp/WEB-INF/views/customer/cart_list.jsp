<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!-- views/shop/cart_list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>StarBooks</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
</head>
<body>
	<!-- header -->
	<jsp:include page="customerHeader.jsp"/>
	<!-- header -->
	
	<!-- img 랜덤으로 가져오기 위한 것 -->
	<jsp:useBean id="random" class="java.util.Random" scope="application"/>
	<!-- img 랜덤으로 가져오기 위한 것 -->
	
	<section id="cart_items">
		<div class="container">
				<c:choose>
					<c:when test="${map.count==0 and map.ecount==0}">
				  		장바구니가 비었습니다.
				 	</c:when>
				 	<c:otherwise>
				 	<c:if test="${map.count!=0}">
				 		<div class="table-responsive cart_info" style="border:0">
				 		  <p style="font-size:1.8em;text-align:center;">일반도서</p>
				            <table class="table table-condensed">
				              <thead>
				               <tr class="cart_menu">
				                  <td class="image">상품</td>
				                  <td class="description"></td>
				                  <td class="price">가격</td>
				                  <td class="quantity">수량</td>
				                  <td class="total">총가격</td>
				                  <td>삭제</td>
				                  <td></td>
				               </tr>
				               </thead>
				               
				               <c:forEach var="cart" items="${map.list}">
					 			<form id="form1" name="form1" method="post">
				                   <tbody>
									 <tr style="hegiht:80px;">
									 	<td class="cart_product">
											<img src="${resources}/images/book/${random.nextInt(147)+8}.jpg" alt="" style="width:70px;height:95px;">
										</td>
										<td class="cart_description">
											<h4 style="margin-left:15px;">${cart.title}</h4>
										</td>
										<td class="cart_price">
											<p><fmt:formatNumber value="${cart.price}" pattern="###,###" /></p>
										</td>
				                    	<td class="cart_quantity">
											<p>${cart.amount}</p>
										</td>
					                    <td class="cart_total">
											<p class="cart_total_price">
												<fmt:formatNumber value="${cart.price*cart.amount}" pattern="###,###" />
											</p>
										</td>
				                        <td class="cart_delete">
											<a class="cart_quantity_delete" href="cartDelete.do?isbn=${cart.isbn}"><i class="fa fa-times"></i></a>
										</td>
				                     </tr>
					               	</tbody>
									<input type="hidden" name="isbn" value="${cart.isbn}">
					                <input type="hidden" name="cartno" value="${ cart.cartno }">
					                <input type="hidden" name="amount" value="${ cart.amount }">
							       </form>
				               </c:forEach>
				           </table>
				        </div>
				        <div class="cart_total_payment">
				          	<a href="cartList.do?cmd=payment">주문하기</a>
				        </div>
				          <div class="cart_total">
							<p  style="font-size:1.3em;"> 
								주문상품 ${map.count} 개<br/>
							      총상품금액 : <fmt:formatNumber value="${map.sumMoney}" pattern="###,###" />원 <br> 배송비 : ${map.fee} 원<br> 최종
							      결제금액 : 총 <fmt:formatNumber value="${map.sum}" pattern="###,###" />원
							</p>
						</div>
					    <br>
				     </c:if>
				     
					 <c:if test="${map.ecount!=0}">
				 		<div class="table-responsive cart_info" style="border:0;">
				 		  <p style="font-size:1.8em;text-align:center;">E-Book</p>
				            <table class="table table-condensed">
				              <thead>
				               <tr class="cart_menu">
				                  <td class="image">상품</td>
				                  <td class="description"></td>
				                  <td class="price">가격</td>
				                  <td>삭제</td>
				                  <td></td>
				               </tr>
				               </thead>
				               
				               <c:forEach var="ecart" items="${map.elist}">
					 			<form id="form1" name="form1" method="post">
				                   <tbody>
									 <tr style="hegiht:80px;">
									 	<td class="cart_product">
											<img src="${resources}/images/book/${random.nextInt(147)+8}.jpg" alt="" style="width:70px;height:95px;">
										</td>
										<td class="cart_description">
											<h4 style="margin-left:15px;">${ecart.title}</h4>
										</td>
										<td class="cart_price">
											<p><fmt:formatNumber value="${ecart.price}" pattern="###,###" /></p>
										</td>
				                        <td class="cart_delete">
											<a class="cart_quantity_delete" href="cartDelete.do?isbn=${ecart.isbn}"><i class="fa fa-times"></i></a>
										</td>
				                     </tr>
					               	</tbody>
									<input type="hidden" name="isbn" value="${ecart.isbn}">
					                <input type="hidden" name="cartno" value="${ecart.cartno }">
					                <input type="hidden" name="amount" value="${ecart.amount }">
							       </form>
				               </c:forEach>
				            </table>
				          </div>
				          <div class="cart_total_payment">
				          	<a href="cartList.do?cmd=epayment">주문하기</a>
				          </div>
				          <div class="cart_total">
							<p style="font-size:1.3em;"> 
								주문상품 ${map.ecount} 개<br/>
							      총상품금액 : <fmt:formatNumber value="${map.esumMoney}" pattern="###,###" />원<br>
							      최종 결제금액 : 총 <fmt:formatNumber value="${map.esumMoney}" pattern="###,###" />원
							 </p>
						  </div>
					  </c:if>
				   </c:otherwise>
				</c:choose>
			</div>
	</section> <!--/#cart_items-->
	
	<!-- footer -->
	<jsp:include page="customerFooter.jsp" />
	<!-- footer -->

	<script type="text/javascript">
	$(document).ready(function(){
		var error="<c:out value='${sessionScope.error}'/>";
		if(error!=""){
			alert('이미 장바구니에 있는 상품입니다.');
			sessionStorage.removeItem('error');
		}
	});
	</script>
	<script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
	<script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
</body>
</html>

