<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/1/10
  Time: 20:09
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
    <title>赛事详情</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
    <link href="resources/lib/bootstrap-table/bootstrap-table.css" rel="stylesheet"/>
</head>

<body>
<div class="container-fluid">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;赛程管理&nbsp;&nbsp;>&nbsp;&nbsp;赛事详情
            </div>
        </div>
    </div>

    <div class="row detailRow">
        <div class="col-xs-11 myColCenterBlock">
            <input id="gameId" type="hidden" value="${game.game.id}">
            <div class="row">
                <div class="col-xs-4">
                    <div class="row">
                        <div id="schoolImgDiv" class="detailBtnDiv" style="height: 140px;width: 140px; margin: auto;"></div>
                    </div>
                    <div class="row textCenter" style="margin-top: 15px;">
                        <span id="school">${game.mySchoolName}</span>
                    </div>
                </div>

                <div class="col-xs-4">
                    <form class="form-horizontal" role="form" style="margin-top: 30px;">
                        <div class="form-group ">
                            <div class="col-sm-12 textCenter">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 textCenter">
                                <p id="score">${game.VSScore}</p>
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-sm-12 textCenter">
                                <p id="startTime">${game.startTime}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 textCenter">
                                <p id="place">${game.game.place}</p>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-xs-4 ">
                    <div class="row">
                        <div id="rivalImgDiv" class="detailBtnDiv" style="height: 140px;width: 140px; margin: auto;"></div>
                    </div>
                    <div class="row textCenter" style="margin-top: 15px;">
                        <span id="rival">${game.game.rival}</span>
                    </div>
                </div>

            </div>

            <div id="chart">
            </div>
            <div class="row">
                <div id="title1" class="row gameFont" style="display: none; margin-bottom: -5px">${game.mySchoolName}</div>
                <div class="row">
                    <table id="tb_school"></table>
                </div>
            </div>
            <div class="row">
                <div id="title2" class="row gameFont" style="display: none; margin-top: 20px;margin-bottom: -5px">${game.game.rival}</div>
                <div class="row">
                    <table id="tb_rival"></table>
                </div>

                <div style="margin-top: 25px;margin-bottom: 20px">
                    <label>备注:</label><span id="remark">${game.game.remark}</span>
                </div>
            </div>

        </div>
    </div>

</div>
</body>
<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/bs-table.jsp" %>
<script src="resources/lib/g2.js"></script>
<script src="resources/js/game/gameDataDetail.js"></script>

</html>
