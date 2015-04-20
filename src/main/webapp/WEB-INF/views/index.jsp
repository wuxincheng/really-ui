<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>真象日报 - 基金行业最新资讯</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport"
  content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimal-ui" />
<meta name="apple-mobile-web-app-status-bar-style" content="yes" />

<link href="<%=request.getContextPath()%>/assets/img/favicon.ico"
  type="image/x-icon" rel="icon" />
<link href="<%=request.getContextPath()%>/assets/img/favicon.ico"
  type="image/x-icon" rel="shortcut icon" />
<link href="<%=request.getContextPath()%>/assets/css/mobile.css"
  rel="stylesheet">

<link rel="stylesheet"
  href="<%=request.getContextPath()%>/assets/css/bootstrap.css"
  type="text/css"></link>

</head>

<body>
	<div id="zx-carousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img
					src="http://wuxincheng.com.cn/wuxincheng-manage/userfiles/images/2014/201406/20140622/ping/WUXC-PING-01.jpg"
					alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<p>Glyphicon buttons on the left and right might not
							load/display properly due to web browser security rules.</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img
					src="http://wuxincheng.com.cn/wuxincheng-manage/userfiles/images/2014/201406/20140622/ping/WUXC-PING-01.jpg"
					alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
			<div class="item">
				<img
					src="http://wuxincheng.com.cn/wuxincheng-manage/userfiles/images/2014/201406/20140622/ping/WUXC-PING-01.jpg"
					alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

  <div class="container">

    <c:choose>
      <c:when test="${not empty infos}">
        <c:forEach items="${infos}" var="infos" varStatus="s">
          <div class="list-item">
            <div class="row">
              <div class="col-md-3">
                <div class="list-img">
                  <img class="img-thumbnail"
                    src="http://wuxincheng.com.cn/wuxincheng-manage/userfiles/images/2014/201408/20140807/MD-funny/like-mother-like-daughter-funny-photography-01.jpg">
                </div>
              </div>
              <div class="col-md-9">
                <div class="list-title">
                  <span>生活中各种离不开的日本发明，抵制日货没那么容易</span>
                </div>
                <div class="list-sub">
                  <div class="pull-left">
                    <span class="glyphicon glyphicon-bookmark"
                      aria-hidden="true"></span> <span>79</span>
                  </div>
                  <div class="pull-right">
                    <span>中国商业财政</span>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </c:forEach>
      </c:when>
      <c:otherwise>
        <div class="ya2dan-container">
          <div class="alert alert-warning">
            <strong>提示：</strong>系统没有查询到博客信息
          </div>
        </div>
      </c:otherwise>
    </c:choose>
  </div>

</body>
<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>
</html>
