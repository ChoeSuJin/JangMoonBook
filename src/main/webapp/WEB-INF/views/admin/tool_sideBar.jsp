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
<c:set var="user" value="${sessionScope.user}" />
<!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${resources}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${user.name}</p>
          <small><i class="fa fa-circle text-success"></i> Online</small>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <sec:authorize access="hasAnyRole('ROLE_PLATINUM')">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i>
            <span>Branch</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mEmployee.do"><i class="fa fa-user"></i> 직원관리</a></li>
            <li><a href="mEmployeeIn.do"><i class="fa fa-user-plus"></i> 직원등록</a></li>
            <li><a href="mBranchInfo.do"><i class="fa fa-info"></i> 지점정보</a></li>
          </ul>
        </li>
        </sec:authorize>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-envelope"></i>
            <span>Message</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mNoteReceive.do"><i class="fa fa-mail-reply"></i> 받은쪽지함</a></li>
            <li><a href="mNoteSend.do"><i class="fa fa-mail-forward"></i> 보낸쪽지함</a></li>
            <li><a href="sendNoteForm.do"><i class="fa fa-send"></i> 쪽지보내기</a></li>
          </ul>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_GOLD', 'ROLE_PLATINUM')">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-inbox"></i>
            <span>Inventory</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mInventoryEmergency.do"><i class="fa fa-battery-0"></i> 주문요망</a></li>
            <li><a href="mInventoryNormal.do"><i class="fa fa-battery-4"></i> 재고확인</a></li>
            <li><a href="mInventoryOrder.do"><i class="fa fa-check"></i> 주문확인</a></li>
            <li><a href="mInventoryNewBook.do"><i class="fa fa-book"></i> 신책등록</a></li>
            <li><a href="mInventoryGetDirectList.do"><i class="fa fa-cart-arrow-down"></i> 수령확인</a></li>
          </ul>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_GOLD', 'ROLE_PLATINUM')">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-krw"></i>
            <span>Sales</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mSalesDomestic.do"><i class="fa fa-bicycle"></i> 국내도서</a></li>
            <li><a href="mSalesForeign.do"><i class="fa fa-ship"></i> 외국도서</a></li>
          </ul>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_WRITER')">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-question-circle"></i>
            <span>QnA</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mQnAList.do"><i class="fa fa-question"></i> QnA목록</a></li>
          </ul>
        </li>
        </sec:authorize>
        
        <sec:authorize access="hasAnyRole('ROLE_WRITER')">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-sticky-note"></i>
            <span>CustomerNotice</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mCustomerNotice.do"><i class="fa fa-align-justify"></i> 공지사항목록</a></li>
            <li><a href="mWriteCustomerNotice.do"><i class="fa fa-font"></i> 공지사항 등록하기</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-sticky-note"></i>
            <span>AdvertiseMail</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="sendAdvertiseMail.do"><i class="fa fa-envelope"></i> 광고메일보내기</a></li>
          </ul>
        </li>
        </sec:authorize>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-list-ul"></i>
            <span>AdminNotice</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mAdminNotice.do"><i class="fa fa-list-alt"></i> 공지사항목록</a></li>
            <sec:authorize access="hasAnyRole('ROLE_DIAMOND')">
            <li><a href="mWriteAdminNotice.do"><i class="fa fa-bold"></i> 공지사항 등록하기</a></li>
            </sec:authorize>
          </ul>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_ONLINE')">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-inbox"></i>
            <span>Online Inventory</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mOnlineInventoryEmergency.do"><i class="fa fa-battery-0"></i> 주문요망</a></li>
            <li><a href="mOnlineInventoryNormal.do"><i class="fa fa-battery-4"></i> 재고확인</a></li>
            <li><a href="mOnlineInventoryOrder.do"><i class="fa fa-check"></i> 주문확인</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-krw"></i>
            <span>Online Sales</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mOnlineSales.do"><i class="fa fa-line-chart"></i> 온라인판매</a></li>
          </ul>
        </li>
        </sec:authorize>
        
        <sec:authorize access="hasAnyRole('ROLE_DIAMOND')">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-krw"></i>
            <span>Total Sales</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mTotalSaleByBranch.do"><i class="fa fa-bar-chart"></i> 지점별 매출</a></li>
            <li><a href="mTotalSaleByType.do"><i class="fa fa-pie-chart"></i> 타입별 매출</a></li>
          </ul>
        </li>
        </sec:authorize>
        
        <sec:authorize access="hasAnyRole('ROLE_EBOOK')">
        <li class="treeview">
          <a href="#">
            <i class="fa fa-file-pdf-o"></i>
            <span>Ebook</span>	
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="mEbookList.do"><i class="fa fa-list-ol"></i> 대여목록</a></li>
            <li><a href="mEbookPermitList.do"><i class="fa fa-th-list"></i> 대여허가요청</a></li>
            <li><a href="mEbookInsertNewOrg.do"><i class="fa fa-user-plus"></i> 가맹점등록</a></li>
          </ul>
        </li>
        </sec:authorize>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
</body>
</html>