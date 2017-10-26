<%@include file="../common/tag.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/basePath.jsp" %>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>

<head>
    <title>赛事添加</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
    <link href="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62b;</i><span id="title">&nbsp;考勤管理&nbsp;&nbsp;>&nbsp;&nbsp;添加考勤</span>
            </div>
        </div>
    </div>

    <input id="attendanceEditP" type="hidden" value="${attendanceEditP}"/>
    <input id="attendanceId" type="hidden" value="${attendanceDetail.id}"/>
    <input id="opType" type="hidden" value="${opType}"/>
    <input id="attend" type="hidden" value="${attendanceDetail.attend}"/>
    <input id="absenceType" type="hidden" value="${attendanceDetail.absenceType}"/>

    <div class="row detailRow">
        <div class="col-xs-8 col-md-6 myColCenterBlock">
            <form class="form-horizontal myForm" role="form" id="attendanceForm" method="post" enctype="multipart/form-rows">
                <c:if test="${loginUser == 'admin'}">
                <div class="form-group">
                    <label for="schoolName" class="col-sm-2 control-label"><span class="requiredMsg">*</span>学校</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="schoolName" name="schoolName"
                               data-provide="typeahead" value="${attendanceDetail.schoolName}">
                        <span class="help-block errorMsg" id="schoolName-error">&nbsp;</span>
                    </div>
                </div>
                </c:if>
                <c:if test="${loginUser != 'admin'}">
                    <div style="display: none">
                        <div>
                            <input type="text" class="form-control" id="schoolName" name="schoolName"
                                   data-provide="typeahead" value="${loginSchool.schName}">
                            <span class="help-block errorMsg" id="schoolName-error">&nbsp;</span>
                        </div>
                    </div>
                </c:if>
                <div class="form-group">
                    <label for="aDate" class="col-sm-2 control-label"><span class="requiredMsg">*</span>日期</label>
                    <div class='col-sm-10'>
                        <div class='input-group date' id="datetimepickerDiv">
                            <input id="aDate" name="aDate" type='text' value="<fmt:formatDate value="${attendanceDetail.date}" pattern="yyyy-MM-dd"/>" class="form-control"/>
                            <span id="datetimepicker" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                        <span class="help-block errorMsg" id="aDate-error">&nbsp;</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="stuName" class="col-sm-2 control-label"><span class="requiredMsg">*</span>姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="stuName" value="${attendanceDetail.userName}" name="stuName"/>
                        <span class="help-block errorMsg" id="stuName-error">&nbsp;</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">出席</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input onclick="attendanceDetail.attendanceAdd.handleAttendanceChange()" checked="true" type="radio" name="attendance" id="attendanceIn" value="1"> 是
                        </label>
                        <label class="radio-inline">
                            <input onclick="attendanceDetail.attendanceAdd.handleAttendanceChange()" type="radio" name="attendance" id="attendanceOut" value="0"> 否
                        </label>
                        <span class="help-block errorMsg" id="attendance-error">&nbsp;</span>
                    </div>
                </div>

                <div class="form-group" id="reasonDiv" style="display: none">
                    <label class="col-sm-2 control-label">原因</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input checked="true" type="radio" name="reason" id="nRRadio" value="0"> 无故缺勤
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="reason" id="matterRadio" value="2">事假
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="reason" id="illRadio" value="1"> 病假
                        </label>
                        <span class="help-block errorMsg" id="reason-error">&nbsp;</span>
                    </div>
                </div>


            </form>
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-10">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input id="btnEdit" name="btnEdit" type="button" onclick="attendanceDetail.attendanceAdd.handleEdit()"
                               style="display:none;width: 100px;" class="btn btn-primary" value="编辑"/>
                        <input id="btnSave" name="btnSave" type="button" onclick="attendanceDetail.attendanceAdd.submitForm()"
                               style="width: 100px;" class="btn btn-primary" value="保存"/>
                        <input id="btnBack" type="button" onclick=" attendanceDetail.attendanceAdd.back()" style="width: 100px;"
                               class="btn btn-primary" value="返回"/>
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
<script src="resources/js/attendance/attendanceDetail.js"></script>

</html>