<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
    <title>StarBooks Header</title>
</head><!--/head-->
<body>
	<header id="header"><!--header-->
		<div class="header-middle"><!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<p style="font-size:2.5em;color:skyblue;"><a href="starBooks.do?cmd=main">StarBooks</a></p>
						</div>
						<div class="btn-group pull-right">
						</div>
					</div>
					<div class="col-sm-8">
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
	</header><!--/header-->
</body>
</html>