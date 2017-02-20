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
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />

	<head>
		<title>赛事数据</title>
		<%@ include file="../common/common_head.jsp" %>
		<%--<link href="resources/lib/bui/dpl.css" rel="stylesheet">--%>
		<%--<link href="resources/lib/bui/bui.css" rel="stylesheet">--%>

	</head>

	<body>
		<div>
			<div id="grid"></div>
		</div>
		<form class="span8 offset3" id="J_Form" action="" method="post">
			<input id="btnSave" value="提交" class="button button-primary">
		</form>
	</body>
	<%@ include file="../common/common_footer.jsp" %>
	<script src="http://g.alicdn.com/bui/bui/1.1.21/seed-min.js"></script>
<%--
	<script src="resources/lib/bui/seed-min.js"></script>
--%>
	<script src="resources/js/game/grid.js"></script>

</html>