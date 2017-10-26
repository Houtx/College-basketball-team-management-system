<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/tag.jsp" %>
<%@ include file="../common/basePath.jsp" %>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<head>
    <title>导出数据</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
    <link href="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="container-fluid">
    <div class="row detailRow">
        <div class="col-xs-8 col-md-6 myColCenterBlock">
            <form class="form-horizontal myForm" role="form" id="exportForm" method="post" name="exportForm"
                  enctype="multipart/form-rows">
                <c:if test="${loginRole == '超级管理员'}">
                    <div class="form-group">
                        <label for="schoolName" class="col-xs-2 control-label"><span class="requiredMsg">*</span>学校</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="schoolName" name="schoolName"/>
                            <span class="help-block errorMsg" id="schoolName-error">&nbsp;</span>
                        </div>
                    </div>
                </c:if>

                <c:if test="${loginRole != '超级管理员'}">
                    <div class="form-group">
                        <label for="schoolName" class="col-xs-2 control-label"><span class="requiredMsg">*</span>学校</label>
                        <div class="col-xs-10">
                            <input type="text" disabled="disabled" value="${loginSchool.schName}" class="form-control" id="schoolName" name="schoolName"/>
                            <span class="help-block errorMsg" id="schoolName-error">&nbsp;</span>
                        </div>
                    </div>
                </c:if>


                <div class="form-group">
                    <label for="searchTime" class="col-xs-2 control-label"><span class="requiredMsg">*</span>月份</label>
                    <div class='col-xs-10'>
                        <div class='input-group date' id="datetimepickerDiv">
                            <input id="searchTime" name="searchTime" type='text' class="form-control"/>
                            <span id="datetimepicker" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                        <span class="help-block errorMsg" id="searchTime-error">&nbsp;</span>
                    </div>
                </div>
            </form>
            <div class="row">
                <div class="col-xs-2">
                </div>
                <div class="col-xs-10">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input type="button" onclick="attendanceExport.getData()"
                               style="width: 100px;" class="btn btn-primary" value="导出"/>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/detail_footer.jsp" %>
<script src="resources/lib/bootstrap-datetimepicker/moment-with-locales.js"></script>
<script src="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/attendance/attendanceExport.js"></script>

</html>