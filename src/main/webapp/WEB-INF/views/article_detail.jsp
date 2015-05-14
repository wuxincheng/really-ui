<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[咖啡日报]${news.title}</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimal-ui" />
<meta name="apple-mobile-web-app-status-bar-style" content="yes" />
<meta name="keywords" content="[咖啡日报]${news.title}">
<meta name="Description" content="[咖啡日报]${news.title}">

<link href="<%=request.getContextPath()%>/assets/images/favicon.png" type="image/x-icon" rel="shortcut icon"/>
<link href="<%=request.getContextPath()%>/assets/images/favicon.png" type="image/x-icon" rel="icon"/>

<link href="<%=request.getContextPath()%>/assets/carouselrows/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/carouselrows/carouselrows.css" type="text/css" rel="stylesheet" />
</head>
<style type="text/css">
/** ************************ Google Chrome Scrollbar CSS Style Line ************************ */
/** 滚动条宽和高 */
::-webkit-scrollbar { width: 0px; height: 0px;}
/** 滚动条样式底部内层样式 */
::-webkit-scrollbar-track-piece { background-color: #E0E0E0;}
/** 滚动条滑块样式 */ /** 滚动条滑块边角–导圆角 */
::-webkit-scrollbar-thumb{height: 50px; background-color: #BEBEBE; -webkit-border-radius: 0px;}
/** ************************ Google Chrome Scrollbar CSS Style Line ************************ */

.label {
  display: inline;
  padding: .5em .8em .5em;
  font-size: 75%;
  font-weight: bold;
  line-height: 1;
  color: #fff;
  text-align: center;
  white-space: nowrap;
  vertical-align: baseline;
  border-radius: .25em;
}
a {
  color: #fff;
  text-decoration: none;
}
</style>
<body>
  <!-- navbar-fixed-top start -->
  <div class="navbar-fixed-top" style="background-color: #F8F3F3; box-shadow: 0 0 20px rgba(0,0,0,0.2);">
    <!-- container start -->
    <div class="container" style="padding: 5px 20px; border-bottom: 0px solid #CAC3C3;">
      <!-- pull-left start -->
      <div class="pull-left">
        <img src="<%=request.getContextPath()%>/assets/images/top-show.jpg" style="width: 108px; height: 34px;" />
      </div>
      <!-- pull-left end -->
      
      <!-- pull-right start -->
      <div class="pull-right">
        <div style="margin-top: 7px;">
          <a href="#order-box">
            <button class="btn btn-warning btn-block btn-xs" type="button">
            &nbsp;&nbsp;&nbsp;关&nbsp;注&nbsp;&nbsp;&nbsp;</button>
          </a>
        </div>
      </div>
      <!-- pull-right end -->
      
    </div>
    <!-- container end -->
    
    <!-- 
    <form class="form-inline">
      <div class="form-group">
        <label for="exampleInputName2"></label>
        <img src="<%=request.getContextPath()%>/assets/images/logo.png" style="width: 100px; height: 92px;" />
      </div>
      <div class="form-group">
        <label for="exampleInputEmail2"><h4><b>&nbsp;</b></h4></label><br>
        <span><h5>&nbsp;</h5></span>
      </div>
      <div class="form-group">
        <label for="exampleInputEmail2"><h3><b>咖啡日报</b></h3></label><br>
        <span><h4>每天给你一杯对味的资讯</h4></span>
      </div>
    </form>
     -->
    
  </div>
  <!-- navbar-fixed-top end -->
  
  <div>
    <iframe id="main" name="main" src="${news.url}" style="width:100%; height: 500px; margin-top: 50px;"
      frameborder="0" scrolling="auto" marginheight="0" ></iframe> 
  </div>
  
  <div class="container" style="padding-top: 10px; border-top: 0px solid #F8F3F3;">
    <div class="order-panel">
      <span style="font-size: 16px;"><strong>订阅咖啡日报的方法：</strong></span><br>
      <span style="font-size: 14px;">
      1、按住二维码3秒钟，选择识别二维码，关注公众号；<br/>
      2、直接在公众号搜索：咖啡日报（kafeiribao）;<br>
      3、直接访问&nbsp;www.kaffeedaily.com</span>
    </div>
    
    <div id="order-box" name="order-box" style="width: 100%; text-align: center; margin: 0px 0px 15px 0px;">
      <a href="weixin://contacts/profile/kafeiribao">
        <img src="<%=request.getContextPath()%>/assets/images/qrcode/cafei_258.jpg" style="max-width: 100%; height: auto;" />
      </a>
    </div>
  </div>
</body>

<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>

<script type="text/javascript">
$("#main").load(function(){  
    var browerHeight = $(window).height();
    $(this).height(browerHeight);
});
</script>
</html>
