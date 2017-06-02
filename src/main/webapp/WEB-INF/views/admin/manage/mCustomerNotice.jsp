<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객공지사항관리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="../adminNav.jsp"/>
<!-- header -->
	<div class="container" >
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#viewNotice">공지사항보기</a></li>
			<li><a data-toggle="tab" href="#regNotice">공지사항등록</a></li>
		</ul>
		<br>
		<div class="tab-content" style="margin-left:5%;">

			<div id="viewNotice" class="tab-pane fade in active">
				<div class="panel-group" id="accordion">
				<table id="viewNoticeTable" class="table table-condensed">
					<th>num</th>
					<th>title</th>
					<th>regDate</th>
					<th>삭제하기</th>
					<c:forEach items="${ list }" var="list">
					<div class="panel panel-default">
							<tr class="panel panel-heading" class="panel-title">
								<form action="deleteCustomerNotice.do" method="post">
								<input type="hidden" name="num" value="${ list.articleNumber }">						
								<td>${ list.articleNumber }</td>
								<td><a data-toggle="collapse" data-parent="#accordion" href="#notice${ list.articleNumber }">${ list.title }</a></td>
								<td>${ list.regDate }</td>
								<td><input type="submit" value="삭제"></td>
								</form>
							</tr>
					
						<tr id="notice${ list.articleNumber }" class="panel-collapse collapse">
					        <div class="panel-body">
								<td colspan="5">${ list.content }</td>
							</div>
							</tr>
					</div>
					</c:forEach>
				</table>	
				</div>
				
			</div>		
		
			<div id="regNotice" class="tab-pane fade">
				<div class="container">
				  <form action="regCustomerNotice.do" method="post">
				    <div class="form-group">
				      <label for="title">제목</label>
				      <input type="text" class="form-control" id="title" name="title">
				    </div>
				    <div class="form-group">
				      <label for="content">내용</label>
				      <textarea class="form-control" rows="5" id="content" name="content"></textarea>
				    </div>
				    <input type="submit" class="btn btn-default">
				  </form>
				</div>


			</div>

			
		</div>
	</div>

</body>
</html>