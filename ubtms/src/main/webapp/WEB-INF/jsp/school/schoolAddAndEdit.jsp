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
    <title>人员添加</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i><span id="title">&nbsp;学校管理&nbsp;&nbsp;>&nbsp;&nbsp;添加学校</span>
            </div>
        </div>
    </div>

    <div class="row detailRow">
        <div class="col-xs-8 col-md-6 myColCenterBlock">
            <form target="ajaxUpload" class="form-horizontal myForm" role="form" id="headImgForm"
                  action="/school/imgUpload" method="post" enctype="multipart/form-data">
                <div class="form-group picRow">
                    <label for="file" class="col-sm-2 control-label">校徽</label>
                    <div class="col-sm-10">
                        <div id="imgDiv" class="detailBtnDiv">
                            <input type="file" id="file" name="file" onchange="schoolDetail.schoolAdd.fileChange()"/>
                        </div>
                        <span class="help-block errorMsg" id="file-error">&nbsp;</span>
                    </div>
                </div>
            </form>
            <iframe name="ajaxUpload" style="display:none"></iframe>
            <form class="form-horizontal myForm" role="form" id="schoolForm" method="post"
                  enctype="multipart/form-rows">
                <div class="form-group">
                    <label for="schoolName" class="col-sm-2 control-label"><span class="requiredMsg">*</span>校名</label>
                    <div class="col-sm-10">
                        <input type="hidden" id="schId" name="schId" value="${schoolDetail.schId}"/>
                        <input type="hidden" id="schLogo" name="schLogo" value="${schoolDetail.schLogo}"/>
                        <input id="schoolEditP" type="hidden" value="${schoolEditP}"/>
                        <input id="type" type="hidden" value="${type}"/>

                        <input type="text" class="form-control" id="schoolName" name="schoolName"
                               value="${schoolDetail.schName}"/>
                        <span class="help-block errorMsg" id="schoolName-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="introduction" class="col-sm-2 control-label">简介</label>
                    <div class="col-sm-10">
                        <textarea maxlength="200" name="introduction" id="introduction" class="form-control"
                                  rows="6">${schoolDetail.introduction}</textarea>
                    </div>
                    <span class="help-block errorMsg" id="introduction-error">&nbsp;</span>
                </div>
            </form>

            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-10">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input id="btnEdit" name="btnEdit" type="button"
                               onclick="schoolDetail.schoolAdd.handleEditBtn()" style="display:none;width: 100px;"
                               class="btn btn-primary" value="编辑"/>
                        <input id="btnSave" name="btnSave" type="button" onclick="schoolDetail.schoolAdd.submitForm()"
                               style="width: 100px;" class="btn btn-primary" value="保存"/>
                        <input type="button" onclick=" schoolDetail.schoolAdd.back()" style="width: 100px;"
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
<script src="resources/js/school/schoolDetail.js"></script>
</html>