<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/25
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/basePath.jsp"%>
<!DOCTYPE html>
<html>

<head>
    <title>账单添加</title>
    <%@ include file="../common/head.jsp"%>
    <link href="resources/css/detail.css" rel="stylesheet" type="text/css" />
    <link href="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;账单管理&nbsp;&nbsp;>&nbsp;&nbsp;添加账单
            </div>
        </div>
    </div>

    <div class="row detailRow">
        <div class="col-xs-8 col-md-6 myColCenterBlock">

            <form class="form-horizontal myForm" role="form" id="schoolForm" method="post" enctype="multipart/form-rows">
                <div class="form-group">
                    <label for="billSchool" class="col-sm-2 control-label">学校</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="billSchool" name="billSchool">
                    </div>
                </div>
                <div class="form-group">
                    <label for="billRemark" class="col-sm-2 control-label">项目</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="billRemark" name="billRemark">
                    </div>
                </div>
                <div class="form-group">
                    <label for="billType" class="col-sm-2 control-label">类型</label>
                    <div class="col-sm-10">
                        <select id="billType" name="billType" class="form-control">
                            <option value="2">食</option>
                            <option value="1">衣</option>
                            <option value="3">住</option>
                            <option value="4">行</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="billCost" class="col-sm-2 control-label">花费</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="billCost" name="billCost">
                    </div>
                </div>

                <div class="form-group">
                    <label for="datetimepickerInput" class="col-sm-2 control-label">日期</label>
                    <div class='col-sm-10'>
                        <div class='input-group date' id="datetimepickerDiv">
                            <input id="datetimepickerInput" type='text' class="form-control"/>
                            <span id="datetimepicker" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
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
<script src="resources/lib/bootstrap-datetimepicker/moment-with-locales.js"></script>
<script src="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">
    $(function () {
        $('#datetimepickerDiv').datetimepicker({
            format: 'YYYY-MM-DD',//日期格式化，只显示日期
            locale: 'zh-CN'      //中文化
        });
    });
</script>

</html>