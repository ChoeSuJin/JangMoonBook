<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="en">
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
<c:set value="${pageContext.request.contextPath}" var="path" />
    <title>StarBooks</title>
    <link href="${resources}/css/bootstrap.min.css?ver=1" rel="stylesheet">
    <link href="${resources}/css/font-awesome.min.css?ver=1" rel="stylesheet">
    <link href="${resources}/css/prettyPhoto.css?ver=1" rel="stylesheet">
    <link href="${resources}/css/price-range.css?ver=1" rel="stylesheet">
    <link href="${resources}/css/animate.css?ver=1" rel="stylesheet">
	<link href="${resources}/css/main.css?ver=1" rel="stylesheet">
	<link href="${resources}/css/responsive.css?ver=1" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="${resources}/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resources}/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${resources}/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resources}/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${resources}/images/ico/apple-touch-icon-57-precomposed.png">
    <!-- font -->
    <link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
</head><!--/head-->

<body>
	<!-- header -->
	<jsp:include page="customer/customerHeader.jsp" />
	<!-- header -->
	
	<section id="slider"><!--slider-->
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div id="slider-carousel" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#slider-carousel" data-slide-to="1"></li>
							<li data-target="#slider-carousel" data-slide-to="2"></li>
							<li data-target="#slider-carousel" data-slide-to="3"></li>
							<li data-target="#slider-carousel" data-slide-to="4"></li>
							<li data-target="#slider-carousel" data-slide-to="5"></li>
						</ol>
						
						<div class="carousel-inner">
							<c:forEach var="bestSeller" items="${bestSeller}" varStatus="status" begin="0" end="5">
								<c:choose>
								<c:when test="${status.index==0}">
									<div class="item active">
										<div class="col-sm-6">
											<div class="carousel-inner-header">${bestSeller.title}</div>
											<p>제19대 대한민국 대통령 당선기념 특별판『문재인의 운명』. 이 책은 노무현 전 대통령 서거 2주기를 맞아 노 전 대통령이 생전에 ....</p>
										</div>
										<div class="col-sm-6">
											<img src="${resources}/images/book/${bestSeller.image}.jpg" class="girl img-responsive" style="height:500px;"/>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="item">
										<div class="col-sm-6">
											<div class="carousel-inner-header">${bestSeller.title}</div>
											<p>제19대 대한민국 대통령 당선기념 특별판『문재인의 운명』. 이 책은 노무현 전 대통령 서거 2주기를 맞아 노 전 대통령이 생전에 ....</p>
										</div>
										<div class="col-sm-6">
											<img src="${resources}/images/book/${bestSeller.image}.jpg" class="girl img-responsive" style="height:500px;"/>
										</div>
									</div>
								</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						
						<a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
							<i class="fa fa-angle-right"></i>
						</a>
					</div>
					
				</div>
			</div>
		</div>
	</section><!--/slider-->
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<jsp:include page="customer/sidebar.jsp"/>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Best Seller</h2>
						
						<c:forEach var="bestSeller" items="${bestSeller}" varStatus="status" begin="0" end="5">
							<div class="col-sm-4">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<a href="orderBookDetail.do?isbn=${bestSeller.isbn}">
												<img src="${resources}/images/book/${bestSeller.image}.jpg" alt="" />
											</a>
											 	<c:choose>
										     	<c:when test="${fn:length(bestSeller.title) > 14}">
										    	  <p>${fn:substring(bestSeller.title,0,13)}...</p>
										    	</c:when>
										    	<c:otherwise>
										   		  <p>${bestSeller.title}</p>
										    	</c:otherwise> 
												</c:choose>
											<!-- <a href="" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>장바구니</a> -->
											<form action="cartInsert.do" method="post" name="cartForm">
												<input type="hidden" name="isbn" value="${bestSeller.isbn}">
												<input type="hidden" name="title" value="${bestSeller.title}">
												<input type="hidden" name="price" value="${bestSeller.price}">
												<input type="hidden" name="image" value="${bestSeller.image}">
												<input type="hidden" name="type" value="${bestSeller.type}">
												<input type="hidden" name="status" value="장바구니">
												<input type="hidden" name="amount" value="1">
												<input type="hidden" id="session" name="session" value="${sessionScope.id}">
												<input type="submit" onclick="return check_cart()" class="btn add-to-cart" value="장바구니">
											</form>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div><!--features_items-->
					
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">NEW BOOK</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
							
								<!-- img 랜덤으로 가져오기 위한 것 -->
								<jsp:useBean id="random" class="java.util.Random" scope="application"/>
								<!-- img 랜덤으로 가져오기 위한 것 -->
								
								<div class="item active">
									<c:forEach var="nb" items="${newBook}" begin="0" end="2">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${resources}/images/book/${random.nextInt(147)+8}.jpg" alt="" />
													  <c:choose>
												     	<c:when test="${fn:length(nb.title) > 14}">
												    	  <p>${fn:substring(nb.title,0,13)}...</p>
												    	</c:when>
												    	<c:otherwise>
												   		  <p>${nb.title}</p>
												    	</c:otherwise> 
													  </c:choose>
													 <form action="cartInsert.do" method="post" name="cartForm">
														<input type="hidden" name="isbn" value="${nb.isbn}">
														<input type="hidden" name="title" value="${nb.title}">
														<input type="hidden" name="price" value="${nb.price}">
														<input type="hidden" name="image" value="${nb.image}">
														<input type="hidden" name="type" value="${nb.type}">
														<input type="hidden" name="status" value="장바구니">
														<input type="hidden" name="amount" value="1">
														<input type="hidden" id="session" name="session" value="${sessionScope.id}">
														<input type="submit" onclick="return check_cart()" class="btn add-to-cart" value="장바구니">
													</form>
												</div>
												
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								
								<div class="item">
									<c:forEach var="nb" items="${newBook}" begin="3" end="5">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${resources}/images/book/${random.nextInt(147)+8}.jpg" alt="" />
													  <c:choose>
												     	<c:when test="${fn:length(nb.title) > 14}">
												    	  <p>${fn:substring(nb.title,0,13)}...</p>
												    	</c:when>
												    	<c:otherwise>
												   		  <p>${nb.title}</p>
												    	</c:otherwise> 
													  </c:choose>
													 <form action="cartInsert.do" method="post" name="cartForm">
														<input type="hidden" name="isbn" value="${nb.isbn}">
														<input type="hidden" name="title" value="${nb.title}">
														<input type="hidden" name="price" value="${nb.price}">
														<input type="hidden" name="image" value="${nb.image}">
														<input type="hidden" name="type" value="${nb.type}">
														<input type="hidden" name="status" value="장바구니">
														<input type="hidden" name="amount" value="1">
														<input type="hidden" id="session" name="session" value="${sessionScope.id}">
														<input type="submit" onclick="return check_cart()" class="btn add-to-cart" value="장바구니">
													</form>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								
								<div class="item">
									<c:forEach var="nb" items="${newBook}" begin="6" end="8">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="${resources}/images/book/${random.nextInt(147)+8}.jpg" alt="" />
													  <c:choose>
												     	<c:when test="${fn:length(nb.title) > 14}">
												    	  <p>${fn:substring(nb.title,0,13)}...</p>
												    	</c:when>
												    	<c:otherwise>
												   		  <p>${nb.title}</p>
												    	</c:otherwise> 
													  </c:choose>
													 <form action="cartInsert.do" method="post" name="cartForm">
														<input type="hidden" name="isbn" value="${nb.isbn}">
														<input type="hidden" name="title" value="${nb.title}">
														<input type="hidden" name="price" value="${nb.price}">
														<input type="hidden" name="image" value="${nb.image}">
														<input type="hidden" name="type" value="${nb.type}">
														<input type="hidden" name="status" value="장바구니">
														<input type="hidden" name="amount" value="1">
														<input type="hidden" id="session" name="session" value="${sessionScope.id}">
														<input type="submit" onclick="return check_cart()" class="btn add-to-cart" value="장바구니">
													</form>
												</div>
												
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					
				</div>
			</div>
		</div>
	</section>
	
	<!-- footer -->
	<jsp:include page="customer/customerFooter.jsp" />
	<!-- footer -->
	
    <script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
	<script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/price-range.js"></script>
    <script src="${resources}/js/jquery.prettyPhoto.js"></script>
    <script src="${resources}/js/main.js"></script>
</body>
</html>