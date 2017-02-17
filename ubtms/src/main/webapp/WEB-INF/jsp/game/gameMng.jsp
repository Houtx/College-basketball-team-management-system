<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp" %>
<%@ include file="../common/basePath.jsp"%>

<!DOCTYPE html>

<html>

<head>
    <%@ include file="../common/common_head.jsp"%>
    <title>赛程管理</title>
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet" />
    <link href="resources/css/mng.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;赛程管理
            </div>
        </div>
    </div>

    <div class="row mngMainBody">
        <div class="panel panel-default mngSearch">
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="searchGameName">校名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="searchGameName" />
                        </div>

                        <label class="control-label col-sm-1" for="searchGameName">日期</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="searchGameDate" />
                        </div>
                        
                        <div class="col-sm-4" style="text-align:left;">
                            <input type="button" style="margin-left:50px"  class="btn btn-primary" onclick="gameMng.serachClick()" value="查询"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div>
            <div id="toolbar" class="btn-group">
                <input id="gameEditP" type="hidden" value="${gameEditP}" />
                <c:if test="${gameAddP==1}">
                    <button id="btn_add" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                    </button>
                </c:if>
                <c:if test="${gameDelP==1}">
                    <button id="btn_delete" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                    </button>
                </c:if>
                <c:if test="${gameEditP==1}">
                    <button id="btn_disable" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>禁用
                    </button>
                    <button id="btn_enable" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>启用
                    </button>
                </c:if>
            </div>

            <table id="tb_games"></table>
        </div>
    </div>
</div>

</body>

<%@ include file="../common/common_footer.jsp"%>
<%@ include file="../common/bs-table.jsp"%>
<script src="resources/js/game/gameMng.js"></script>

</html>