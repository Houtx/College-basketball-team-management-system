<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/tag.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<!--[if lt IE 9]>
	<script type="text/javascript" src="resources/lib/html5.js"></script>
	<script type="text/javascript" src="resources/lib/respond.min.js"></script>
	<![endif]-->
	<link href="resources/css/H-ui/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="resources/css/H-ui/H-ui.admin.css" rel="stylesheet" type="text/css" />
	<link href="resources/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
	<link href="resources/skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
	<link href="resources/lib/toastr/toastr.min.css"  rel="stylesheet">
	<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script>
	<![endif]-->
	<title>CROSSOVER高校篮球管理系统</title>
</head>
<body>
<header class="Hui-header cl"> <a class="Hui-logo l" title="H-ui.admin v2.3" href="/">H-ui.admin</a> <a class="Hui-logo-m l" href="/" title="H-ui.admin">H-ui</a> <span class="Hui-subtitle l">V2.3</span>

	<ul class="Hui-userbar">
		<li>超级管理员</li>
		<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="#">个人信息</a></li>
				<li><a href="#">切换账户</a></li>
				<li><a href="#">退出</a></li>
			</ul>
		</li>
		<li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
		<li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="javascript:;" rows-val="default" title="默认（黑色）">默认（黑色）</a></li>
				<li><a href="javascript:;" rows-val="blue" title="蓝色">蓝色</a></li>
				<li><a href="javascript:;" rows-val="green" title="绿色">绿色</a></li>
				<li><a href="javascript:;" rows-val="red" title="红色">红色</a></li>
				<li><a href="javascript:;" rows-val="yellow" title="黄色">黄色</a></li>
				<li><a href="javascript:;" rows-val="orange" title="绿色">橙色</a></li>
			</ul>
		</li>
	</ul>
</header>

<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<div class="menu_dropdown bk_2">
		<c:forEach items="${menus}" var="menu">
			<c:if test="${menu.state==1}">
				<dl>
					<dt><i class="Hui-iconfont">${menu.icon}</i> ${menu.name}<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
					<dd>
						<ul>
							<c:forEach items="${menu.subMenus}" var="subMenu">
								<c:if test="${subMenu.state==1}">
									<li><a _href="${subMenu.url}?id=${subMenu.id}" rows-title="${subMenu.name}" href="javascript:void(0)">${subMenu.name}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</dd>
				</dl>
			</c:if>
		</c:forEach>

		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="/community/articleAddPage" rows-title="添加文章" href="javascript:void(0)">角色管理</a></li>
					<li><a _href="/school/schoolAddPage" rows-title="添加学校" href="javascript:void(0)">权限管理</a></li>
					<li><a _href="/school/schoolMngPage" rows-title="学校管理" href="javascript:void(0)">学校管理</a></li>
					<li><a _href="/bill/billAddPage" rows-title="添加账单" href="javascript:void(0)">添加账单</a></li>
					<li><a _href="/user/userAddPage" rows-title="添加人员" href="javascript:void(0)">添加人员</a></li>
					<li><a _href="/attendance/attendanceAddPage" rows-title="添加考勤" href="javascript:void(0)">添加考勤</a></li>

				</ul>
			</dd>
		</dl>
	</div>
</aside>
<!--
	侧栏收缩按钮
-->
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>

<section class="Hui-article-box">

	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" ></iframe>
		</div>
	</div>
</section>
</body>

<script type="text/javascript" src="resources/lib/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/H-ui/H-ui.js"></script>
<script type="text/javascript" src="resources/js/H-ui/H-ui.admin.js"></script>
</html>