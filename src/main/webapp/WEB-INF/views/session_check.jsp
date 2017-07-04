<%@ page language="java" contentType="text/html; charset=UTF-8"
  	  pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jstl/core_rt" %>
<c:if test="${sessionScope.id == null}">
	<script>
		alert("로그인 하신 후 사용하세요.");
		location.href="starBooks.do?cmd=login";
	</script>
</c:if>













