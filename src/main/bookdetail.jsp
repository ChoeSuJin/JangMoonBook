<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var ="path" value = "${pageContext.request.contextPath}"/>

</head>
<body>

<!-- 장바구니에 담기 -->
 <form name = "form1" method = "post" action="${path}/cart/cart/insert.do">
 	<input type = "hidden" name ="isbn" value = "${list.isbn}">
 	<select name = "amount">
 	<c:forEach begin ="1" end="10" var = "i">
 		<option value = "${i}">${i}</option>
 	</c:forEach>
 	</select>&nbsp;개
 <input type = "submit" value = "장바구니 담기" >
 
 </form>
</body>
</html>
