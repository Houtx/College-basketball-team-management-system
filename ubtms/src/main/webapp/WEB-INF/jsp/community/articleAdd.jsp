<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2016/12/17
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">

    <title>添加公告</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" rel="stylesheet">
    <!-- 引入 Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!--引入wangEditor-->
    <link rel="stylesheet" type="text/css" href="resources/css/wangEditor.min.css">
    <!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>


<body>
<h1>Hello, world!</h1>

<div>
    <input type="text">
    <button style="float: right">发表</button>

</div>
<div id="div1">
    <p>请输入内容...</p>
</div>

</body>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/script/wangEditor.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
    var editor = new wangEditor('div1');

/*     仅仅想移除某几个菜单，例如想移除『插入代码』和『全屏』菜单：
     其中的 wangEditor.config.menus 可获取默认情况下的菜单配置*/
     editor.config.menus = $.map(wangEditor.config.menus, function(item, key) {
         if (item === 'source') {
             return null;
         }
         if (item === 'video') {
             return null;
         }
         if (item === 'location') {
             return null;
         }
         if (item === 'insertcode') {
             return null;
         }
         return item;
     });

    editor.create();
</script>
</html>
