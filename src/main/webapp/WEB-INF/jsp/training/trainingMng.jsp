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
    <title>训练计划</title>
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
    <link href="resources/css/mng.css" rel="stylesheet" type="text/css"/>

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62b;</i>&nbsp;训练计划
            </div>
        </div>
    </div>

    <div class="row mngMainBody">
        <div class="panel panel-default mngSearch">
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <c:if test="${loginUser == 'admin'}">
                            <label class="control-label col-sm-1" for="searchSchoolName">学校</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="searchSchoolName" name="searchSchoolName"/>
                            </div>
                        </c:if>
                        <c:if test="${loginUser != 'admin'}">
                            <div>
                                <input type="text" class="form-control" style="display:none"
                                       value="${loginSchool.schName}" id="searchSchoolName" name="searchSchoolName"/>
                            </div>
                        </c:if>
                        <label class="control-label col-sm-1" for="searchTitle">计划名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="searchTitle" id="searchTitle"/>
                        </div>
                        <div class="col-sm-4" style="text-align:left;">
                            <input type="button" style="margin-left:50px" class="btn btn-primary"
                                   onclick="trainingMng.serachClick()" value="查询"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div>
            <div id="toolbar" class="btn-group">
                <input id="trainingEditP" type="hidden" value="${trainingEditP}"/>
                <c:if test="${trainingAddP==1}">
                    <button id="btn_add" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                    </button>
                </c:if>
                <c:if test="${trainingDelP==1}">
                    <button id="btn_delete" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                    </button>
                </c:if>
            </div>

            <table id="tb_trainings"></table>
        </div>
    </div>
</div>

</body>

<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/bs-table.jsp" %>
<script src="resources/js/training/trainingMng.js"></script>

</html>