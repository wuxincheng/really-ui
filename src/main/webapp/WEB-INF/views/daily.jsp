<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咖啡日报 - 每天给你一杯对味的资讯！</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- 禁止移动端浏览器缩放 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-status-bar-style" content="yes" />

<link href="<%=request.getContextPath()%>/assets/images/favicon.png" type="image/x-icon" rel="shortcut icon"/>
<link href="<%=request.getContextPath()%>/assets/images/favicon.png" type="image/x-icon" rel="icon"/>

<link href="<%=request.getContextPath()%>/assets/carouselrows/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/carouselrows/carouselrows.css" type="text/css" rel="stylesheet" />
</head>
<style type="text/css">
/** ************************ Google Chrome Scrollbar CSS Style Line ************************ */
/** 滚动条宽和高 */
::-webkit-scrollbar { width: 15px; height: 15px;}
/** 滚动条样式底部内层样式 */
::-webkit-scrollbar-track-piece { background-color: #E0E0E0;}
/** 滚动条滑块样式 */ /** 滚动条滑块边角–导圆角 */
::-webkit-scrollbar-thumb{height: 50px; background-color: #BEBEBE; -webkit-border-radius: 0px;}
/** ************************ Google Chrome Scrollbar CSS Style Line ************************ */
</style>
<body>
  <div class="top-tip-line">
  </div>
  
  <!-- 图片显示 -->
  <div style="width: 100%; text-align: center;">
    <img src="<%=request.getContextPath()%>/assets/images/index-change0.png" style="max-width: 100%; height: auto;" />
  </div>
  <c:set var="lastCreateTimeTmp" />
  <div class="container" id="news-container">
    <div class="date-tip">
      <span>${showDate}</span>
    </div>
    
    <c:choose>
      <c:when test="${not empty news}">
        <c:forEach items="${news}" var="obj" varStatus="s">
          <div class="row carousel-row" id="row-new-pad">
            <div class="col-xs-12 col-xs-offset-0 slide-row">
              <div id="carousel-1" class="carousel slide slide-carousel" data-ride="carousel">
                <div class="carousel-inner">
                  <div class="item active">
                    <a href="<%=request.getContextPath()%>/index/detail?id=${obj.id}" target="_blank">
                      <c:choose>
                        <c:when test="${'logo' eq obj.imgLocPath || '' == obj.imgLocPath || null == obj.imgLocPath}">
                          <img src="<%=request.getContextPath()%>/assets/images/coffee-logo-fetch.jpg">
                        </c:when>
                        <c:otherwise>
                          <img src="http://www.kaffeedaily.com/really-manage/imgbase/res/${obj.settleDate}/K-${obj.id}.jpeg">
                        </c:otherwise>
                      </c:choose>
                    </a>
                  </div>
                </div>
              </div>
              <div class="slide-content">
                <span style="font-size: 16px;">
                  <a href="<%=request.getContextPath()%>/index/detail?id=${obj.id}" target="_blank">
                  <strong>${obj.title}</strong></a></span>
              </div>
              <div class="slide-footer">
                <span class="pull-left">
                </span>
                <span class="pull-right" style="color: #A7A0A0; font-size: 12px;">${obj.domain}</span>
              </div>
            </div>
          </div>
          <c:set var="lastCreateTimeTmp" value="${obj.createTime}" />
        </c:forEach>
        <div class="really-container">
          <div class="pull-left">
            <c:if test="${not empty showBefore}">
              <a href="<%=request.getContextPath()%>/daily/show?dailyDate=${dailyBefore}" target="_blank">
                <button class="btn btn-block btn-lg btn-warning" type="button">&nbsp;&nbsp;${showBefore}&nbsp;&nbsp;</button>
              </a>
            </c:if>
          </div>
          <div class="pull-right">
            <c:if test="${not empty showAfter}">
              <a href="<%=request.getContextPath()%>/daily/show?dailyDate=${dailyAfter}" target="_blank">
                <button class="btn btn-block btn-lg btn-warning" type="button">&nbsp;&nbsp;${showAfter}&nbsp;&nbsp;</button>
              </a>
            </c:if>
          </div>
        </div>
      </c:when>
      <c:otherwise>
        <div class="really-container">
          <button class="btn btn-block btn-lg btn-info" type="button">当日还没有日报呢！</button>
        </div>
      </c:otherwise>
    </c:choose>
  </div>
  
  <input type="hidden" id="nowCurrentPage" name="nowCurrentPage" value="2" />
  <p>&nbsp;</p>
</body>

<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>

<script type="text/javascript">
</script>

<!-- 百度统计 -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?dd71b165a006d5e6f7e464b857fca722";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</html>
