<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>직 원 관 리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">목록</a></li>
    <li><a data-toggle="tab" href="#menu1">정보수정</a></li>
    <li><a data-toggle="tab" href="#menu2">직원추가</a></li>
    <li><a data-toggle="tab" href="#menu3">직원삭제</a></li>
  </ul>
  
  <div class="tab-content" style="margin-left:5%;">
    <div id="home" class="tab-pane fade in active">
      <h3>직원목록</h3>
		<table class="table table-condensed">
			<tr>
				<th>직원번호</th><th>이름</th>
				<th>직급</th><th>주소</th>
				<th>연락처</th><th>성별</th>
				<th>생년월일</th><th>지점</th>
			</tr>
    	  	<c:forEach var="employee" items="${ employeeList }" varStatus="status">
				<tr>
					<td>${ employee.empno }</td>
					<td>${ employee.name }</td>
					<td>${ employee.empclass }</td>
					<td>${ employee.address1 } - ${ employee.address2 }</td>
					<td>${ employee.phone }</td>
					<td>${ employee.gender }</td>
					<td>${ employee.birth }</td>
					<td>${ employee.branch }</td>
				</tr>
			</c:forEach>
			</table>
		<hr>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>정보수정</h3>
      	
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>직원추가</h3>
      	
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>직원삭제</h3>
      	
    </div>
  </div>
</div>
</body>
</html>