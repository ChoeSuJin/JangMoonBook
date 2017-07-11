<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
  <c:set value="${pageContext.request.contextPath}/resources" var="resources" />
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>StarBooks | adminMain</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${resources}/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="${resources}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
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
  <jsp:include page="tool_header.jsp" />
  <!-- Header -->
  
  <!-- sideBar -->
  <jsp:include page="tool_sideBar.jsp" />
  <!-- sideBar-->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        StarBooks Admin
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Main</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
	      <!-- Default box -->
	      <div class="box">
	        <div class="box-header with-border">
	          <h3 class="box-title">본사 공지사항</h3>
	          <div class="box-tools pull-right">
	            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
	              <i class="fa fa-minus"></i></button>
	            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
	              <i class="fa fa-times"></i></button>
	          </div>
	        </div>
	        <div class="box-body">
	          <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>공지번호</th>
                  <th>글쓴이</th>
                  <th>제목</th>
                  <th>등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="notice" items="${adminNotice}">
                <tr>
                  <td>${notice.num}</td>
                  <td>${notice.writer}</td>
                  <td><a data-toggle="modal" data-target="#noticeModal_${notice.num}">${notice.title}</a></td>
                  <td>${notice.regDate}</td>
                  		<div class="modal fade" tabindex="-1" id="noticeModal_${notice.num}" role="dialog" aria-labelledby="gridSystemModalLabel">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="exampleModalLabel">공지내용</h4>
						      </div>
						      <div class="modal-body">
						      	<p>${notice.content}</p>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
                </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                  <th>공지번호</th>
                  <th>글쓴이</th>
                  <th>제목</th>
                  <th>등록일</th>
                </tr>
                </tfoot>
              </table>
	        </div>
	        <!-- /.box-body -->
	        <div class="box-footer">
	          Footer
	        </div>
	        <!-- /.box-footer-->
	      </div>
	      <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <div class="col-md-8">
          <!-- MAP & BOX PANE -->
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title">지점 위치</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="row">
                <div class="col-md-9 col-sm-8">
                  <div class="pad">
                    <!-- Map will be created here -->
                    <c:forEach var="b" items="${branch}">
                    <input type="hidden" id="address" value="${b.address1} ${b.address2}">
                    </c:forEach>
                    <div id="map"></div>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-md-3 col-sm-4">
                  <div class="pad box-pane-right bg-green" style="min-height: 350px">
                    <div class="description-block margin-bottom">
	                  <c:forEach var="b" items="${branch}">
	                    <div class="sparkbar pad" data-color="#fff" style="margin-top:100px;">지점 주소</div>
                        <span class="description-text">${b.address1}</span>
                        <span class="description-text">${b.address2}</span>
	                  </c:forEach>
                    </div>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          
          <!-- TABLE: LATEST ORDERS -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Latest Orders</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>주문번호</th>
                    <th>제목</th>
                    <th>출판사</th>
                    <th>주문일</th>
                  </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach var="lo" items="${latestOrder}">
                    <tr>
                      <td>${lo.orderNumber}</td>
                      <td>${lo.title}</td>
                      <td>${lo.publisher}</td>
                      <td>${lo.o_date}</td>
                    </tr>
                  </c:forEach>
                  
                  </tbody>
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
              <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a>
              <a href="javascript:void(0)" class="btn btn-sm btn-default btn-flat pull-right">View All Orders</a>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->

        <div class="col-md-4">
          <!-- Info Boxes Style 2 -->
          <div class="info-box bg-green">
            <span class="info-box-icon"><i class="ion ion-ios-heart-outline"></i></span><br>
            <div class="info-box-content">
              <span class="info-box-text">총재고수량</span>
              <span class="info-box-number">${inventory}</span>
            </div>
          </div>
          <div class="info-box bg-red">
            <span class="info-box-icon"><i class="ion ion-ios-cloud-download-outline"></i></span><br>
            <div class="info-box-content">
              <span class="info-box-text">재고부족품목</span>
              <span class="info-box-number">${emergencyBook}</span>
            </div>
          </div>
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span><br>
            <div class="info-box-content">
              <span class="info-box-text">직접수령</span>
              <span class="info-box-number">${directBook}</span>
            </div>
          </div>

          <!-- PRODUCT LIST -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">신간 도서</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <ul class="products-list product-list-in-box">
               
                <c:forEach var="nb" items="${newBook}">
	                <li class="item">
	                  <div class="product-img">
	                    <img src="${resources}/dist/img/default-50x50.gif" alt="Product Image">
	                  </div>
	                  <div class="product-info">
	                    <a href="javascript:void(0)" class="product-title">${nb.author}
	                      <span class="label label-warning pull-right">$ ${nb.price}</span></a>
	                        <span class="product-description">
	                          ${nb.title}
	                        </span>
	                  </div>
	                </li>
                </c:forEach>
                <!-- /.item -->
                
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
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

<!-- jQuery 2.2.3 -->
<script src="${resources}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${resources}/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${resources}/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${resources}/dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="${resources}/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${resources}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${resources}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${resources}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="${resources}/plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="${resources}/dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${resources}/dist/js/demo.js"></script>
<!-- google map -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBDDdQ0Ro5U-PJGssG36UOL45RzjQXCQy0"></script>
<script>
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
