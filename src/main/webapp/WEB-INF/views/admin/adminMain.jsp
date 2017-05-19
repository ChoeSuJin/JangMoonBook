<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JangMoonBook AdminMain</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<br>
<%-- <sec:authentication property="name" var="username"/>
id = ${ username } <br> 

<sec:authorize access="hasAnyRole('ROLE_GOLD')">
<h3>매니저</h3><hr>
<a href="mCustomer.do">고객관리</a>
<a href="inventoryMain.do">재고관리</a>
<a href="mEmployee.do">직원관리</a>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_PLATINUM')">
<h3>지점장</h3><hr>
<a href="salesMain.do">매출관리</a>
<a href="mBranchInfo.do">지점관리</a>
<a href="mEmployee.do">직원관리</a>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_DIAMOND')">
<h3>사장</h3><hr>
<a href="salesMain.do">매출관리</a>
<a href="mBranchInfo.do">지점관리</a>
<a href="mCustomer.do">고객관리</a>
<a href="inventoryMain.do">재고관리</a>
<a href="mEmployee.do">직원관리</a>
</sec:authorize>
--%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      <sec:authorize access="hasAnyRole('ROLE_GOLD')">
        <li><a href="mCustomer.do">고객관리</a></li>
        <li><a href="inventoryMain.do">재고관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
	  </sec:authorize>
	  	<sec:authorize access="hasAnyRole('ROLE_PLATINUM')">
        <li><a href="salesMain.do">매출관리</a></li>
        <li><a href="mBranchInfo.do">지점관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
	  </sec:authorize>
      <sec:authorize access="hasAnyRole('ROLE_DIAMOND')">
        <li><a href="salesMain.do">매출관리</a></li>
        <li><a href="mBranchInfo.do">지점관리</a></li>
        <li><a href="inventoryMain.do">재고관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
	  </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>

</body>
</html>