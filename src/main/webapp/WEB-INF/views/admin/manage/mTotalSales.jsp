<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>매 출 관 리</title>
	<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="${resources}/css/Nwagon.css" rel="stylesheet">
	<script src="${resources}/js/Nwagon.js"></script>
</head>
<script>
$(document).ready(function() {

	/* 각 지점별 국내/외국도서 판매량 비교 */
		
		var totalDomestic = ${ totalDomestic };
		var totalForeign = ${ totalForeign };
		var listDomestic = ${ listDomestic };
		var listForeign = ${ listForeign };
		
		alert(listDomestic);
		
		var optionsCircle = {
			'dataset':{
				title: '월간 국내도서 / 외국도서 판매금액 비교',
				values:[totalDomestic, totalForeign],
				colorset: ['#2EB400', '#2BC8C9'],
				fields: ['국내도서', '외국도서'],
			},
			'donut_width' : 35,
			'core_circle_radius':50,
			'chartDiv': 'Nwagon2',
			'chartType': 'donut',
			'chartSize': {width:700, height:400}
		};
		var optionsColumn = {
				'legend': {
					names: ['온라인','강남','광교','수원','판교'],
					
				},
				'dataset': {
					title: '지점별 판매액 비교',
					values: [
						[listDomestic[0], listForeign[0]], [listDomestic[1], listForeign[1]],
						[listDomestic[2], listForeign[2]], [listDomestic[3], listForeign[3]], [listDomestic[4], listForeign[4]]
					],
					colorset: ['#DC143C', '#FF8C00'],
					fields: ['국내도서', '외국도서']
				},
				'chartDiv': 'Nwagon',
				'chartType': 'multi_column',
				'chartSize': { width: 800, height: 500 },
				'maxValue': 600000,
				'increment': 50000
		};
		Nwagon.chart(optionsColumn);
		Nwagon.chart(optionsCircle);
	
});
	

</script>


<body>
	<!-- header -->
	<jsp:include page="../adminNav.jsp" />
	<!-- header -->

	<div class="container">
		<ul class="nav nav-tabs" style="margin-left:1%;">
			<li class="active"><a data-toggle="tab" href="#saleNewBook">도서판매보기</a></li>
		</ul>

		<div class="tab-content" style="margin-left:5%;">
			<div id="saleNewBook" class="tab-pane fade in active">
				<h3>월간 판매량 비교</h3>
				
				<div id="Nwagon"></div>
				<div id="Nwagon2"></div>
				
			</div>

			
		</div>
	</div>
	</div>

</body>
</html>