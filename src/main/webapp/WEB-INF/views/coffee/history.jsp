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
<link href="<%=request.getContextPath()%>/assets/carouselrows/carouselrows.css" type="text/css" rel="stylesheet" />
</head>

<body>
  <div style="margin: 0px 0px 15px 0px; border-top: 2px solid #603811;"></div>
   
  <div class="container" id="news-container">
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
  </div>
  
  <div id="loading" style="text-align: center; width: 100%;"></div>
  
  <div id="load_more_div" class="container" style="text-align: center;">
    <div class="really-container">
       <ul class="pager">
        <li
          <c:if test="${'1' eq pager.currentPage}">class="disabled"</c:if>>
          <a
          <c:if test="${pager.currentPage > 1}">href="<%=request.getContextPath()%>/manage/news/list?currentPage=1"</c:if>>首页</a>
        </li>

        <li
          <c:if test="${'1' eq pager.currentPage}">class="disabled"</c:if>>
          <a
          <c:if test="${pager.currentPage > 1}">href="<%=request.getContextPath()%>/manage/news/list?currentPage=${pager.currentPage-1}"</c:if>>上一页</a>
        </li>

        <li
          <c:if test="${pager.lastPage eq pager.currentPage}">class="disabled"</c:if>>
          <a
          <c:if test="${pager.currentPage < pager.lastPage}">href="<%=request.getContextPath()%>/manage/news/list?currentPage=${pager.currentPage+1}"</c:if>>下一页</a>
        </li>

        <li
          <c:if test="${pager.lastPage eq pager.currentPage}">class="disabled"</c:if>>
          <a
          <c:if test="${pager.currentPage < pager.lastPage}">href="<%=request.getContextPath()%>/manage/news/list?currentPage=${pager.lastPage}"</c:if>>尾页</a>
        </li>

        <li class="">&nbsp;</li>
        <li class=""><strong>${pager.currentPage}/${pager.lastPage}</strong></li>
        <li class="">&nbsp;</li>
        <li class="disabled">共<strong>${pager.totalCount}</strong>条
        </li>
      </ul>
    </div>
  </div>
  <input type="hidden" id="nowCurrentPage" name="nowCurrentPage" value="2" />
</body>

<script src="<%=request.getContextPath()%>/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap.js"></script>

</html>
