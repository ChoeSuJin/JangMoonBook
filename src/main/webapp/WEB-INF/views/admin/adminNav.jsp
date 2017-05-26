<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 메인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="adminNav.do">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      <sec:authorize access="hasAnyRole('ROLE_GOLD')">
        <li><a href="mInventory.do">재고관리</a></li>
        <li><a href="mCustomer.do">고객관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
	  </sec:authorize>
	  	<sec:authorize access="hasAnyRole('ROLE_PLATINUM')">
        <li><a href="mBranchInfo.do">지점관리</a></li>
        <li><a href="mSales.do">매출관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
	  </sec:authorize>
      <sec:authorize access="hasAnyRole('ROLE_DIAMOND')">
        <li><a href="mBranchInfo.do">지점관리</a></li>
        <li><a href="mSales.do">매출관리</a></li>
        <li><a href="mInventory.do">재고관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
        <li><a href="mEbook.do">eBook</a></li>
	  </sec:authorize>
      </ul>
      <c:url value="/j_spring_security_logout" var="logoutUrl"/>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${ logoutUrl }">
        	<span class="glyphicon glyphicon-log-in"></span> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- 관리자 메인(공지사항) -->
	<c:if test="${main != null}">
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">본사 공지사항</a></li>
				<li><a data-toggle="tab" href="#menu1">뭐 할 까 ?</a></li>
			</ul>

			<div class="tab-content" style="margin-left: 5%;">
				<div id="home" class="tab-pane fade in active">
					<h3>본사 공지사항</h3>
						공지사항 쌸라쌸라
				</div>
				
				<div id="menu1" class="tab-pane fade">
					<h3>뭐 할 까 ?</h3>
						??????
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>