<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <title>人员添加</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--引入图标-->
    <link href="resources/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
    <!-- 引入 Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file:// 引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!--引入自定义css-->
    <link href="resources/css/style.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/detail.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;学校管理&nbsp;&nbsp;>&nbsp;&nbsp;添加学校
            </div>
        </div>
    </div>

    <div class="row detailRow">
        <div class="col-xs-8 col-md-6 myColCenterBlock">
            <form target="ajaxUpload" class="form-horizontal myForm" role="form" id="headImgForm" action="/school/imgUpload" method="post" enctype="multipart/form-rows">
                <div class="form-group picRow">
                    <label for="file" class="col-sm-2 control-label">校徽</label>
                    <div class="col-sm-10">
                        <div class="detailBtnDiv">
                            <input type="file" id="file" name="file" onchange="schoolDetail.schooAdd.fileChange()" />
                        </div>
                    </div>
                </div>
            </form>
            <iframe name="ajaxUpload" style="display:none"></iframe>
            <form class="form-horizontal myForm" role="form" id="schoolForm" method="post" enctype="multipart/form-rows">
                <div class="form-group">
                    <label for="schoolName" class="col-sm-2 control-label">校名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="schoolName" name="schoolName">
                    </div>
                </div>
                <div class="form-group" style="margin-top: 30px;">
                    <label for="intfroduction" class="col-sm-2 control-label">简介</label>
                    <div class="col-sm-10">
                        <textarea maxlength="200" id="intfroduction" class="form-control" r="6"></textarea>
                    </div>
                </div>
            </form>
            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-10">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input type="button" onclick="schoolDetail.schoolAdd.submitForm()" style="width: 100px;" class="btn btn-primary" value="保存" />
                        <input type="button" onclick="submitSchoolData()" style="width: 100px;" class="btn btn-primary" value="返回" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="resources/lib/bootstrap/bootstrap.min.js"></script>

<script src="resources/lib/bootstrap-table/bootstrap-table.js"></script>
<script src="resources/js/school/schoolDetail.js"></script>

<script type="text/javascript">
    $(function() {
        //使用EL表达式传入参数

    })
</script>

</html>