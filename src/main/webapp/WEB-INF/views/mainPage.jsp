<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  body {
      position: relative;
  }
  .affix {
      top: 20px;
  }
  div.col-sm-9 div {
      height: 250px;
      font-size: 28px;
  }
  #section11 {color: #000000; background-color: #fff;}
  #section12 {color: #000000; background-color: #fff;}
  #section2 {color: #000000; background-color: #fff;}
  #section3 {color: #000000; background-color: #fff;}
  
  @media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section41, #section42  {
        margin-left: 150px;
    }
  }
  </style>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="15">

<div class="container-fluid" style="background-color:#000000;color:#fff;height:220px;">
  <h1>Jang Jun Books!</h1>
  <h1>서점 로고와 제목</h1>
</div>
<br>

<div class="container">
  <div class="row">
    <nav class="col-sm-3" id="myScrollspy">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="205">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">일반 책<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#section11">국내도서</a></li>
            <li><a href="#section12">외국도서</a></li>
          </ul>
        </li>
        <li><a href="#section2">E-Book</a></li>
        <li><a href="#section3">중고</a></li>
      </ul>
    </nav>
    <div class="col-sm-9">
      <div id="section11">    
        <h1>일반 - 국내도서</h1>
        <p>내용 아직 안만들었음.</p>
      </div>
      <div id="section12"> 
        <h1>일반 - 외국도서</h1>
        <p>내용 아직 안만들었음.</p>
      </div>        
      <div id="section2">
        <h1>E-Book</h1>
        <p>내용 아직 안만들었음.</p>
      </div>
      <div id="section3">
        <h1>중고</h1>
        <p>내용 아직 안만들었음.</p>
      </div>
    </div>
  </div>
</div>

</body>
</html>
