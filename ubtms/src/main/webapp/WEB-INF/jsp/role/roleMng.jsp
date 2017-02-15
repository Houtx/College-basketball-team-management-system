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
    <title>角色管理</title>
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
    <link href="resources/css/mng.css" rel="stylesheet" type="text/css"/>

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;角色管理
            </div>
        </div>
    </div>

    <div class="row mngMainBody">
        <div class="panel panel-default mngSearch">
            <div class="panel-body">
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" for="searchRoleVal">角色</label>
                        <div class="col-sm-2">
                            <select id="searchRoleVal" class="form-control">
                                <option value="3">全部</option>
                                <option value="2">球队领队</option>
                                <option value="1">教练</option>
                                <option value="0">球员</option>
                            </select>
                        </div>

                        <label class="control-label col-sm-1" for="searchRoleSate">状态</label>

                        <div class="col-sm-2">
                            <select id="searchRoleSate" class="form-control">
                                <option value="2">全部</option>
                                <option value="1">正常</option>
                                <option value="0">禁用</option>
                            </select>
                        </div>

                        <c:if test="${loginSchoolName=='系统'}">
                            <label class="control-label col-sm-1" for="searchSchoolName">校名</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="searchSchoolName"/>
                            </div>
                        </c:if>

                        <c:if test="${loginSchoolName!='系统'}">
                            <label style="display:none" class="control-label col-sm-1" for="searchSchoolName">校名</label>
                            <div style="display:none" class="col-sm-3">
                                <input value="${loginSchoolName}" type="text" class="form-control" id="searchSchoolName"/>
                            </div>
                        </c:if>


                        <div class="col-sm-2" style="text-align:left;">
                            <input type="button" style="margin-left:50px" class="btn btn-primary"
                                   onclick="roleMng.serachClick()" value="查询"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div>
            <div id="toolbar" class="btn-group">
                <input id="roleEditP" type="hidden" value="${roleEditP}"/>
                <c:if test="${roleEditP==1}">
                    <button id="btn_disable" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>禁用
                    </button>
                    <button id="btn_enable" type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>启用
                    </button>
                </c:if>
            </div>

            <table id="tb_roles"></table>
        </div>
    </div>
</div>

</body>

<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/bs-table.jsp" %>
<script src="resources/js/role/roleMng.js"></script>

</html>