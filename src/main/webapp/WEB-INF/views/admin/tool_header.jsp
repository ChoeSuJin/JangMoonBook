<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
  <c:set value="${pageContext.request.contextPath}/resources" var="resources" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>StarBooks | Manage Emp</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${resources}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${resources}/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${resources}/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<header class="main-header">
    <!-- Logo -->
    <a href="${resources}/index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>S</b>B</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Star</b>Books</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" onclick="updateMessage();">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success" id="setMessageCount"></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have <font id="setMessageCountDiv"></font> unread messages</li>
              <li id="messageList">
                <!-- inner menu: contains the actual data -->
                <div id="listMessage"></div>
              </li>
              <li class="footer"><a href="mNoteReceive.do">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" onclick="updateNotification();">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning" id="setNotificationCount"></span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have <font id="setNotificationCountDiv"></font> notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li class="notification">
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> <font id="todayAdminNotice"></font> 개의 새로 등록된 공지사항
                    </a>
                  </li>
                  <sec:authorize access="hasAnyRole('ROLE_GOLD', 'ROLE_PLATINUM')">
                  <li class="notification">
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> <font id="emergencyBook"></font> 건의 주문요망
                    </a>
                  </li>
                  </sec:authorize>
                  <sec:authorize access="hasAnyRole('ROLE_GOLD', 'ROLE_PLATINUM', 'ROLE_ONLINE')">
                  <li class="notification">
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> <font id="todaySales"></font> 건의 판매
                    </a>
                  </li>
                  </sec:authorize>
                  <sec:authorize access="hasAnyRole('ROLE_BRONZE', 'ROLE_GOLD', 'ROLE_PLATINUM')">
                  <li class="notification">
                    <a href="#">
                      <i class="fa fa-users text-red"></i> <font id="directBook"></font> 건의 당일 수령 예정
                    </a>
                  </li>
                  </sec:authorize>
                  <sec:authorize access="hasAnyRole('ROLE_WRITER')">
                  <li class="notification">
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> <font id="notDoQnA"></font> 개의 미처리된 QnA
                    </a>
                  </li>
                  </sec:authorize>
                  <sec:authorize access="hasAnyRole('ROLE_EBOOK')">
                  <li class="notification">
                    <a href="#">
                      <i class="fa fa-user text-red"></i> <font id="requestEbook"></font>건의 Ebook 대여 요청
                    </a>
                  </li>
                  </sec:authorize>
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Create a nice theme
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Some task I need to do
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Make beautiful transitions
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <c:set var="user" value="${sessionScope.user}" />
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${resources}/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${user.name}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${resources}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  ${user.name} - 
                  <c:if test="${user.empClass == 'ROLE_BRONZE'}">
                  	일반직원
                  </c:if>
                  <c:if test="${user.empClass == 'ROLE_GOLD'}">
                  	매니저
                  </c:if>
                  <c:if test="${user.empClass == 'ROLE_PLATINUM'}">
                  	점장
                  </c:if>
                  <c:if test="${user.empClass == 'ROLE_DIAMOND'}">
                  	본사직원
                  </c:if>
                  <small>지점 - ${user.branch}</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <c:url value="/j_spring_security_logout" var="logoutUrl"/>
                  <a href="${logoutUrl}" class="btn btn-default btn-flat">Logout</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
</body>
<!-- jQuery 2.2.3 -->
<script src="${resources}/plugins/jQuery/jquery-2.2.3.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		updateMessage();
		updateNotification();
	});
	
	function updateMessage() {
		
		var empNo = ${ user.empNo };
		
		$.ajax({
			url: "getMessage.do",
			type: "post",
			dataType: "JSON",
			data : {"empNo" : empNo},
			error : function() {
				alert("메세지 목록을 불러오지 못했습니다.");
			},
			success: function(data) {
				var values = data.list;
				values = JSON.stringify(values);
				var list = JSON.parse(values);
				var count = data.count;
				
				$("#setMessageCount").html(count);
				$("#setMessageCountDiv").html(count);
				
				var html = '<ul class="menu">';
				
				
				if (count == 0) {
					html += '<li>';
					html += '읽지않은 메세지가 없습니다.';
					html += '</li>';
					html += '</ul>';
					
					$("#listMessage").html(html);
				} else {
					for (var i = 0; i < 5; i++) {
						var startTime = new Date();
						var date = list[i].date_sent;
						var second = startTime.getTime();
						var time = (startTime - date) / 1000;
						// time == 초단위
						
						html += '<li>';
						html += '<a href="#">';
						html += '<div class="pull-left">';
						html += '<img src="${resources}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">';
						html += '</div>';
						html += '<h4>';
						html += list[i].sent_id;
						if (time < 60) {
							// 몇초전으로 표시
							html += '<small><i class="fa fa-clock-o"></i>' + parseInt(time) + '초 전</small>';
						}
						// 한시간 이내
						else if (time < 60*60) {
							time = time / 60;
							// 몇 분전으로 표시
							html += '<small><i class="fa fa-clock-o"></i>' + parseInt(time) + '분 전</small>';
						}
						//하루 이내
						else if (time < 60*60*24) {
							time = time / 60 / 60;
							// 몇 시간전으로 표시
							html += '<small><i class="fa fa-clock-o"></i>' + parseInt(time) + '시간 전</small>';
						}
						//1일 이후
						else if (time >= 60*60*24) {
							time = time / 60 / 60 / 24;
							// 몇일 전으로 표시
							html += '<small><i class="fa fa-clock-o"></i>' + parseInt(time) + '일 전</small>';
						}
						html += '</h4>';
						html += '<p>' + list[i].title + '</p>';
						html += '</a></li>';
					}
					$("#listMessage").html(html);
				}
				
				
			}
		});
		
	}
	
	function updateNotification() {
		var empNo = ${ user.empNo };
		
		$.ajax({
			url: "getNotification.do",
			type: "post",
			dataType: "JSON",
			data : {"empNo" : empNo},
			error : function() {
				alert("알림목록을 불러오지 못했습니다.");
			},
			success: function(data) {
				var todayAdminNotice = data.todayAdminNotice;
				var notDoQnA = data.notDoQnA;
				var emergencyBook = data.emergencyBook;
				var directBook = data.directBook;
				var requestEbook = data.requestEbook;
				
				$("#todayAdminNotice").html(todayAdminNotice);
				$("#notDoQnA").html(notDoQnA);
				$("#emergencyBook").html(emergencyBook);
				$("#directBook").html(directBook);
				$("#requestEbook").html(requestEbook);
				
				var countNotification = $(".notification").length;
				
				$("#setNotificationCount").html(countNotification);
				$("#setNotificationCountDiv").html(countNotification);
			}
		});
	}

</script>

</html>