<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>직 원 관 리</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="admin/adminMain.jsp"/>
<!-- header -->
<div class="container">
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">목록</a></li>
		<li><a data-toggle="tab" href="#menu1">직원등록</a></li>
	</ul>
		<div class="tab-content" style="margin-left: 5%;">
		<!-- 직원 목록, 수정, 삭제 -->
		<div id="home" class="tab-pane fade in active">
			<h3>직원목록</h3><br>
			<table class="table table-condensed">
				<tr>
					<th>직원번호</th>
					<th>이름</th>
					<th>직급</th>
					<th>주소</th>
					<th>연락처</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>지점</th>
				</tr>
				<c:forEach var="employee" items="${ employeeList }"
					varStatus="status">
					<tr>
						<td>
							<button type="button" class="btn btn-default"
								data-toggle="modal" data-target="#myModal${ employee.empno }">${ employee.empno }</button>
						</td>
						<td>${ employee.name }</td>
						<td>${ employee.empclass }</td>
						<td>${ employee.address1 }-${ employee.address2 }</td>
						<td>${ employee.phone }</td>
						<td>${ employee.gender }</td>
						<td>${ employee.birth }</td>
						<td>${ employee.branch }</td>
					</tr>
					<div class="modal fade" id="myModal${ employee.empno }"
						role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">직원관리</h4>
								</div>
								<div class="modal-body">
										<button type="button" class="btn btn-default">수정</button>
									<div class="empInfo">
										<form action="mEmployeeUD.do" method="post">
											<input type="text" value="${ employee.empno }" name="empno"><br>
											<input type="text" value="${ employee.pwd }" name="pwd"><br>
											<input type="text" value="${ employee.empclass }"
												name="empclass"><br> <input type="text"
												value="${ employee.phone }" name="phone"><br>
											<input type="text" value="${ employee.address1 }"
												name="address1"><br> <input type="text"
												value="${ employee.address2 }" name="address2"><br>
											<input type="text" value="${ employee.branch }"
												name="branch"><br> 
											<input type="submit" class="btn btn-default" value="수정완료">
										</form>
									</div>
									<form action="mEmployeeUD.do" method="post">
										<input type="hidden" value="${employee.empno }" name="empno">
										<input type="submit" class="btn btn-default" value="삭제">
									</form>
									</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</table>
			<!-- 직원 목록, 수정, 삭제 -->
				<!-- 직원목록 전체 출력 버튼 -->
			<form action="mEmployee.do" method="post" style="float:right;margin-top:-10px;">
				<input type="submit" class="btn btn-default" value="전체보기">
			</form><br>
			<hr>
			<h3>검색</h3>
			<form action="mEmployee.do" method="post">
				<div class="input-group">
						<span class="input-group-addon" style="width:100px;">이름</span>
						<input id="msg"	type="text" class="form-control" name="name" placeholder="이름을 입력하고 Enter">
				</div>
			</form>
		</div>
		<!-- 직원 추가 탭 -->
		<div id="menu1" class="tab-pane fade">
			<h3>직원등록</h3><br>
			<form action="mEmployeeIn.do" method="post">
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">직원번호</span> 
						<input style="width:300px;height:40px;" id="msg" type="text" class="form-control" 
							   name="empno" placeholder="Additional Info">
					</div>
					<div class="input-group" >
						<span class="input-group-addon" style="width:100px;height:40px;">이름</span> 
						<input style="width:300px;height:40px;" id="msg" type="text" class="form-control"
							   name="name" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">비밀번호</span> 
						<input style="width:300px;height:40px;" id="msg" type="text" class="form-control" 
						  	   name="pwd" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">연락처</span> 
						<input style="width:300px;height:40px;" id="msg" type="text" class="form-control"
							   name="phone" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">직급</span> 
						<select name="empclass" class="form-control" id="sel1" style="width:300px;height:40px;">
									<option value="직원">직원</option> 
									<option value="매니저">매니저</option> 
									<option value="지점장">지점장</option> 
						</select>
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">성별</span>&nbsp;&nbsp;
						<select name="gender" class="form-control" id="sel1" style="width:300px;height:40px;">
									<option value="M">M</option> 
									<option value="F">F</option> 
						</select>
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">주소</span> 
						<input style="width:300px;height:40px;" id="msg" type="text" class="form-control"
							   name="address1" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">상세주소</span> 
						<input style="width:300px;height:40px;" id="msg" type="text" class="form-control"
							   name="address2" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">생년월일</span> 
						<input style="width:300px;height:40px;" id="msg" type="text" class="form-control"
							   name="birth" placeholder="Additional Info">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="width:100px;height:40px;">지점</span> 
						<input style="width:300px;height:40px;" id="msg" type="text" class="form-control"
							   name="branch" placeholder="Additional Info">
					</div>
					<input style="width:400px;" type="submit" class="btn btn-default" value="추가">
			</form>
		</div>
		</div>
</div>
</body>
</html>