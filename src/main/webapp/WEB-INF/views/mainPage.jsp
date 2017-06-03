<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
						</ol>
						
						<div class="carousel-inner">
							<div class="item active">
								<div class="col-sm-6">
									<div class="carousel-inner-header">문재인의 운명</div>
									<p>제19대 대한민국 대통령 당선기념 특별판『문재인의 운명』. 이 책은 노무현 전 대통령 서거 2주기를 맞아 노 전 대통령이 생전에 ....</p>
								</div>
								<div class="col-sm-6">
									<img src="${resources}/images/book/문재인.jpg" class="girl img-responsive" style="height:500px;"/>
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<div class="carousel-inner-header">호모 데우스</div>
									<p>제19대 대한민국 대통령 당선기념 특별판『문재인의 운명』. 이 책은 노무현 전 대통령 서거 2주기를 맞아 노 전 대통령이 생전에 ....</p>
								</div>
								<div class="col-sm-6">
									<img src="${resources}/images/book/호모데우스.jpg" class="girl img-responsive" style="height:500px;"/>
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<div class="carousel-inner-header">언어의 온도</div>
									<p>제19대 대한민국 대통령 당선기념 특별판『문재인의 운명』. 이 책은 노무현 전 대통령 서거 2주기를 맞아 노 전 대통령이 생전에 ....</p>
								</div>
								<div class="col-sm-6">
									<img src="${resources}/images/book/언어의온도.jpg" class="girl img-responsive" style="height:500px;"/>
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<div class="carousel-inner-header">82년생 김지영</div>
									<p>제19대 대한민국 대통령 당선기념 특별판『문재인의 운명』. 이 책은 노무현 전 대통령 서거 2주기를 맞아 노 전 대통령이 생전에 ....</p>
								</div>
								<div class="col-sm-6">
									<img src="${resources}/images/book/82년생김지영.jpg" class="girl img-responsive" style="height:500px;"/>
								</div>
							</div>
							<div class="item">
								<div class="col-sm-6">
									<div class="carousel-inner-header">보노보노처럼 살다니 다행이야</div>
									<p>제19대 대한민국 대통령 당선기념 특별판『문재인의 운명』. 이 책은 노무현 전 대통령 서거 2주기를 맞아 노 전 대통령이 생전에 ....</p>
								</div>
								<div class="col-sm-6">
									<img src="${resources}/images/book/보노보노.jpg" class="girl img-responsive" style="height:500px;"/>
								</div>
							</div>
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
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<a href="orderBook.do?type=국내도서">국내도서</a>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<a href="orderBook.do?type=외국도서">외국도서</a>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<a href="orderBook.do?type=E-Book">E-Book</a>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<a href="orderBook.do?type=중고도서">중고도서</a>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<a href="#">etc</a>
								</div>
							</div>
						</div><!--/category-products-->
					
						<div class="brands_products"><!--brands_products-->
							<h2> 뭘하지?</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#"> <span class="pull-right">(50)</span>???</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>???</a></li>
									<li><a href="#"> <span class="pull-right">(27)</span>???</a></li>
								</ul>
							</div>
						</div><!--/brands_products-->
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Best Seller</h2>
						
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="${resources}/images/book/문재인.jpg" alt="" />
										 <%--  <c:choose>
									     	<c:when test="${fn:length(book.title) > 14}">
									    	  <p>${fn:substring(book.title,0,13)}...</p>
									    	</c:when>
									    	<c:otherwise>
									   		  <p>${book.title}</p>
									    	</c:otherwise> 
										</c:choose> --%>
										<p>문재인의 운명</p>
										<a href="" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>장바구니</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="${resources}/images/book/호모데우스.jpg" alt="" />
										<p>호모 데우스</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>장바구니</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="${resources}/images/book/언어의온도.jpg" alt="" />
										<p>언어의 온도</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>장바구니</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="${resources}/images/book/82년생김지영.jpg" alt="" />
										<p>82년생 김지영</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>장바구니</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img src="${resources}/images/book/보노보노.jpg" alt="" />
										<p>보노보노처럼 살다니 다행이야</p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>장바구니</a>
									</div>
								</div>
							</div>
						</div>
						
					</div><!--features_items-->
					
					<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>
						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								<div class="item">	
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend1.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend2.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$56</h2>
													<p>Easy Polo Black Edition</p>
													<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
												</div>
												
											</div>
										</div>
									</div>
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