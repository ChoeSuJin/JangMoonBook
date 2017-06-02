<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:set var = "path" value = "${pageContext.request.contextPath }"/>


<title>Insert title here</title>
</head>
<body>

	<h2>회원목록</h2>

	<table style="border: 1; width: 900px;">
		<tr>
		 	<th>ID </th>
		 	<th>Password </th>
		 	<th>회원등급 </th>
		 	<th>우편번호 </th>
		 	<th>주소 </th>
		 	<th>상세주소 </th>
		 	<th>이메일</th>
		 	<th>전화번호</th>
		 </tr>
	 
	 	<c:forEach var= "list" items = "${list}">
	 		<tr>
		 		<th>${list.id} 님 <a href ="${path}/customer/view.do?id=${list.id}">마이페이지</a></th>
			 	<th>${list.pwd}</th>
			 	<th>${list.customerClass}</th>
			 	<th>${list.address1}</th>
			 	<th>${list.address2}</th>
			 	<th>${list.zipcode}</th>
			 	<th>${list.email}</th>
			 	<th>${list.phone}</th>			 	
	 		 </tr>
	 	</c:forEach>		 
	
	</table>
	<br/><br/>
	<input type = "button" value = "회원가입" onclick = "location.href= '${path}/customer/write.do'">
</body>
</html>
