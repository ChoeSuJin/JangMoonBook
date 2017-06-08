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
	
	$("#btnSave").click(function(){
		var writer=document.form1.writer.value;
		var content=document.form1.content.value;
		var title=document.form1.title.value;
		//var title=$("#title").val();
		if(writer==""){
			alert("이름을 입력하세요");
			document.form1.writer.focus();
			return;
		} 
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

		document.form1.submit();
	});
});
</script>

</head>
<body>
<h2>글쓰기</h2>
<form id = "form1" name ="form1" method = "post" action="${path}/board/insert.do">
	<div> 제목
		<input name ="title"  size = "50">
	</div>
	<div> 작성자
		<input name = "writer" value="${ sessionScope.id }" readonly="readonly">
	</div>
	<div> 내용
		<textarea name = "content" rows="10" cols="50"></textarea>	
	</div>
	<div style="width:300px; text-align:center">
		<button type = "button" id="btnSave">글쓰기</button>
	</div>
</form>
</body>
</html>