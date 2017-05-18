<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>지 점 정 보</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">지점정보</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
  </ul>
  
  <div class="tab-content" style="margin-left:5%;">
    <div id="home" class="tab-pane fade in active">
      <h3>지점정보</h3>
		<c:forEach var="branch" items="${ branchInfo }">
			<table class="table table-condensed">
				<tr><td>지점 명</td><td>${ branch.name }</td></tr>
				<tr><td>지점 장</td><td>${ branch.master}</td></tr>
				<tr><td>지점 번호</td><td>${ branch.phone }</td></tr>
				<tr><td>지점 주소</td><td>${ branch.address1 } - ${ branch.address2 }</td></tr>
				<tr><td>직원 수</td><td>${ branch.empCount }</td></tr>
				<tr><td>수익</td><td>${ branch.sales }</td></tr>
				<tr><td>영업 시간</td><td>${ branch.time }</td></tr>
			</table>
			<hr>
		</c:forEach>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>정보수정</h3>
		<form action="mBranchInfoUpdate.html?branch=광명" method="post">
			<table class="table table-condensed">
				<tr><td>지점장</td><td><input type="text" name="master"></td></tr>
				<tr><td>번호</td><td><input type="text" name="phone"></td></tr>
				<tr><td>주소</td><td><input type="text" name="address1"> - <input type="text" name="address2"></td></tr>
				<tr><td>운영시간</td><td><input type="text" name="time"></td></tr>
				<tr><td colspan="2"><input type="submit" value="수정"></td></tr>
			</table>
			<input type="hidden" name="name" value="광명">
		</form>
    </div>
  </div>
</div>
</body>
</html>