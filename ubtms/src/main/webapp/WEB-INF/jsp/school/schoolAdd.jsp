<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/basePath.jsp"%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <title>人员添加</title>
     <%@ include file="../common/common_head.jsp"%>
     <%@ include file="../common/detail_head.jsp"%>
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
            <form target="ajaxUpload" class="form-horizontal myForm" role="form" id="headImgForm" action="/school/imgUpload" method="post" enctype="multipart/form-data">
                <div class="form-group picRow">
                    <label for="file" class="col-sm-2 control-label">校徽</label>
                    <div class="col-sm-10">
                        <div id="imgDiv" class="detailBtnDiv">
                            <input type="file" id="file" name="file" onchange="schoolDetail.schoolAdd.fileChange()" />
                        </div>
                        <span class="help-block errorMsg" id="file-error">&nbsp;</span>
                    </div>
                </div>
            </form>
            <iframe name="ajaxUpload" style="display:none"></iframe>
            <form class="form-horizontal myForm" role="form" id="schoolForm" method="post" enctype="multipart/form-rows">
                <div class="form-group">
                    <label for="schoolName" class="col-sm-2 control-label"><span class="requiredMsg">*</span>校名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="schoolName" name="schoolName">
                        <span class="help-block errorMsg" id="schoolName-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="introduction" class="col-sm-2 control-label">简介</label>
                    <div class="col-sm-10">
                        <textarea maxlength="200" name="introduction" id="introduction" class="form-control" rows="6"></textarea>
                    </div>
                    <span class="help-block errorMsg" id="introduction-error">&nbsp;</span>
                </div>
            </form>

            <div class="row">
                <div class="col-sm-2">
                </div>
                <div class="col-sm-10">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input id="btnSave" name="btnSave" type="button" onclick="schoolDetail.schoolAdd.submitForm()" style="width: 100px;" class="btn btn-primary" value="保存" />
                        <input type="button" onclick=" schoolDetail.schoolAdd.back()" style="width: 100px;" class="btn btn-primary" value="返回" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="../common/common_footer.jsp"%>
<%@ include file="../common/detail_footer.jsp"%>
<script src="resources/js/school/schoolDetail.js"></script>
<script type="text/javascript">
    $(function () {
        $("#schoolForm").validate({
            focusCleanup:false,
            rules: {
                schoolName: {
                    required: true,
					remote: {
                        url: "/school/schoolValidateAction",     //后台处理程序
                        type: "get",               //数据发送方式
                        dataType: "json",           //接受数据格式
                        contentType: "application/json;charset=UTF-8",
                        data: {                     //要传递的数据
                            date:function () {
                                return "测试数据";
                            }
                        }
                    },
                },
            },
            messages: {
                schoolName: {required:"校名不能为空",remote:"该学校已被注册"},
            },
            errorPlacement: function(error, element) {
                if(error[0].innerHTML != " ") {
                    var inputId = element[0].id;
                    var errorMsgId = error[0].id;
                    var errorMsg = error[0].innerHTML;
                    $('#' + inputId).parent().addClass('has-error');
                    /*jquery validate设计有个很变态的问题
                    如果重写下面的success函数,当验证通过时jquery validate会
                    检测页面的的错误信息，然后删除，在该系统并不需要删除信息，只需要
                    将信息隐藏用来占一行当行距。所以当我们放置错误信息时需要额外加入&nbsp来占
                    一个位置，这样即使jquery validate删除错误信息后还有&nbsp帮我们占着位置

                    当然，如果你没有重写success函数，通过jquery validate验证后jquery validate
                    不会删除错误信息
                    */
                    $('#' + errorMsgId).html(errorMsg+'&nbsp;');
                    $('#' + errorMsgId).css('visibility', 'visible');
                }
            },
            success: function(label) {
                var inputId = label[0].htmlFor;
                var errorMsgId = label[0].id;
                $('#' + inputId).parent().removeClass('has-error');
                $('#' + errorMsgId).css('visibility', 'hidden');
            }

        });
        //初始化消息框位置
        toastr.options = {positionClass:'toast-top-center',showDuration: "300",timeOut:"800"};
    });

</script>
</html>