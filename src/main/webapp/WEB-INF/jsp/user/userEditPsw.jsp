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
    <title>修改密码</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
</head>

<body>
<div class="container-fluid">
    <div class="row detailRow">
        <div class="col-xs-8 col-md-6 myColCenterBlock">
            <form class="form-horizontal myForm" role="form" id="pswForm" method="post"
                  enctype="multipart/form-rows">
                <input type="hidden" id="userId" value="${loginUserId}">
                <div class="form-group">
                    <label for="oldPsw" class="col-xs-3 control-label"><span class="requiredMsg">*</span>原始密码</label>
                    <div class="col-xs-9">
                        <input type="password" class="form-control" id="oldPsw" name="oldPsw"/>
                        <span class="help-block errorMsg" id="oldPsw-error">&nbsp;</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="newPsw" class="col-xs-3 control-label"><span class="requiredMsg">*</span>新密码</label>
                    <div class="col-xs-9">
                        <input type="password" class="form-control" id="newPsw" name="newPsw"/>
                        <span class="help-block errorMsg" id="newPsw-error">&nbsp;</span>
                    </div>
                </div>
            </form>
            <div class="row">
                <div class="col-xs-3">
                </div>
                <div class="col-xs-9">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input id="btnUpdate" name="btnUpdate" type="button" onclick="psw.updatePsw()"
                               style="width: 100px;" class="btn btn-primary" value="确认"/>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/detail_footer.jsp" %>
<script src="resources/js/user/editPsw.js"></script>
</html>