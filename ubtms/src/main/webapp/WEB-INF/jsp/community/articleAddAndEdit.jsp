<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2016/12/17
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/basePath.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>帖子添加</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
    <link rel="stylesheet" type="text/css" href="resources/css/wangEditor.min.css">
    <style>
        /*.wangEditor-container{*/
            /*border-radius:1%;*/
        /*}*/
    </style>
</head>


<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i><span id="title">&nbsp;球队动态&nbsp;&nbsp;>&nbsp;&nbsp;添加帖子</span>
            </div>
        </div>
    </div>

    <div class="row detailRow">
        <div class="col-xs-10 myColCenterBlock">
            <form class="form-horizontal myForm" role="form" id="articleForm" method="post"
                  enctype="multipart/form-rows">
                    <input id="articleId" type="hidden" value="${articleDetail.id}"/>
                    <input id="opType" type="hidden" value="${opType}"/>
                <div class="form-group">
                    <%--  style="padding-left: 0px;margin-left: -10px;"
                      style="text-align: left;"--%>
                    <label style="text-align: left" for="articleTitle" class="col-xs-1 control-label"><span
                            class="requiredMsg">*</span>标题</label>
                    <div style="padding-left: 0px;margin-left: -10px;" class="col-xs-10">
                        <input type="text" class="form-control" id="articleTitle" name="articleTitle"
                               value="${articleDetail.title}"/>
                        <span class="help-block errorMsg" id="articleTitle-error">&nbsp;</span>
                    </div>
                    <div class="col-xs-1">
                        <input id="btnExpress" class="btn btn-primary" onclick="articleDetail.articleOp.submitForm()" type="button" value="发表">
                        <input id="btnUpdate" style="display: none" class="btn btn-primary" onclick="articleDetail.articleOp.submitForm()" type="button" value="保存">
                    </div>
                </div>
<%--                <div class="form-group">
                    <label for="schoolName" class="col-sm-2 control-label"><span
                            class="requiredMsg">*</span>收贴学校</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="schoolName" name="schoolName"
                               value="${schoolDetail.schName}"/>
                        <span class="help-block errorMsg" id="schoolName-error">&nbsp;</span>
                    </div>
                    <div class="col-sm-5">
                        <input class="btn btn-primary" type="button" value="发表">
                    </div>
                </div>--%>
                <div id="editor" style="height: 800px;">
                    ${articleDetail.content}
                </div>
            </form>
            <div style="margin-top: 30px; visibility: hidden">&nbsp;</div>
        </div>
    </div>
</div>
</body>

<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/detail_footer.jsp" %>
<script type="text/javascript" src="resources/lib/wangEditor.min.js"></script>
<script type="text/javascript" src="resources/js/community/articleAddAndEdit.js"></script>

</html>
