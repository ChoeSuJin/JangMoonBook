<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<c:set value="${pageContext.request.contextPath}/resources" var="resources" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 메인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${resources}/js/main.js"></script>
  <script type="text/javascript">
  	$(document).ready(function() {
  		var id = '<c:out value="${sessionScope.user.name}" />';
		var initLogin = '<c:out value="${sessionScope.isInitLogin}" />';
  		notifyAdminDoList(id, initLogin);
  		var todayNoticeCount = '<c:out value="${todayNotice}"/>';
  		notifyTodayAdminNotice(initLogin, todayNoticeCount);
  		<c:set value="1" var="isInitLogin" scope="session"/>
  		
  		<sec:authorize access="hasAnyRole('ROLE_GOLD')">
  			
	  	</sec:authorize>
	  	
	  	<sec:authorize access="hasAnyRole('ROLE_PLATINUM')">
		  	var emergencyBook = ${emergencyBook};
	  		notifyEmergencyBook(initLogin, emergencyBook);
	  		
	  		var directBook = ${ directBook };
	  		notifyDirectBook(initLogin, directBook);
	 	</sec:authorize>
	 	
    	<sec:authorize access="hasAnyRole('ROLE_DIAMOND')">
    
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ROLE_EBOOK')">
      		var ebookCount = ${requestEbook};
      		notifyRequestEbook(initLogin, ebookCount);
		</sec:authorize>
	  	<sec:authorize access="hasAnyRole('ROLE_WRITER')">
	  		var qnaCount = ${ notDoQnA };
	  		notifyDoQnA(initLogin, qnaCount);
		</sec:authorize>
		
		<sec:authorize access="hasAnyRole('ROLE_ONLINE')">
	  		var emergencyBook = ${emergencyBook};
	  		notifyEmergencyBook(initLogin, emergencyBook);
	 	</sec:authorize>
  			
  	});
  </script>
</head>
<body>
<br>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="adminNav.do">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      <sec:authorize access="hasAnyRole('ROLE_GOLD')">
        <li><a href="mInventory.do">재고관리</a></li>
        <li><a href="mCustomer.do">고객관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
	  </sec:authorize>
	  <sec:authorize access="hasAnyRole('ROLE_PLATINUM')">
        <li><a href="mBranchInfo.do">지점관리</a></li>
        <li><a href="mSales.do">매출관리</a></li>
         <li><a href="mInventory.do">재고관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
	  </sec:authorize>
      <sec:authorize access="hasAnyRole('ROLE_DIAMOND')">
      	<li><a href="mAdminNotice.do">사내공지사항관리</a></li>
        <li><a href="mSales.do">매출관리</a></li>
        <li><a href="mEmployee.do">직원관리</a></li>
	  </sec:authorize>
	  <sec:authorize access="hasAnyRole('ROLE_EBOOK')">
        <li><a href="mEbook.do">eBook</a></li>
	  </sec:authorize>
	  <sec:authorize access="hasAnyRole('ROLE_WRITER')">
	  	<li><a href="mQNABoard.do">QnA게시판</a></li>
	  	<li><a href="mCustomerNotice.do">고객공지사항관리</a></li>
	  </sec:authorize>
	  <sec:authorize access="hasAnyRole('ROLE_ONLINE')">
	  	<li><a href="mOnlineSale.do">온라인판매보기</a></li>
	  	<li><a href="mOnlineInventory.do">온라인재고관리</a></li>
	  </sec:authorize>
      </ul>
      <c:url value="/j_spring_security_logout" var="logoutUrl"/>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${ logoutUrl }">
        	<span class="glyphicon glyphicon-log-in"></span> Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- 관리자 메인(공지사항) -->
	<c:if test="${main != null}">
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">본사 공지사항</a></li>
			</ul>

			<div class="tab-content" style="margin-left: 5%;">
				<div id="home" class="tab-pane fade in active">
					<h3>본사 공지사항</h3>
					<div id="viewNotice">
						<div class="panel-group" id="accordion">
						<table id="viewNoticeTable" class="table table-striped">
							<tr class="info">
							<th>num</th>
							<th>writer</th>
							<th>title</th>
							<th>regDate</th>
							</tr>
							<c:forEach items="${ adminNotice }" var="list">
								<tr class="panel panel-default panel-heading panel-title">						
									<td>${ list.num }</td>
									<td>${ list.writer }</td>
									<td><a data-toggle="collapse" data-parent="#accordion" href="#notice${ list.num }">${ list.title }</a></td>
									<td><fmt:formatDate value="${ list.regDate }" type="date"/></td>
								</tr>
							
								<tr id="notice${ list.num }" class="panel-collapse collapse">
									<td colspan="5"class="panel-body">${ list.content }</td>
			
								</tr>
							</c:forEach>
						</table>	
						</div>
				
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
</body>
</html>