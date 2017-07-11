<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  <!-- DataTables -->
  <link rel="stylesheet" href="${resources}/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${resources}/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${resources}/dist/css/skins/_all-skins.min.css">
  <style>
     #map {
	  height: 338px;
	  width: 100%;
	 }
  </style>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  
  <!-- Header -->
  <jsp:include page="tool_header.jsp"></jsp:include>
  <!-- Header -->
  
  <!-- sideBar -->
  <jsp:include page="tool_sideBar.jsp"></jsp:include>
  <!-- sideBar -->
  
<!-- Content Wrapper. Contains page content -->
<c:forEach var="branch" items="${branchInfo}">
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
                지점정보
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Home</li>
        <li> Branch</li>
        <li> 지점정보</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="${resources}/dist/img/user4-128x128.jpg" alt="User profile picture">

              <h3 class="profile-username text-center">${branch.master}</h3>

              <p class="text-muted text-center">지점장</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>직원수</b> <a class="pull-right">${empCount}</a>
                </li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">About Branch</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 지점명</strong>

              <p class="text-muted">
              	&nbsp;&nbsp;&nbsp;&nbsp; ${branch.name} 지점 
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 주소</strong>

              <p class="text-muted"> &nbsp;&nbsp;&nbsp;&nbsp;- ${branch.address1} <br> &nbsp;&nbsp;&nbsp;&nbsp;- ${branch.address2}</p>

              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> 영업시간</strong>

              <p> &nbsp;&nbsp;&nbsp;&nbsp; ${branch.time}</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#branch" data-toggle="tab">지점정보</a></li>
              <li><a href="#modify" data-toggle="tab">정보수정</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="branch">
                <!-- Post -->
                <div class="post">
                 <form class="form-horizontal">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"> 지점명</label>

                    <div class="col-sm-10">
                      <input readonly="readonly" class="form-control" name="name" id="inputName" value="${branch.name}" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"> 지점장</label>

                    <div class="col-sm-10">
                      <input readonly="readonly" class="form-control" name="master" id="inputEmail" value="${branch.master}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"> 연락처</label>

                    <div class="col-sm-10">
                      <input readonly="readonly" class="form-control" name="phone" id="phone" value="${branch.phone}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"> 주소</label>

                    <div class="col-sm-10">
                      <input readonly="readonly" class="form-control" name="address1" id="inputName" value="${branch.address1}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"> 상세주소</label>

                    <div class="col-sm-10">
                      <input readonly="readonly" class="form-control" name="address2" id="inputName" value="${branch.address2}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label"> 영업시간</label>

                    <div class="col-sm-10">
                      <input readonly="readonly" class="form-control" name="time" id="inputExperience" value="${branch.time}">
                    </div>
                  </div>
                </form> 
                </div>
                <!-- /.post -->

                <!-- Post -->
                <div class="post">
                  <div class="user-block">
                    <img class="img-circle img-bordered-sm" src="${resources}/dist/img/user6-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a>서울</a>
                          <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                        </span>
                    <span class="description">map & photo</span>
                  </div>
                  <!-- /.user-block -->
                  <div class="row margin-bottom">
                    <div class="col-sm-6">
                      <input type="hidden" id="address" value="${branch.address1} ${branch.address2}">
                      <div id="map"></div>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                      <div class="row">
                        <div class="col-sm-6">
                          <img class="img-responsive" src="${resources}/dist/img/photo2.png" alt="Photo">
                          <br>
                          <img class="img-responsive" src="${resources}/dist/img/photo3.jpg" alt="Photo">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                          <img class="img-responsive" src="${resources}/dist/img/photo4.jpg" alt="Photo">
                          <br>
                          <img class="img-responsive" src="${resources}/dist/img/photo1.png" alt="Photo">
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->
                    </div>
                    <!-- /.col -->
                  </div>
                  <!-- /.row -->
                </div>
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="modify">
                <form class="form-horizontal" action="mBranchInfoUpdate.do" method="post" name="modifyBranch">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"> 지점명</label>

                    <div class="col-sm-10">
                      <input readonly="readonly" class="form-control" name="name" id="inputName" value="${branch.name}" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"> 지점장</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="master" id="inputEmail" value="${branch.master}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"> 연락처</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="phone" id="inputEmail" value="${branch.phone}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"> 주소</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="address1" id="inputName" value="${branch.address1}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"> 상세주소</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="address2" id="inputName" value="${branch.address2}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label"> 영업시간</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" name="time" id="inputExperience" value="${branch.time}">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <input type="button" onclick="return modifyBranch_ch()" class="btn btn-danger" value="수정하기">
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
</c:forEach>
<!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <jsp:include page="tool_controlSidebar.jsp" />
  <!-- /.control-sidebar -->
  
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- post code -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- jQuery 2.2.3 -->
<script src="${resources}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${resources}/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${resources}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${resources}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${resources}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${resources}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${resources}/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${resources}/dist/js/demo.js"></script>
<!-- google map -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBDDdQ0Ro5U-PJGssG36UOL45RzjQXCQy0"></script>
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
  
  function modifyBranch_ch(){
	  var form = document.modifyBranch;
	  if(form.master.value == ""){
		  alert('지점장을 입력해주세요.');
		  form.master.focus();
		  return false;
	  }
	  if(form.phone.value == ""){
		  alert('연락처를 입력해주세요.');
		  form.phone.focus();
		  return false;
	  }
	  if(form.phone.value.length != 11){
		  alert('연락처는 11자 입니다. 다시 입력해주세요.');
		  form.phone.focus();
		  return false;
	  }
	  if(form.address1.value == ""){
		  alert('주소가 입력되지 않았습니다. 입력해주세요.');
		  form.address1.focus();
		  return false;
	  }
	  if(form.address2.value == ""){
		  alert('상세주소가 입력되지 않았습니다. 입력해주세요.');
		  form.address2.focus();
		  return false;
	  }
	  if(form.time.value == ""){
		  alert('영업시간이 입력되지 않았습니다. 입력해주세요.');
		  form.time.focus();
		  return false;
	  }
	  if (confirm("지점정보를 수정 하시겠습니까 ?")) { //확인
			form.submit();
		} else { //취소
			return false;
	  }
  }
   function initialize() {
	     
        var mapOptions = {
                            zoom: 16, // 지도를 띄웠을 때의 줌 크기
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
         
         
        var map = new google.maps.Map(document.getElementById("map"), // div의 id과 값이 같아야 함. "map"
                                    mapOptions);
         
        var size_x = 40; // 마커로 사용할 이미지의 가로 크기
        var size_y = 40; // 마커로 사용할 이미지의 세로 크기
     
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( '주소 여기에 기입!',
                                                    new google.maps.Size(size_x, size_y),
                                                    '',
                                                    '',
                                                    new google.maps.Size(size_x, size_y));
         
        // Geocoding *****************************************************
        var address = $('#address').val(); // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var phone = $('#phone').val(); 
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                icon: image, // 마커로 사용할 이미지(변수)
                                title: address, // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                position: results[0].geometry.location
                            });
 
                var content = "Tel : "+phone; // 말풍선 안에 들어갈 내용
             
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({ content: content});
                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        // Geocoding // *****************************************************
         
    }
    google.maps.event.addDomListener(window, 'load', initialize); 
</script>
</body>
</html>
