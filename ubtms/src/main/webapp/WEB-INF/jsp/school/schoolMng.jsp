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
    <%@ include file="../common/head.jsp"%>
    <title>学校管理</title>
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
    <link href="resources/css/mng.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;学校管理
            </div>
        </div>
    </div>

    <div class="row mngMainBody">
        <div class="panel panel-default mngSearch">
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

            <table id="tb_schools"></table>
        </div>
    </div>
</div>

</body>

<%@ include file="../common/footer.jsp"%>
<%@ include file="../common/bs-table.jsp"%>
<script src="resources/js/school/schoolMng.js"></script>

</html>