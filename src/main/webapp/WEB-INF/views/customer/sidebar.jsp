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
    <link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel="stylesheet"/>
    
</head><!--/head-->
<body>
	<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#국내">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											국내
										</a>
									</h4>
								</div>
								<div id="국내" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="orderBook.do?type=국내도서&category=000">총류 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=100">철학 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=200">종교 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=300">사회과학 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=400">순수과학 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=500">기술과학 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=600">예술 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=700">언어 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=800">문학 </a></li>
											<li><a href="orderBook.do?type=국내도서&category=900">역사 </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#외국">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											외국
										</a>
									</h4>
								</div>
								<div id="외국" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="orderBook.do?type=외국도서&category=000">총류 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=100">철학 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=200">종교 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=300">사회과학 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=400">순수과학 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=500">기술과학 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=600">예술 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=700">언어 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=800">문학 </a></li>
											<li><a href="orderBook.do?type=외국도서&category=900">역사 </a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#e-book">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											E-Book
										</a>
									</h4>
								</div>
								<div id="e-book" class="panel-collapse collapse">
									<div class="panel-body">
										<ul>
											<li><a href="orderBook.do?type=E-Book&category=000">총류 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=100">철학 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=200">종교 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=300">사회과학 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=400">순수과학 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=500">기술과학 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=600">예술 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=700">언어 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=800">문학 </a></li>
											<li><a href="orderBook.do?type=E-Book&category=900">역사 </a></li>
										</ul>
									</div>
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
</body>
</html>