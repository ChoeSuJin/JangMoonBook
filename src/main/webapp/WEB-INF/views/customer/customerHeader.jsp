<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
    <title>StarBooks Header</title>
</head><!--/head-->
<body>
	<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
	<header id="header"><!--header-->
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="starBooks.do?cmd=main"><img class="logo" src="${resources}/images/home/starbooks_logo.png"></a>
						</div>
						<div class="btn-group pull-right">
						</div>
					</div>
					<div class="col-sm-8" style="margin-top:35px;">
						<div class="shop-menu pull-right">
						<c:choose>
							<c:when test="${sessionScope.id == null}">
								<ul class="nav navbar-nav">
									<li><a href="starBooks.do?cmd=login"><i class="fa fa-lock"></i> Login</a></li>
								</ul>
							</c:when>
							<c:when test="${sessionScope.id != null}">
								<ul class="nav navbar-nav">
									<li><a href="starBooks.do?cmd=myPage"><i class="fa fa-user"></i> 마이페이지</a></li>
									<li><a href="cartList.do"><i class="fa fa-shopping-cart"></i> 장바구니</a></li>
									<li><a href="starBooks.do?cmd=logout"><i class="fa fa-lock"></i> Logout</a></li>
								</ul>
							</c:when>
						</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-middle-->
		
		<div class="header-bottom"><!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="starBooks.do?cmd=main" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="">Products</a></li>
										<li><a href="">Product Details</a></li> 
                                    </ul>
                                </li> 
								<li><a href="404.html">404</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div><!--/header-bottom-->
		
	</header><!--/header-->
</body>
</html>