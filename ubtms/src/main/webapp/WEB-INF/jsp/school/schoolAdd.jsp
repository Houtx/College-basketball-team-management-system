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
    <!-- 引入 Bootstrap -->
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 Shim 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file:// 引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">


        // 添加字典类型信息方法
        function submitSchoolData() {
            debugger;
            $.post('school/addSchool/', $('#schoolForm').serialize(), function(result){
                if (result.success){
                    alert("添加成功");
                } else{

                }
            },'json');
        }

        function uploadImg() {
            $("#headImgForm").submit();
        }
    </script>
</head>

<body>
<div class="container">
    <form class="form-horizontal" role="form" id="schoolForm" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="schoolName" class="col-sm-2 control-label">校名</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="schoolName" name="schoolName">
            </div>
        </div>
        <div class="form-group">
            <label for="intfroduction" class="col-sm-2 control-label">简介</label>
            <div class="col-sm-10">
                <textarea  id="intfroduction" class="form-control" rows="3"></textarea>
            </div>
        </div>

    </form>

    <form target="ajaxUpload" class="form-horizontal" role="form" id="headImgForm" action="/school/imgUpload" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="file" class="col-sm-2 control-label" style="margin-top: 30px;">校徽</label>
            <div class="col-sm-10">
                <div style="width: 100px;height: 100px;background: url(resources/images/hp.jpg);background-size: 100% 100%;border-radius: 50%;">
                    <input type="file" id="file" name="file" onchange="uploadImg()" style="filter:alpha(opacity=0);opacity:0;width:100%;height:100%;cursor:pointer;" />
                </div>
            </div>
        </div>
    </form>
    <iframe name="ajaxUpload" style="display:none"></iframe>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="button" onclick="submitSchoolData()" class="btn btn-primary" value="保存"/>
        </div>
    </div>
</div>

</body>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>