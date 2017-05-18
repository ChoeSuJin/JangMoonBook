<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>지 점 정 보</title>
</head>
<body>
<h1>지점관리</h1><hr>
<c:forEach var="branch" items="${ branchInfo }" varStatus="status">
	${ branch.name }&nbsp;&nbsp;
	${ branch.master}&nbsp;&nbsp;
	${ branch.phone }&nbsp;&nbsp;
	${ branch.address1 } - ${ branch.address2 }&nbsp;&nbsp;
	${ branch.empCount }&nbsp;&nbsp;
	${ branch.sales }&nbsp;&nbsp;
	${ branch.time }<hr>
</c:forEach>

<form action="mBranchInfoUpdate.html" method="post">
	지점장 : <input type="text" name="master">
	번호 : <input type="text" name="phone">
	주소 : <input type="text" name="address1"> - <input type="text" name="address2">
	운영시간 : <input type="text" name="time">
	<input type="text" name="name" value="광명">
	<input type="submit" value="수정">
</form>
</body>
</html>