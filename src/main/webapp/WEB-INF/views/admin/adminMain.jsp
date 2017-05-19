<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JangMoonBook AdminMain</title>
</head>
<body>
<a href="inventoryMainForm.do">재고관리</a>
<a href="salesMainForm.do">매출관리</a>
<a href="mBranchInfo.do">지점관리</a>
<a href="mCustomer.do">고객관리</a>
<a href="mEmployee.do">직원관리</a>
<br>

<sec:authentication property="name" var="username"/>
id = ${ username } <br>

<br>
<br>
<sec:authorize access="hasAnyRole('ROLE_DIAMOND', 'ROLE_PLATINUM', 'ROLE_GOLD', 'ROLE_BRONZE')">
알바부터
</sec:authorize>
<hr>
<sec:authorize access="hasAnyRole('ROLE_DIAMOND', 'ROLE_PLATINUM', 'ROLE_GOLD')">
매니저부터~
</sec:authorize>
<hr>
<sec:authorize access="hasAnyRole('ROLE_DIAMOND', 'ROLE_PLATINUM')">
지점장부터~
</sec:authorize>
<hr>
<sec:authorize access="hasAnyRole('ROLE_DIAMOND')">
사장부터
</sec:authorize>

</body>
</html>