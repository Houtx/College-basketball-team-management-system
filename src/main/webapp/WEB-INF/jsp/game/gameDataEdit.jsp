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

<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>

<head>
    <title>赛事数据</title>
    <%@ include file="../common/common_head.jsp" %>
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
    <link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
    <style type="text/css">
        .bui-grid-tbar {
            height: 34px;
            line-height: 34px;
            margin-bottom: 5px;
        }
    </style>
</head>

<body>

<div style="padding-top: 50px;">
    <div>
        <div style="width: 900px;margin-left: auto;margin-right: auto;">
            <div id="title1" style="display: none; font-weight: bold;font-size: 20px;margin-bottom: 10px;">
               ${school}
            </div>
            <div id="grid1">

            </div>
        </div>
    </div>

    <div>
        <div style="width: 900px;margin-left: auto;margin-right: auto;">
            <div id="title2"
                 style="display: none;font-weight: bold;font-size: 20px;margin-bottom: 5px;margin-top: 30px;">
                 ${game.rival}

            </div>
            <div id="grid2">

            </div>
        </div>
    </div>

    <div style="width: 900px;margin-left: auto;margin-right: auto;margin-top: 50px;">
        <form class="span8 offset3" id="J_Form" action="" method="post">
            <input type="hidden" id="gameId" value="${game.id}">
            <input id="btnSave1" type="hidden" value="提交1" class="button button-primary">
            <input id="btnSave2" type="hidden" value="提交2" class="button button-primary">
            <input id="btnSaveAll" style="width: 30px;margin-left: -130px" onclick="myGrid.saveAll()" value="保存"
                   class="button button-primary">
        </form>
    </div>

</div>
</body>
<%@ include file="../common/common_footer.jsp" %>
<script src="http://g.alicdn.com/bui/bui/1.1.21/seed-min.js"></script>
<script src="resources/js/game/grid.js"></script>

</html>