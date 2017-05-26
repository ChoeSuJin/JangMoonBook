<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>매 출 관 리</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<script type="text/javascript">
	$(document).ready(function() {
		var sumNew = $('#sumNew').val();
		var sumUsed = $('#sumUsed').val();
		var option = {
			responsive : true,
		};

		// Get the context of the canvas element we want to select
		var ctx = document.getElementById("myChart").getContext('2d');
		var myPieChart = new Chart(ctx).Pie(data, option);
		var data = [ {
			value : sumNew,
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "Red"
		}, {
			value : sumUsed,
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label : "Green"
		} ]
	});
</script>

<body>
	<!-- header -->
	<jsp:include page="../adminNav.jsp" />
	<!-- header -->
	<input type="hidden" id="sumNew" value=${ sumNew }>
	<input type="hidden" id="sumUsed" value=${ sumUsed }>

	<div class="container">
		<ul class="nav nav-tabs" style="margin-left:1%;">
			<li class="active"><a data-toggle="tab" href="#saleNewBook">신책</a></li>
			<li><a data-toggle="tab" href="#saleUsedBook">중고</a></li>
		</ul>

		<div class="tab-content" style="margin-left:5%;">
			<div id="saleNewBook" class="tab-pane fade in active">
				<h3>신책 판매</h3>
				<table class="table table-condensed">
					<tr>
						<th>판매번호</th>
						<th>ISBN</th>
						<th>제목</th>
						<th>아이디</th>
						<th>dPrice</th>
						<th>지점</th>
						<th>수량</th>
						<th>판매일</th>
					</tr>
					<c:forEach items="${ list1 }" var="list">
						<tr>
							<td>${ list.saleNumber }</td>
							<td>${ list.isbn }</td>
							<td>${ list.title }</td>
							<td>${ list.id }</td>
							<td>${ list.dPrice }</td>
							<td>${ list.branchName }</td>
							<td>${ list.quantity }</td>
							<td>${ list.s_date }</td>

						</tr>
					</c:forEach>
					<tr>
						<td colspan="8">총 = ${ sumNew }원</td>
					</tr>
				</table>
			</div>

			<div id="saleUsedBook" class="tab-pane fade">
				<h3>중고책 판매</h3>
				<table class="table table-condensed">
					<tr>
						<th>판매번호</th>
						<th>ISBN</th>
						<th>제목</th>
						<th>아이디</th>
						<th>dPrice</th>
						<th>지점</th>
						<th>수량</th>
						<th>판매일</th>
					</tr>
					<c:forEach items="${ list2 }" var="list">
						<tr>
							<td>${ list.saleNumber }</td>
							<td>${ list.isbn }</td>
							<td>${ list.title }</td>
							<td>${ list.id }</td>
							<td>${ list.dPrice }</td>
							<td>${ list.branchName }</td>
							<td>${ list.quantity }</td>
							<td>${ list.s_date }</td>

						</tr>
					</c:forEach>
					<tr>
						<td colspan="8">총 = ${ sumUsed }원</td>
					</tr>
				</table>
			</div>
			<canvas id="myChart" style="width: 300px; height: 300px;"></canvas>
		</div>
	</div>
	</div>

</body>
</html>