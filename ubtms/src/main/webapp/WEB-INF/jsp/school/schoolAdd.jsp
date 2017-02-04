<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/basePath.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <title>人员添加</title>
     <%@ include file="../common/head.jsp"%>
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
<%@ include file="../common/footer.jsp"%>
<script src="resources/js/school/schoolDetail.js"></script>
<script type="text/javascript">
    $(function() {
        //使用EL表达式传入参数

    })
</script>

</html>