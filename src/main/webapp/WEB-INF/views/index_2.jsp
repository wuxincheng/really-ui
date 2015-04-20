<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <base href="/demo/" />
    <title>真象日报 - 基金行业最新资讯</title>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimal-ui" />
    <meta name="apple-mobile-web-app-status-bar-style" content="yes" />
    
    <link href="<%=request.getContextPath()%>/assets/images/logo.png" type="image/x-icon" rel="shortcut icon" />
    <link href="<%=request.getContextPath()%>/assets/images/logo.png" type="image/x-icon" rel="icon" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/angular/css/mobile-angular-ui-hover.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/angular/css/mobile-angular-ui-base.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/angular/css/mobile-angular-ui-desktop.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/angular/css/demo.css" />
    <script src="<%=request.getContextPath()%>/assets/angular/js/angular.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/angular/js/angular-route.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/angular/js/mobile-angular-ui.min.js"></script>
    <!-- Required to use $swipe, $drag and Translate services -->
    <script src="<%=request.getContextPath()%>/assets/angular/js/mobile-angular-ui.gestures.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/angular/js/demo.js"></script>
  </head>

  <body 
    ng-app="MobileAngularUiExamples" 
    ng-controller="MainController"
    >

    <!-- Sidebars -->
    <div ng-include="'sidebar.html'" 
            ui-track-as-search-param='true'
            class="sidebar sidebar-left"></div>

    <div ng-include="'sidebarRight.html'" 
            class="sidebar sidebar-right"></div>

    <div class="app" ng-swipe-right='Ui.turnOn("uiSidebarLeft")' ng-swipe-left='Ui.turnOff("uiSidebarLeft")'>

      <!-- Navbars -->

      <div class="navbar navbar-app navbar-absolute-top">
        <div class="navbar-brand navbar-brand-center" ui-yield-to="title">
          <span>首页</span>
        </div>
        <div class="btn-group pull-left">
          <div ui-toggle="uiSidebarLeft" class="btn sidebar-toggle">
            <i class="fa fa-bars"></i> Menu
          </div>
        </div>
        <div class="btn-group pull-right" ui-yield-to="navbarAction">
          <div ui-toggle="uiSidebarRight" class="btn">
            <i class="fa fa-comment"></i> Chat
          </div>
        </div>
      </div>

      <div class="navbar navbar-app navbar-absolute-bottom">
        <div class="btn-group justified">
          <a href="http://mobileangularui.com/" class="btn btn-navbar"><i class="fa fa-home fa-navbar"></i> Docs</a>
          <a href="https://github.com/mcasimir/mobile-angular-ui" class="btn btn-navbar"><i class="fa fa-github fa-navbar"></i> Sources</a>
          <a href="https://github.com/mcasimir/mobile-angular-ui/issues" class="btn btn-navbar"><i class="fa fa-exclamation-circle fa-navbar"></i> Issues</a>
        </div>
      </div>

      <!-- App Body -->
      <div class="app-body" ng-class="{loading: loading}">
        <div ng-show="loading" class="app-content-loading">
          <i class="fa fa-spinner fa-spin loading-spinner"></i>
        </div>
        <div class="app-content">
          <ng-view></ng-view>
        </div>
      </div>

    </div><!-- ~ .app -->

    <div ui-yield-to="modals"></div>

    <script>
       (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
       (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
       m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
       })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

       ga('create', 'UA-48036416-1', 'mobileangularui.com');
       ga('send', 'pageview');
     </script>
  </body>
</html>
