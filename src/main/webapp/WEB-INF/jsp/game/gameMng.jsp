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
    <title>赛程管理</title>
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
    <link href="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="resources/css/mng.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62b;</i>&nbsp;赛程管理
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
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="searchSchoolName"/>
                            </div>
                        </c:if>
                        <c:if test="${loginUser != 'admin'}">
                            <label class="control-label col-sm-1" style="display: none"
                                   for="searchSchoolName">学校</label>
                            <div class="col-sm-3" style="display: none">
                                <input type="text" value="${loginSchool.schName}" class="form-control"
                                       id="searchSchoolName"/>
                            </div>
                        </c:if>
                        <label class="control-label col-sm-1" for="searchRival">对手</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="searchRival"/>
                        </div>
                        <label class="control-label col-sm-1" for="startTime">时间</label>
                        <div class="col-sm-2">
                            <div class='input-group date' id="datetimepickerDiv">
                                <input id="startTime" name="startTime" type='text' class="form-control"/>
                                <span id="datetimepicker" class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                        <label class="control-label col-sm-1"></label>
                        <div class="col-sm-1">
                            <input type="button" class="btn btn-primary" onclick="gameMng.serachClick()" value="查询"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div>
            <div id="toolbar" class="btn-group">
                <input id="gameEditP" type="hidden" value="${gameEditP}"/>
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

                <c:if test="${gameAddP==1}">
                    <form style="display:inline-block" target="ajaxUpload" class="form-horizontal myForm" role="form"
                          id="importForm"
                          action="/game/uploadFile" method="post" enctype="multipart/form-data">
                        <input type="file" id="file" name="file" style="display:none"/>
                        <button id="btn_import" type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-upload" aria-hidden="true"></span>导入
                        </button>
                    </form>
                    <button id="btn_model" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-file" aria-hidden="true"></span>模板
                    </button>
                    <iframe name="ajaxUpload" style="display:none"></iframe>
                </c:if>
            </div>

            <table id="tb_games"></table>
        </div>
    </div>
</div>

</body>

<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/bs-table.jsp" %>
<script src="resources/lib/bootstrap-datetimepicker/moment-with-locales.js"></script>
<script src="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/game/gameMng.js"></script>
<script>
    function uploadMsg(msg) {
        if (msg == "0") {
            toastr.error("导入失败：填写格式错误");
        } else {
            toastr.success("导入成功");
        }
        setTimeout("myReflush()", 800);
    }
    function myReflush() {
        location.reload();
    }
</script>
</html>