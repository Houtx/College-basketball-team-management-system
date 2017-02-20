<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/2/20
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户登录</title>
    <link rel="stylesheet" href="resources/lib/font-awesome.min.css">
    <link rel="stylesheet" href="resources/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/login.css">
    <!--[if IE]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="container" id="content">
    <div style="margin-left: auto;margin-right: auto;width: 600px;">
        <form class="form-horizontal" id="loginForm">
            <span class="heading">用户登录</span>
            <div class="form-group">
                <input type="email" class="form-control" id="phone" placeholder="手机号">
                <i class="fa fa-user"></i>
            </div>
            <div class="form-group help">
                <input type="password" class="form-control" id="password" placeholder="密　码">
                <i class="fa fa-lock"></i>
                <a href="#" class="fa fa-question-circle"></a>
            </div>
            <div class="form-group">
                <div class="main-checkbox">
                    <input type="checkbox" value="None" id="checkbox1" name="check" />
                    <label for="checkbox1"></label>
                </div>
                <span class="text">Remember me</span>
                <input onclick="btnLogin()" type="button" id="btnLogin" value="登录" class="btn btn-default">
            </div>
        </form>
    </div>
</div>
</body>
<%@ include file="./WEB-INF/jsp/common/detail_footer.jsp" %>
<script>
    function btnLogin() {
        var phone = $('#phone').val();
        var password = $('#password').val();
        var user = {account:phone,password:password};
        $.post("user/loginValidation",JSON.stringify(user),function (res) {
            if(res.success){
                window.document.location = "user/mainPage";
            }else {
                toastr.error(res.msg);
            }
        });
    }

    function setFormValidator(){
        $("#loginForm").validate({
            focusCleanup: false,
            rules: {
                phone: {
                    required: true,
                    mobile:true,
                },
                password:{
                    required: true,
                }
            },
            messages: {
                account: {
                    required: "请输入手机号",
                },
                password: {
                    required: "请输入密码",
                },
            },
            errorPlacement: function (error, element) {
//                if (error[0].innerHTML != " ") {
//                    var errorMsgId = error[0].id;
//                    var errorMsg = error[0].innerHTML;
//                    $('#' + errorMsgId).parent().addClass('has-error');
//                    $('#' + errorMsgId).html(errorMsg + '&nbsp;');
//                    $('#' + errorMsgId).css('visibility', 'visible');
//                }
            },
            success: function (label) {
//                var errorMsgId = label[0].id;
//                $('#' + errorMsgId).parent().removeClass('has-error');
//                $('#' + errorMsgId).css('visibility', 'hidden');
            }

        });
    }

    $(function () {
        setFormValidator();
    });
</script>
</html>