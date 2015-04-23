<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咖啡日报 - 基金行业最新资讯</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimal-ui" />
<meta name="apple-mobile-web-app-status-bar-style" content="yes" />

<link href="<%=request.getContextPath()%>/assets/carouselrows/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/carouselrows/coffee.css" type="text/css" rel="stylesheet" />
</head>

<body>
  <!-- 
  <div class="navbar navbar-default" role="navigation">
    <div class="container" style="text-align: center;">
      <div class="navbar-header" style="padding: 10px 0px 0px 0px;">
        <span style="color: #FFFFFF; font-size: 20px; padding: 15px 0;">咖啡日报</span>
      </div>
    </div>
  </div>
   -->
  
  <div style="margin: 0px 0px 15px 0px; border-top: 2px solid #603811;"></div>
   
  <div class="container" id="news-container">
    <c:choose>
    <c:when test="${not empty pager.news}">
    <c:forEach items="${pager.news}" var="obj" varStatus="s">
      <div class="row carousel-row" id="row${s.index+1}">
        <div class="col-xs-12 col-xs-offset-0 slide-row">
          <div id="carousel-1" class="carousel slide slide-carousel" data-ride="carousel">
            <div class="carousel-inner">
              <div class="item active">
                <a href="${obj.url}" target="_blank"><img src="${obj.imgLink}"></a>
              </div>
            </div>
          </div>
          <div class="slide-content">
            <span style="color: #000000; font-size: 14px;"><a href="${obj.url}" target="_blank"><strong>${obj.title}</strong></a></span>
            <p style="color: #837E7E; margin-top: 5px;">${obj.subTitle}</p>
          </div>
          <div class="slide-footer">
            <span class="pull-left">
              <span>来源：${obj.domain}</span>
            </span>
            <span class="pull-right">
              <i class="fa fa-fw fa-eye"></i> <fmt:formatNumber value="${obj.truthDegree}" pattern="#" type="number"/>
            </span>
          </div>
        </div>
      </div>
    </c:forEach>
    </c:when>
    <c:otherwise>
      <div class="alert alert-warning" role="alert">
      	<a href="<%=request.getContextPath()%>/coffee/history/index" target="_blank">当天已全部阅读，点击查看历史</a>
      </div>
    </c:otherwise>
    </c:choose>
    
  </div>
  
  <div id="loading" style="text-align: center; width: 100%;"></div>
  
  <div id="load_more_div" class="container" style="text-align: center;">
    <div class="really-container">
      <button id="moretag" class="btn btn-block btn-lg btn-warning" onclick="loadMore()" type="button">点击加载更多</button>
    </div>
  </div>
  <input type="hidden" id="nowCurrentPage" name="nowCurrentPage" value="2" />
</body>

<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>

<script type="text/javascript">
function loadMore () {
  var html = "<div class='row carousel-row'><div class='col-xs-12 col-xs-offset-0 slide-row'>"
  	+ "<div id='carousel-1' class='carousel slide slide-carousel' data-ride='carousel'>"
  	+ "<div class='carousel-inner'><div class='item active'><a href='url' target='_blank'>"
  	+ "<img src='imgLink'></a></div></div></div><div class='slide-content'>"
  	+ "<span style='color: #000000; font-size: 14px;'><a href='url' target='_blank'><strong>title</strong></a></span>"
  	+ "<p style='color: #837E7E; margin-top: 5px;'>subTitle</p></div><div class='slide-footer'>"
  	+ "<span class='pull-left'><span>来源：domain</span></span><span class='pull-right'>"
  	+ "<i class='fa fa-fw fa-eye'></i> truthDegree"
  	+ "</span></div></div></div>";
  	
  var url = "<%=request.getContextPath()%>/coffee/current/more";
  
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
						   .replace("domain", obj.domain)
						   .replace("truthDegree", obj.truthDegree);
			$("#news-container").append(show);
		});
		
		if (data.lastPage <= (data.currentPage)) {
			$(".really-container").css("display", "block");
    		$(".really-container").empty();
    		$(".really-container").html("<div class='alert alert-warning' role='alert'>"+
    				"<a href='<%=request.getContextPath()%>/coffee/history/index' target='_blank'>当天已全部阅读，点击查看历史</a></div>");
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
