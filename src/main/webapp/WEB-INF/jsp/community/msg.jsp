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
    <title>消息</title>
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
    <link href="resources/css/mng.css" rel="stylesheet" type="text/css"/>

</head>

<body>
<div class="container-fluid">
    <input type="hidden" id="userId" value="${userId}">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe6c5;</i>&nbsp;消息
            </div>
        </div>
    </div>

    <div class="row mngMainBody">
        <div>
            <table id="tb_msg"></table>
        </div>
    </div>
</div>

</body>

<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/bs-table.jsp" %>
<script src="resources/js/community/msg.js"></script>

</html>