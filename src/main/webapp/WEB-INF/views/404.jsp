<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>页面不存在哦 - 咖啡日报</title>
<meta charset="utf-8">
<!-- 
<link href="<%=request.getContextPath()%>/assets/images/favicon.png" type="image/x-icon" rel="shortcut icon"/>
<link href="<%=request.getContextPath()%>/assets/images/favicon.png" type="image/x-icon" rel="icon"/>
 -->
<link href="<%=request.getContextPath()%>/assets/css/bootstrap.css" rel="stylesheet">
</head>
<style type="text/css">
		.container {
			margin: 150px auto auto auto;
		}
		.panel-body {
			padding: 10px;
		}
		.container {
			max-width: 553px;
		}
		.panel-body .btn:not(.btn-block) { width:120px;margin-bottom:10px; }
	</style>
<body>
	<div class="container">
	    <div class="row">
	        <div>
	            <div class="panel panel-warning">
	                <div class="panel-heading">
	                    <h3 class="panel-title">咖啡日报 - 萃取行业热点，提炼每日精华！</h3>
	                </div>
	                
	                <div class="panel-body">
	                    <div class="row">
	                        <div class="col-md-4">
	                        	<img alt="" src="<%=request.getContextPath()%>/assets/images/sorry.jpg" width="100px" height="160px">
	                        </div>
	                        <div class="col-md-8">
                                <p>&nbsp;</p>
	                        	<h4><strong>404错误提示：</strong></h4>
	                        	<h4>您访问的页面不存在哦！</h4>
                                <p>&nbsp;</p>
	                        	<h5>TIP：请您不要进行非正常操作呦！</h5>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>
