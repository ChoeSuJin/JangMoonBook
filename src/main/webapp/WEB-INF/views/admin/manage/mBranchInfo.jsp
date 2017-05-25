<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>지 점 정 보</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	function button_event() {
		if (confirm("수정 하시겠습니까 ?")) { //확인
			$('#update').submit();
		} else { //취소
			return false;
		}
	}
  </script>
</head>
<body>
<!-- header -->
<jsp:include page="../adminNav.jsp"/>
<!-- header -->
<div class="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">지점정보</a></li>
    <li><a data-toggle="tab" href="#menu1">지점정보 수정</a></li>
  </ul>
  
  <div class="tab-content" style="margin-left:5%;">
    <div id="home" class="tab-pane fade in active">
      <h3>지점정보</h3><br>
		<c:forEach var="branch" items="${ branchInfo }">
			<table class="table table-condensed">
				<tr><td>지점 명</td><td>${ branch.name }</td></tr>
				<tr><td>지점 장</td><td>${ branch.master}</td></tr>
				<tr><td>지점 번호</td><td>${ branch.phone }</td></tr>
				<tr><td>지점 주소</td><td>${ branch.address1 } - ${ branch.address2 }</td></tr>
				<tr><td>직원 수</td><td>${ empCount }</td></tr>
				<tr><td>수익</td><td>${ branch.sales }</td></tr>
				<tr><td>영업 시간</td><td>${ branch.time }</td></tr>
			</table>
			<hr>
		</c:forEach>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>지점정보 수정</h3><br>
		<form action="mBranchInfoUpdate.do" method="post" id="update">
			<c:forEach var="branch" items="${ branchInfo }">
			<div class="input-group">
				<span class="input-group-addon" style="width:100px;height:40px;">지점장</span> 
				<input style="height:40px;width:300px;" id="msg" type="text" class="form-control" 
					   name="master" value="${ branch.master }">
			</div>
			<div class="input-group">
				<span class="input-group-addon" style="width:100px;height:40px;">번호</span> 
				<input style="height:40px;width:300px;" id="msg"	type="text" class="form-control" 
					   name="phone" value="${ branch.phone }">
			</div>
			<div class="input-group">
				<span class="input-group-addon" style="width:100px;height:40px;">주소</span> 
				<input style="height:40px;width:300px;" id="msg"	type="text" class="form-control"
				       name="address1" value="${ branch.address1 }">
			</div>
			<div class="input-group">
				<span class="input-group-addon" style="width:100px;height:40px;">상세주소</span> 
				<input style="height:40px;width:300px;" id="msg"	type="text" class="form-control"
					   name="address2" value="${ branch.address2 }">
			</div>
			<div class="input-group">
				<span class="input-group-addon" style="width:100px;height:40px;">운영시간</span> 
				<input style="height:40px;width:300px;" id="msg"	type="text" class="form-control" 
					   name="time" value="${ branch.time }">
			</div>
			<input type="hidden" name="name" value="${ branch.name }">
			<input style="width:400px;" class="btn btn-default" type="button"
				   value="수정" onclick="button_event();">
			</c:forEach>
		</form>
    </div>
  </div>
</div>
</body>
</html>