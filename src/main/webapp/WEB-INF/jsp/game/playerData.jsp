<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/3/26
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/basePath.jsp" %>
<%@ include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<head>
    <title>数据详情</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
    <link href="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62b;</i>&nbsp;球员数据&nbsp;&nbsp;>&nbsp;&nbsp;数据详情
            </div>
        </div>
    </div>
    <input type="hidden" id="playerId" value="${playerId}">
    <input type="hidden" id="logo" value="${logo}">
    <div class="row detailRow">
        <div class="col-xs-10 myColCenterBlock">
            <div class="row">
                <div class="col-xs-6">
                    <div style="text-align: center;margin-bottom: 20px;">${playerName}</div>
                    <div style="margin-left: auto;margin-right: auto;" id="imgDiv" class="detailBtnDiv">
                    </div>
                </div>
                <div class="col-xs-6">
                    <div id="c1"></div>
                </div>
            </div>

            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:20px">
                    <label class="control-label col-sm-offset-1 col-sm-1" for="searchType">项目</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="searchType">
                            <option value="score">得分</option>
                            <option value="assist">助攻</option>
                            <option value="backboard">篮板</option>
                            <option value="steal">抢断</option>
                            <option value="blockshot">盖帽</option>
                            <option value="shot">出手</option>
                            <option value="fieldGoal">命中</option>
                            <option value="turnover">失误</option>
                        </select>
                    </div>

                    <label class="control-label col-sm-1" for="searchTime">年份</label>
                    <div class="col-sm-3">
                        <div class='input-group date' id="datetimepickerDiv">
                            <input id="searchTime" name="searchTime" type='text' class="form-control"/>
                            <span id="datetimepicker" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                        <span class="help-block errorMsg" id="searchTime-error">&nbsp;</span>
<%--                        <div class='input-group date' id="datetimepickerDiv">
                            <input id="searchTime" name="searchTime" type='text' class="form-control"/>
                            <span id="datetimepicker" class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>--%>



                    </div>
                    <div class="col-sm-2" style="text-align:left;">
                        <input type="button" style="margin-left:50px" class="btn btn-primary"
                               onclick="personData.op.setSearchData()" value="查询"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-1 col-sm-10" id="c2"></div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<%@ include file="../common/common_footer.jsp" %>
<script src="resources/lib/g2.js"></script>
<script src="resources/lib/bootstrap-datetimepicker/moment-with-locales.js"></script>
<script src="resources/lib/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script src="resources/js/game/playerData.js"></script>

</html>
