<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix = "c" uri="http://java.sun.com/jstl/core_rt" %>
	<%@ taglib prefix = "fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var = "path" value = "${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-3.1.1.min.js">
</script>
</head>
<body>
<h1> 주문확인 </h1>

<h3> 상품확인 </h3>

<h3> 배송주소 </h3>
 <form id = "form1" name ="form1" method = "post">

	<div> 이름
		${list.name}
	</div>
	<div>
		주문일  
		<fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	</div>
	<div>
		주소 <br>
		우편번호 ${list.zipcode}	<br>
		${list.address1}&nbsp;${list.address2}
	</div>
	<div> 전화번호 ${list.phone}
	</div>		
</form>

</body>
</html>