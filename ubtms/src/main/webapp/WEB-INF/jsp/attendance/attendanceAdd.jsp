<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/26
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/basePath.jsp"%>

<!DOCTYPE html>

<html>

<head>
    <%@ include file="../common/common_head.jsp"%>
    <title>添加考勤</title>
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
    <link href="resources/css/detail.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;考勤管理&nbsp;&nbsp;>&nbsp;&nbsp;添加考勤
            </div>
        </div>
    </div>



    <div class="row detailRow">
        <div class="col-xs-8 col-md-6 myColCenterBlock">
            <%--
                    添加时间选择
            --%>

            <div>
                <table id="tb_attendanceAdd"></table>
            </div>

            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-10">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input type="button" style="width: 100px;" class="btn btn-primary" value="保存" />
                        <input type="button" style="width: 100px;" class="btn btn-primary" value="返回" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<%@ include file="../common/common_footer.jsp"%>
<%@ include file="../common/bs-table.jsp"%>
<script src="resources/js/attendance/attendanceAdd.js"></script>

</html>