<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
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
    <meta name="viewport" content="width=device-width" />
    <title>BootStrap Table使用</title>
    <meta charset="utf-8">

    <!--引入图标-->
    <link href="resources/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="resources/lib/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
    <link href="resources/css/style.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/mng.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="container-fluid">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;学校管理&nbsp;&nbsp;>&nbsp;&nbsp;添加学校
            </div>
        </div>
    </div>

    <div class="row mngMainBody">
        <div class="panel panel-default mngSearch">
            <div class="panel-heading">查询条件</div>
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="txt_search_departmentname">校名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="txt_search_departmentname">
                        </div>
                        <label class="control-label col-sm-1" for="stateSelect">状态</label>

                        <div class="col-sm-3">
                            <select id="stateSelect" class="form-control">
                                <option>全部</option>
                                <option>正常</option>
                                <option>禁用</option>
                            </select>
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div>

            <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>禁用
                </button>
            </div>

            <table id="tb_departments"></table>
        </div>
    </div>
</div>

</body>

<script src="resources/lib/jquery.min.js"></script>
<script src="resources/lib/bootstrap/bootstrap.min.js"></script>
<script src="resources/lib/bootstrap-table/bootstrap-table.js"></script>
<script src="resources/lib/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>

<script src="resources/js/school/schoolMng.js"></script>

</html>