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
<script type="text/javascript">
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="${path}/board/list.do"
	});
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.do"
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/board/delete.do";
		document.form1.submit();
		}
	});
	$("#btnUpdate").click(function(){
		
		var content=document.form1.content.value;
		var title=document.form1.title.value;
		
		if(content==""){
			alert("내용을 입력하세요");
			document.form1.content.focus();
			return;
		}
		if(title==""){
			alert("제목을 입력하세요");
			document.form1.title.focus();
			return;
		}		
		document.form1.action="${path}/board/update.do"
		document.form1.submit();
	});
	
});
</script>

</head>
<body>
<h2>게시물 보기</h2>
<div style="width:500px; text-align:center">
<button type = "button" id="btnList">목록으로</button>
<c:if test="${sessionScope.id != null}">	
	<button type="button" id="btnWrite">글쓰기</button>
</c:if>
	
</div>
<form id = "form1" name ="form1" method = "post">

	<div> 제목
		<input name ="title" id = "title" value = "${dto.title}" size = "50">
	</div>
	<div>
		작성일자 : <fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	</div>
	<div>
		조회수 : ${dto.viewcnt}
	</div>
	<div> 작성자
		${dto.writer}
	</div>
	<div> 내용
		<textarea name = "content" rows="10" cols="50">${dto.content}</textarea>	
	</div>
	<div style="width:300px; text-align:center">
		<!-- 게시물 번호가 있어야 수정, 삭제 가능(hidden으로 처리) -->
		<input type = "hidden" name = "bno" value= "${dto.bno}">
		<button type = "button" id ="btnUpdate">수정하기</button>
		<button type = "button" id = "btnDelete">삭제하기</button>
		
	</div>
</form>
</body>
</html>