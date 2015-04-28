<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咖啡日报 - 萃取行业热点，提炼每日精华！</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimal-ui" />
<meta name="apple-mobile-web-app-status-bar-style" content="yes" />

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
    <img src="<%=request.getContextPath()%>/assets/images/index-pic.png" style="max-width: 100%; height: auto;" />
  </div>
  <c:set var="lastCreateTimeTmp" />
  <div class="container" id="news-container">
    <div class="date-tip">
      <span>${firstCreateTime}</span>
    </div>
    <c:forEach items="${pager.news}" var="obj" varStatus="s">
      <c:if test="${s.index > 0 && (obj.createTime != lastCreateTimeTmp)}">
      <div class="date-tip">
        <span>${obj.createTime}</span>
      </div>
      </c:if>
      <div class="row carousel-row" id="row-new-pad">
        <div class="col-xs-12 col-xs-offset-0 slide-row">
          <div id="carousel-1" class="carousel slide slide-carousel" data-ride="carousel">
            <div class="carousel-inner">
              <div class="item active">
                <a href="${obj.url}" target="_blank"><img src="${obj.imgLink}"></a>
              </div>
            </div>
          </div>
          <div class="slide-content">
            <span style="font-size: 16px;"><a href="${obj.url}" target="_blank"><strong>${obj.title}</strong></a></span>
            <p style="color: #575252; font-size: 13px; margin-top: 5px;"><a href="${obj.url}" target="_blank">${obj.subTitle}</a></p>
          </div>
          <div class="slide-footer">
            <span class="pull-left">
              <!-- 
              <span>${obj.createTime}&nbsp;&nbsp;/&nbsp;&nbsp;阅读（<fmt:formatNumber value="${obj.truthDegree}" pattern="#" type="number"/>）
              </span>
               -->
            </span>
            <span class="pull-right" style="color: #A7A0A0; font-size: 12px;">${obj.domain}</span>
          </div>
        </div>
      </div>
      <c:set var="lastCreateTimeTmp" value="${obj.createTime}" />
    </c:forEach>
  </div>
  
  <div id="loading" style="text-align: center; width: 100%;"></div>
  
  <div id="load_more_div" class="container" style="text-align: center;">
    <div class="really-container">
      <button id="moretag" class="btn btn-block btn-lg" onclick="loadMore()" type="button">点击加载更多</button>
    </div>
  </div>
  <input type="hidden" id="nowCurrentPage" name="nowCurrentPage" value="2" />
</body>

<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>

<script type="text/javascript">
// 滚动条触发事件
window.onscroll = function(){
};

function loadMore () {
  var html = "<div class='row carousel-row'><div class='col-xs-12 col-xs-offset-0 slide-row'>"
  	+ "<div id='carousel-1' class='carousel slide slide-carousel' data-ride='carousel'>"
  	+ "<div class='carousel-inner'><div class='item active'><a href='url' target='_blank'>"
  	+ "<img src='imgLink'></a></div></div></div><div class='slide-content'>"
  	+ "<span style='color: #000000; font-size: 16px;'><a href='url' target='_blank'><strong>title</strong></a></span><br/>"
  	+ "<span style='color: #575252; font-size: 13px; margin-top: 5px;'><a href='url' target='_blank'>subTitle</a></span></div>"
  	+ "<div class='slide-footer'><span class='pull-left'><span></span></span>"
  	+ "<span class='pull-right' style='color: #A7A0A0; font-size: 12px;'>domain"
  	+ "</span></div></div></div>";
  	
  var url = "<%=request.getContextPath()%>/index/more";
  
  var nowCurrentPage = $("#nowCurrentPage").val();
  
  $.ajax({
  	url : url, // 跳转到 action    
  	data : {currentPage : nowCurrentPage},
  	type : 'post',
  	beforeSend:function(){
  		$("#loading").html("<img style='margin: 5px 0px 10px 0px;' src='<%=request.getContextPath()%>/assets/images/loading_line.gif' />");
  		$(".really-container").css("display", "none");
  	},
  	cache : false,
  	dataType : 'json',
  	success : function(data) {
  		$("#loading").empty();
  		
  		$("#nowCurrentPage").val(data.currentPage + 1);
		
		var objs = data.news;
		$.each(objs, function(i, obj){
			var show = html.replace("imgLink", obj.imgLink)
						   .replace("title", obj.title)
						   .replace("subTitle", obj.subTitle)
						   .replace("url", obj.url)
						   .replace("url", obj.url)
						   .replace("url", obj.url)
						   .replace("domain", obj.domain)
						   .replace("truthDegree", obj.truthDegree);
			
			if (i > 0) {
				// 获取上一个日报对象
    			var lastObj = objs[i-1];
				// 上一个日报对象的发布日期
    			var lastCreateTime = lastObj.createTime;
				// 当前日报的发布日期
    			var currentCreateTime = obj.createTime;
				// 如果不一样的话, 那么显示日期的分隔
    			if (lastCreateTime != currentCreateTime) {
    				// 
    				var timeLine = "<div class='date-tip'><span>"+obj.createTime+"</span></div>";
    				$("#news-container").append(timeLine);
    			}
			}
			
			$("#news-container").append(show);
		});
		
		if (data.lastPage <= (data.currentPage)) {
			$(".really-container").css("display", "block");
    		$(".really-container").empty();
    		$(".really-container").html("<div class='alert alert-warning' role='alert'>已经加载全部</div>");
		} else {
			$(".really-container").css("display", "block");
		}
  	},
  	error : function() {
  		alert("异常！");
  	}
  });
}
</script>

</html>
