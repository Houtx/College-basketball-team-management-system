<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/3/26
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
    <title>球员数据</title>
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
                <i class="Hui-iconfont">&#xe62b;</i>&nbsp;球员数据
            </div>
        </div>
    </div>

    <div class="row mngMainBody">
        <div class="panel panel-default mngSearch">
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <c:if test="${loginUser == 'admin'}">
                            <label class="control-label col-sm-1"  for="searchSchoolName">学校</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="searchSchoolName"/>
                            </div>
                        </c:if>
                        <c:if test="${loginUser != 'admin'}">
                            <label class="control-label col-sm-1" style="display: none" for="searchSchoolName">学校</label>
                            <div class="col-sm-3" style="display: none">
                                <input type="text" value="${loginSchool.schName}" class="form-control" id="searchSchoolName"/>
                            </div>
                        </c:if>
                        <label class="control-label col-sm-1" for="searchStu">姓名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="searchStu"/>
                        </div>
                        <label class="control-label col-sm-1"></label>
                        <div class="col-sm-3" >
                            <input type="button" class="btn btn-primary" onclick="gameMng.serachClick()" value="查询"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div>
            <div id="toolbar" class="btn-group">
            </div>
            <table id="tb_player_data"></table>
        </div>
    </div>
</div>

</body>

<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/bs-table.jsp" %>
<script src="resources/lib/bootstrap-datetimepicker/moment-with-locales.js"></script>
<script src="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/game/playerDataMng.js"></script>
</html>