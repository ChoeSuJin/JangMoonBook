<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
<head>
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script>
  function openEbook(index, title) {
		var path = '<c:out value="${ resources }"/>';
		var title = title;
		
		var options = {
			pdfOpenParams : {
				navpanes: 1,
				toolbar: 0,
				statusbar: 1,
				view: "FitV"
			}
		};
		
		PDFObject.embed(""+ path +"/ebook/test.pdf", "#viewBook" + index + "", options);
		$("#openEbook" + index + "").show();
	}
  </script>
</head>
<body>
<jsp:include page="organNav.jsp" />
	<div class="container">
		<div class="tab-content" style="margin-left: 5%;">
			<h3>e_book 보유목록</h3>
			<br>
			<form action="" method="post">
				<div class="input-group">
					<span class="input-group-addon" style="width:100px;">책 제목</span>
					<input id="msg"	type="text" class="form-control" name="title" 
						   placeholder="제목을 입력하고 Enter키를 입력하세요" style="width:280px;">
				</div>
			</form><br>
			<table class="table table-condensed">
				<tr>
					<th>책 제목</th>
					<th>분류 번호</th>
				</tr>
				<c:forEach var="ed" items="${ ebookDistList }" varStatus="status">
					<tr>
						<td><a onclick="openEbook('${ status.index }', '${ status.index }')" data-toggle="modal" data-target="#openEbook${ status.index }">${ ed.title } </a></td>
						<td>${ ed.isbn }</td>
					</tr>
					<!-- Modal -->
					  <div class="modal fade" id="openEbook${ status.index }" role="dialog">
					    <div class="modal-dialog">
				    
				      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">${ ed.title }</h4>
					        </div>
					        <div class="modal-body" id="viewBook${ status.index }">
								          
					        </div>
						        <div class="modal-footer">
						          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        </div>
					      </div>
							      
					    </div>
					  </div>
				</c:forEach>
			</table>
			<form action="" method="post" style="float:right;margin-top:-10px;">
				<input type="submit" class="btn btn-default" value="전체보기">
			</form><br>
		</div>
		

	</div>
	<script src="${resources}/js/jquery.js"></script>
	<script src="${resources}/js/bootstrap.min.js"></script>
	<script src="${resources}/js/jquery.scrollUp.min.js"></script>
	<script src="${resources}/js/pdfobject.js"></script>
</body>
</html>