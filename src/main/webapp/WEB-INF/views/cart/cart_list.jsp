<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix = "c" uri="http://java.sun.com/jstl/core_rt" %>
     <%@ taglib prefix = "fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
    <!-- views/shop/cart_list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="http://code.jquery.com/jquery-3.1.1.min.js">
</script>
<script>
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="${path}/bookList.do"
	});

	
});
</script>
</head>
<body>
<h2>장바구니 확인</h2>
<c:choose>
  <c:when test="${map.count == 0 }">
  	장바구니가 비었습니다.
  </c:when>
  <c:otherwise>
  <form id="form1" name="form1" method="post" action="${path}/cart/update.do"> 
    <table border="1">
      <tr>
        <th>제목</th>
        <th>가격</th>
        <th>수량</th>
        <th>금액</th>
        <th>&nbsp;</th>
      </tr>
<c:forEach var="row" items="${map.list}"  >
	  <tr>
	    <td>${row.title}</td>
	    <td><fmt:formatNumber value="${row.price}" pattern="###,###" /></td>
	    <td>
	    <input type="number" style="width:30px;" min="0" max="100" name="amount" value="${row.amount}">
		<input type="hidden" name="isbn" value="${row.isbn}">
		</td>
	    <td align="right">
	    <fmt:formatNumber value="${row.money}" pattern="###,###"/></td>
	    
 	<td>
		   
 			<button id="btnDelete"><a href="/book/cart/delete.do?isbn=${row.isbn}">삭제</a></button>
 		
 			
 	</td> 
	  </tr>
</c:forEach>      
 <tr>
	    <td colspan="5" align="right">
	    	주문상품 ${map.count} 개<br/>
	    	총 상품금액 : <fmt:formatNumber value="${map.sumMoney}" pattern="###,###"/>원 <br>
	    	배송비 : ${map.fee} 원<br>
	    	최종 결제금액 : 총 <fmt:formatNumber value="${map.sum}" pattern="###,###"/>원   	
	    </td>
	  </tr> 
    </table>
	 <button id="btnUpdate">수정</button>
  </form>
  <h5>3만원 이상 구매하면, 배송비 무료!</h5>
  </c:otherwise>
</c:choose>
	<button type="button" id="btnList">상품목록</button>
	
</body>
</html>

















