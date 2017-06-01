<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회 원 관 리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="admin/adminMain.jsp"/>
<!-- header -->
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">회원관리</a></li>
    <li><a data-toggle="tab" href="#menu1">총 계정수</a></li>
  </ul>
  
  <div class="tab-content" style="margin-left:5%;">
    <div id="home" class="tab-pane fade in active">
      <h3>회원관리</h3>
		<table class="table table-condensed">
			<tr>
				<th>이름</th><th>아이디</th>
				<th>등급</th><th>이메일</th>
				<th>연락처</th><th>주소</th>
			</tr>
    	  	<c:forEach var="customer" items="${ customerList }" varStatus="status">
				<tr>
					<td>${ customer.name }</td>
					<td>${ customer.id }</td>
					<td>${ customer.customerclass }</td>
					<td>${ customer.email }</td>
					<td>${ customer.phone }</td>
					<td>${ customer.address1 } - ${ customer.address2 }</td>
				</tr>
			</c:forEach>
			</table>
		<hr>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>총 계정수</h3>
      	총 계정 수 : ${ count }
    </div>
  </div>
</div>
</body>
</html>