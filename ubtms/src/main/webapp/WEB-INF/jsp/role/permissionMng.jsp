<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp" %>
<%@ include file="../common/basePath.jsp" %>

<!DOCTYPE html>

<html>

<head>
    <%@ include file="../common/common_head.jsp" %>
    <title>权限管理</title>
    <link href="resources/lib/bootstrap-treeview/bootstrap-treeview.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/css/mng.css" rel="stylesheet" type="text/css"/>

</head>

<body>
<div class="container-fluid">
    <input type="hidden" id="roleId" value="${roleId}">
    <input type="hidden" id="type" value="${type}">
    <div id="treeview-checkable"></div>
    <input type="button" class="btn btn-primary" onclick="permissionMng.savePerssion()" value="确定" />
    <input type="button" class="btn btn-primary" value="返回" />
</div>

</body>

<%@ include file="../common/common_footer.jsp" %>
<script src="resources/lib/bootstrap-treeview/bootstrap-treeview.min.js"></script>
<script src="resources/js/role/permissionMng.js"></script>
</html>