<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/26
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/basePath.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <title>人员添加</title>
     <%@ include file="../common/common_head.jsp"%>
    <link href="resources/css/detail.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;人员管理&nbsp;&nbsp;>&nbsp;&nbsp;添加人员
            </div>
        </div>
    </div>

    <div class="row detailRow">
        <div class="col-xs-8 col-md-6 myColCenterBlock">
            <form target="ajaxUpload" class="form-horizontal myForm" role="form" id="headImgForm" action="/user/imgUpload" method="post" enctype="multipart/form-rows">
                <div class="form-group picRow">
                    <label for="file" class="col-sm-2 control-label">头像</label>
                    <div class="col-sm-10">
                        <div class="detailBtnDiv">
                            <input type="file" id="file" name="file" onchange="userDetail.userAdd.fileChange()" />
                            <span class="help-block errorMsg" id="file-error">&nbsp;</span>
                        </div>
                    </div>
                </div>
            </form>
            <iframe name="ajaxUpload" style="display:none"></iframe>

            <form class="form-horizontal myForm" role="form" id="userForm" method="post" enctype="multipart/form-rows">
                <div class="form-group">
                    <label class="col-sm-2 control-label">账号类型</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="userType" id="playerRadio" value="1"> 球员
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="useType" id="coachRadio" value="2"> 教练
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="useType" id="teamLeaderRadio" value="3"> 球队领队
                        </label>
                        <span class="help-block errorMsg" id="account-type-error">&nbsp;</span>
                    </div>
                </div>

                <div class="form-group">
                    <!--输入时异步请求学校列表显示提示-->
                    <label for="schoolName" class="col-sm-2 control-label">学校</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="schoolName" name="userName">
                         <span class="help-block errorMsg" id="school-error">&nbsp;</span>
                    </div>
                </div>

                <div class="form-group" style="margin-top: 30px;">
                    <label for="account" class="col-sm-2 control-label">账号</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="account" name="account">
                        <span class="help-block errorMsg" id="account-error">&nbsp;</span>

                    </div>
                </div>

                <div class="form-group" style="margin-top: 30px;">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" name="password">
                    <span class="help-block errorMsg" id="password-error">&nbsp;</span>

                    </div>
                </div>
                <div class="form-group" style="margin-top: 30px;">
                    <label for="name" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" name="name">
                        <span class="help-block errorMsg" id="name-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="maleRadio" value="1"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="femaleRadio" value="2"> 女
                        </label>
                         <span class="help-block errorMsg" id="sex-error">&nbsp;</span>
                       
                    </div>
                </div>
                <div class="form-group" style="margin-top: 30px;">
                    <label for="grade" class="col-sm-2 control-label">年级</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="grade" name="grade">
                        <span class="help-block errorMsg" id="grade-error">&nbsp;</span>

                    </div>
                </div>
                <div class="form-group" style="margin-top: 30px;">
                    <label for="height" class="col-sm-2 control-label">身高(cm)</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="height" name="height">
                        <span class="help-block errorMsg" id="height-error">&nbsp;</span>

                    </div>
                </div>

                <div class="form-group" style="margin-top: 30px;">
                    <label for="weight" class="col-sm-2 control-label">体重(kg)</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="weight" name="weight">
                        <span class="help-block errorMsg" id="weight-error">&nbsp;</span>

                    </div>
                </div>

                <div class="form-group" style="margin-top: 30px;">
                    <label for="shirtNum" class="col-sm-2 control-label">球衣号码</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="shirtNum" name="shirtNum">
                         <span class="help-block errorMsg" id="shirtNum-error">&nbsp;</span>
                       
                    </div>
                </div>

                <div class="form-group" style="margin-top: 30px;">
                    <label class="col-sm-2 control-label">位置</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="duty" id="CGRadio" value="1"> 控卫
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="duty" id="SGRadio" value="2"> 分卫
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="duty" id="SFRadio" value="3"> 小前锋
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="duty" id="PFRadio" value="4"> 大前锋
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="duty" id="CRadio" value="5"> 中锋
                        </label>
                         <span class="help-block errorMsg" id="CRadio-error">&nbsp;</span>

                    </div>
                </div>
            </form>
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-10">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input type="button" onclick="userDetail.userAdd.submitForm()" style="width: 100px;" class="btn btn-primary" value="保存" />
                        <input type="button" onclick="submituserData()" style="width: 100px;" class="btn btn-primary" value="返回" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="../common/common_footer.jsp"%>
<script src="resources/js/user/userDetail.js"></script>
</html>