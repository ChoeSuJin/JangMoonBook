<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회 원 관 리</title>
</head>
<body>
<h1>회원관리</h1><p>총 계정 수 : ${ count }</p><hr>
<c:forEach var="customer" items="${ customerList }" varStatus="status">
	${ customer.name }&nbsp;&nbsp;
	${ customer.id }&nbsp;&nbsp;
	${ customer.customerclass }&nbsp;&nbsp;
	${ customer.email }&nbsp;&nbsp;
	${ customer.phone }&nbsp;&nbsp;
	${ customer.address1 } - ${ customer.address2 }<hr>
</c:forEach>
</body>
</html>