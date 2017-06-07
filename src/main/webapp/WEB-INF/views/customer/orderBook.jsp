<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
    <title>StarBooks</title>
    <link href="${resources}/css/bootstrap.min.css?ver=1" rel="stylesheet">
    <link href="${resources}/css/font-awesome.min.css?ver=1" rel="stylesheet">
    <link href="${resources}/css/prettyPhoto.css" rel="stylesheet">
    <link href="${resources}/css/price-range.css" rel="stylesheet">
    <link href="${resources}/css/animate.css" rel="stylesheet">
	<link href="${resources}/css/main.css?ver=1" rel="stylesheet">
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
    
</head><!--/head-->

<body>
	<!-- header -->
	<jsp:include page="customerHeader.jsp"/>
	<!-- header -->
	
	<section id="advertisement">
		<div class="container">
			<img src="${resources}/images/shop/advertisement.jpg" alt="" />
		</div>
	</section>
	
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
							<h2> 분류별 검색</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="orderBookCategory.do?category=000"> <span class="pull-right">(000)</span>총류</a></li>
									<li><a href="orderBookCategory.do?category=100"> <span class="pull-right">(100)</span>철학</a></li>
									<li><a href="orderBookCategory.do?category=200"> <span class="pull-right">(200)</span>종교</a></li>
									<li><a href="orderBookCategory.do?category=300"> <span class="pull-right">(300)</span>사회과학</a></li>
									<li><a href="orderBookCategory.do?category=400"> <span class="pull-right">(400)</span>순수과학</a></li>
									<li><a href="orderBookCategory.do?category=500"> <span class="pull-right">(500)</span>기술과학</a></li>
									<li><a href="orderBookCategory.do?category=600"> <span class="pull-right">(600)</span>예술</a></li>
									<li><a href="orderBookCategory.do?category=700"> <span class="pull-right">(700)</span>언어</a></li>
									<li><a href="orderBookCategory.do?category=800"> <span class="pull-right">(800)</span>문학</a></li>
									<li><a href="orderBookCategory.do?category=900"> <span class="pull-right">(900)</span>역사</a></li>
								</ul>
							</div>
						</div><!--/brands_products-->
					</div>
				</div>
				
				<c:set var="bookType" value="${booktype}"/>
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">${booktype}</h2>
						
						<form action="searchBook.do" method="post" style="float:right;margin-right:17px;">
							<input type="text" name="title" placeholder="책 제목 입력">
							<input type="hidden" name="type" value="${booktype}">
							<input type="submit" value="검색">
						</form><br><br><br>
						
						<c:forEach var="book" items="${ list }" begin="${ start }" end="${ end }">
							<div class="col-sm-4">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<a href="orderBookDetail.do?isbn=${book.isbn}"><img src="${resources}/images/book/book.jpg" alt="" /></a>
											  <c:choose>
									           <c:when test="${fn:length(book.title) >= 16}">
									            <p style="font-size:1.2em;">${fn:substring(book.title,0,16)}...</p>
									           </c:when>
									           <c:otherwise>
									            <p style="font-size:1.2em;">${book.title}</p>
									           </c:otherwise> 
									          </c:choose>
											<p style="color:skyblue">${book.price}원</p>
									        <form action="cartInsert.do" method="post" name="cartForm">
												<input type="hidden" name="isbn" value="${book.isbn}">
												<input type="hidden" name="title" value="${book.title}">
												<input type="hidden" name="price" value="${book.price}">
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
						<ul class="pagination">
							<c:if test="${beginB eq 'no'}">
							    <li><a href="http://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${pageContext.request.contextPath}${uri}?type=${type}&category=${category}&currentPage=${currentBlock*5-5}&currentBlock=${currentBlock-1}">◀</a></li>
							</c:if>
							<c:forEach var="i" begin="${begin}" end="${suend}">
								<li><a href="http://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${pageContext.request.contextPath}${uri}?type=${type}&category=${category}&currentPage=${i}&currentBlock=${currentBlock}">${i}</a></li>
							</c:forEach>
							<c:if test="${suendB eq 'no'}">
							    <li><a href="http://${ pageContext.request.serverName}:${ pageContext.request.serverPort}${pageContext.request.contextPath}${uri}?type=${type}&category=${category}&currentPage=${currentBlock*5+1}&currentBlock=${currentBlock+1}">▶</a></li>
							</c:if>
							<!-- <li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li> -->
						</ul>
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
	
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