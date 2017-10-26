<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/2/20
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="./WEB-INF/jsp/common/tag.jsp" %>
<%@ include file="./WEB-INF/jsp/common/basePath.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">

    <title>CROSSOVER高校篮球队管理系统</title>
    <%@ include file="./WEB-INF/jsp/common/common_head.jsp" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/login.css">
</head>


<%--
<body style="background: url('./resources/images/common/ibg.jpg');">
--%>
<body style="background: url('./resources/images/common/ibg.jpg');">
<div class="container" id="content" >
    <div style="margin-left: auto;margin-right: auto;width: 600px;">
        <div style="text-align: center">
            <span style="margin-bottom: 4px; color: #6D4734;font-size: 40px;font-weight:700">CROSSOVER高校篮球队管理系统</span>
        </div>        <form class="form-horizontal" id="loginForm">
            <span class="heading">管理员登录</span>
            <div class="form-group" style="margin-bottom: 0px">
                <input class="form-control" id="phone" name="phone" placeholder="帐 号">
                <i class="fa fa-user"></i>
                <span class="help-block errorMsg" id="phone-error" style="margin-left: -360px;font-size: 14px">&nbsp;</span>
            </div>
            <div class="form-group help" style="margin-bottom: 0px">
                <input type="password" class="form-control" id="password" name="password" placeholder="密　码">
                <i class="fa fa-lock"></i>
                <a href="#" class="fa fa-question-circle"></a>
                <span class="help-block errorMsg" id="password-error" style="margin-left: -360px;font-size: 14px">&nbsp;</span>
            </div>
            <div class="form-group">
                <input onclick="adminBtnLogin();" type="button" id="btnLogin" value="登录" class="btn btn-default"/>
            </div>
        </form>
    </div>
</div>
</body>
<%@ include file="./WEB-INF/jsp/common/common_footer.jsp" %>
<%@ include file="./WEB-INF/jsp/common/detail_footer.jsp" %>
<script>
    function adminBtnLogin() {
        if (!$("#loginForm").valid()) {
            return;
        }
        var phone = $('#phone').val();
        var password = $('#password').val();
        var user = {phone: phone, password: password};
        $('#adminBtnLogin').attr('disabled', true);
        $.ajax({
            type: "post",
            url: "user/loginValidation",
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(user),
            success: function (data) {
                if (data.success) {
                    window.document.location = "user/mainPage";
                } else {
                    $('#adminBtnLogin').attr('disabled', false);
                    toastr.error(data.msg);
                }
            }

        });
    }
    function setFormValidator() {
        $("#loginForm").validate({
            focusCleanup: false,
            rules: {
                phone: {
                    required: true,
                },
                password: {
                    required: true,
                }
            },
            messages: {
                phone: {
                    required: "请输入账号",
                },
                password: {
                    required: "请输入密码",
                },
            },
            errorPlacement: function (error, element) {
                if (error[0].innerHTML != " ") {
                    var errorMsgId = error[0].id;
                    var errorMsg = error[0].innerHTML;
                    $('#' + errorMsgId).parent().addClass('has-error');
                    $('#' + errorMsgId).html(errorMsg + '&nbsp;');
                    $('#' + errorMsgId).css('visibility', 'visible');
                }
            },
            success: function (label) {
                var errorMsgId = label[0].id;
                $('#' + errorMsgId).parent().removeClass('has-error');
                $('#' + errorMsgId).css('visibility', 'hidden');
            }

        });
    }

    $(function () {
        setFormValidator();
        myToastr.init();
        $(document).keyup(function (evnet) {
            if (evnet.keyCode == '13') {
                adminBtnLogin();
            }
        });
    });
</script>
</html>