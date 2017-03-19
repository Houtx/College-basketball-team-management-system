<%@include file="../common/tag.jsp" %>
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
    <title>训练计划添加</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
</head>

<body>
<div class="container-fluid">
    <input type="hidden" id="opType" value="${opType}">
    <input type="hidden" id="trainingId" value="${trainingId}">

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav">
            <div class="navContent">
                <i class="Hui-iconfont">&#xe62d;</i>&nbsp;训练计划&nbsp;&nbsp;>&nbsp;&nbsp;添加训练计划
            </div>
        </div>
    </div>

    <div class="row detailRow">
        <div class="col-xs-10 myColCenterBlock">
            <form class="form-horizontal myForm" role="form" id="trainingForm" method="post"
                  enctype="multipart/form-data">

                <div class="form-group">
                    <label for="schoolName" class="col-sm-1 control-label"><span class="requiredMsg">*</span>学校</label>
                    <div class="col-sm-11">
                        <input type="text" class="form-control" id="schoolName" name="schoolName" data-provide="typeahead">
                        <span class="help-block errorMsg" id="schoolName-error">&nbsp;</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="title" class="col-sm-1 control-label"><span class="requiredMsg">*</span>计划名</label>
                    <div class="col-sm-11">
                        <input type="text" class="form-control" id="title" name="title">
                        <span class="help-block errorMsg" id="title-error">&nbsp;</span>
                    </div>
                </div>
                <!--星期一-->

                <div class="form-group ">
                    <label class="col-sm-1 control-label ">星期一</label>
                    <div class="col-sm-3 ">
                        <input type="text " style="visibility: hidden; ">
                        <span class="help-block errorMsg">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType11" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType11" class="form-control" name="tType11">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType11-error">&nbsp;</span>

                    </div>

                    <label for="tContent11" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent11" name="tContent11">
                        <span class="help-block errorMsg" id="tContent11-error">&nbsp;</span>
                    </div>

                    <label for="tCost11" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost11" name="tCost11">
                        <span class="help-block errorMsg" id="tCost11-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType12" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType12" class="form-control" name="tType12">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType12-error">&nbsp;</span>

                    </div>

                    <label for="tContent12" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent12" name="tContent12">
                        <span class="help-block errorMsg" id="tContent12-error">&nbsp;</span>
                    </div>

                    <label for="tCost12" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost12" name="tCost12">
                        <span class="help-block errorMsg" id="tCost12-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType13" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType13" class="form-control" name="tType13">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType13-error">&nbsp;</span>

                    </div>

                    <label for="tContent13" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent13" name="tContent13">
                        <span class="help-block errorMsg" id="tContent13-error">&nbsp;</span>
                    </div>

                    <label for="tCost13" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost13" name="tCost13">
                        <span class="help-block errorMsg" id="tCost13-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType14" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType14" class="form-control" name="tType14">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType14-error">&nbsp;</span>

                    </div>

                    <label for="tContent14" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent14" name="tContent14">
                        <span class="help-block errorMsg" id="tContent14-error">&nbsp;</span>
                    </div>

                    <label for="tCost14" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost14" name="tCost14">
                        <span class="help-block errorMsg" id="tCost14-error">&nbsp;</span>
                    </div>
                </div>

                <!--星期二-->
                <div class="form-group ">
                    <label class="col-sm-1 control-label ">星期二</label>
                    <div class="col-sm-3 ">
                        <input type="text " style="visibility: hidden; ">
                        <span class="help-block errorMsg">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType21" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType21" class="form-control" name="tType21">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType21-error">&nbsp;</span>

                    </div>

                    <label for="tContent21" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent21" name="tContent21">
                        <span class="help-block errorMsg" id="tContent21-error">&nbsp;</span>
                    </div>

                    <label for="tCost21" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost21" name="tCost21">
                        <span class="help-block errorMsg" id="tCost21-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType22" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType22" class="form-control" name="tType22">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType22-error">&nbsp;</span>

                    </div>

                    <label for="tContent22" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent22" name="tContent22">
                        <span class="help-block errorMsg" id="tContent22-error">&nbsp;</span>
                    </div>

                    <label for="tCost22" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost22" name="tCost22">
                        <span class="help-block errorMsg" id="tCost22-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType23" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType23" class="form-control" name="tType23">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType23-error">&nbsp;</span>

                    </div>

                    <label for="tContent23" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent23" name="tContent23">
                        <span class="help-block errorMsg" id="tContent23-error">&nbsp;</span>
                    </div>

                    <label for="tCost23" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost23" name="tCost23">
                        <span class="help-block errorMsg" id="tCost23-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType24" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType24" class="form-control" name="tType24">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType24-error">&nbsp;</span>

                    </div>

                    <label for="tContent24" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent24" name="tContent24">
                        <span class="help-block errorMsg" id="tContent24-error">&nbsp;</span>
                    </div>

                    <label for="tCost24" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost24" name="tCost24">
                        <span class="help-block errorMsg" id="tCost24-error">&nbsp;</span>
                    </div>
                </div>

                <!--星期三-->
                <div class="form-group ">
                    <label class="col-sm-1 control-label ">星期三</label>
                    <div class="col-sm-3 ">
                        <input type="text " style="visibility: hidden; ">
                        <span class="help-block errorMsg">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType31" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType31" class="form-control" name="tType31">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType31-error">&nbsp;</span>

                    </div>

                    <label for="tContent31" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent31" name="tContent31">
                        <span class="help-block errorMsg" id="tContent31-error">&nbsp;</span>
                    </div>

                    <label for="tCost31" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost31" name="tCost31">
                        <span class="help-block errorMsg" id="tCost31-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType32" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType32" class="form-control" name="tType32">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType32-error">&nbsp;</span>

                    </div>

                    <label for="tContent32" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent32" name="tContent32">
                        <span class="help-block errorMsg" id="tContent32-error">&nbsp;</span>
                    </div>

                    <label for="tCost32" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost32" name="tCost32">
                        <span class="help-block errorMsg" id="tCost32-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType33" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType33" class="form-control" name="tType33">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType33-error">&nbsp;</span>

                    </div>

                    <label for="tContent33" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent33" name="tContent33">
                        <span class="help-block errorMsg" id="tContent33-error">&nbsp;</span>
                    </div>

                    <label for="tCost33" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost33" name="tCost33">
                        <span class="help-block errorMsg" id="tCost33-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType34" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType34" class="form-control" name="tType34">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType34-error">&nbsp;</span>

                    </div>

                    <label for="tContent34" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent34" name="tContent34">
                        <span class="help-block errorMsg" id="tContent34-error">&nbsp;</span>
                    </div>

                    <label for="tCost34" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost34" name="tCost34">
                        <span class="help-block errorMsg" id="tCost34-error">&nbsp;</span>
                    </div>
                </div>

                <!--星期四-->
                <div class="form-group ">
                    <label class="col-sm-1 control-label ">星期四</label>
                    <div class="col-sm-3 ">
                        <input type="text " style="visibility: hidden; ">
                        <span class="help-block errorMsg">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType41" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType41" class="form-control" name="tType41">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType41-error">&nbsp;</span>

                    </div>

                    <label for="tContent41" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent41" name="tContent41">
                        <span class="help-block errorMsg" id="tContent41-error">&nbsp;</span>
                    </div>

                    <label for="tCost41" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost41" name="tCost41">
                        <span class="help-block errorMsg" id="tCost41-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType42" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType42" class="form-control" name="tType42">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType42-error">&nbsp;</span>

                    </div>

                    <label for="tContent42" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent42" name="tContent42">
                        <span class="help-block errorMsg" id="tContent42-error">&nbsp;</span>
                    </div>

                    <label for="tCost42" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost42" name="tCost42">
                        <span class="help-block errorMsg" id="tCost42-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType43" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType43" class="form-control" name="tType43">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType43-error">&nbsp;</span>

                    </div>

                    <label for="tContent43" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent43" name="tContent43">
                        <span class="help-block errorMsg" id="tContent43-error">&nbsp;</span>
                    </div>

                    <label for="tCost43" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost43" name="tCost43">
                        <span class="help-block errorMsg" id="tCost43-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType44" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType44" class="form-control" name="tType44">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType44-error">&nbsp;</span>

                    </div>

                    <label for="tContent44" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent44" name="tContent44">
                        <span class="help-block errorMsg" id="tContent44-error">&nbsp;</span>
                    </div>

                    <label for="tCost44" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost44" name="tCost44">
                        <span class="help-block errorMsg" id="tCost44-error">&nbsp;</span>
                    </div>
                </div>

                <!--星期五-->
                <div class="form-group ">
                    <label class="col-sm-1 control-label ">星期五</label>
                    <div class="col-sm-3 ">
                        <input type="text " style="visibility: hidden; ">
                        <span class="help-block errorMsg">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType51" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType51" class="form-control" name="tType51">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType51-error">&nbsp;</span>

                    </div>

                    <label for="tContent51" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent51" name="tContent51">
                        <span class="help-block errorMsg" id="tContent51-error">&nbsp;</span>
                    </div>

                    <label for="tCost51" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost51" name="tCost51">
                        <span class="help-block errorMsg" id="tCost51-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType52" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType52" class="form-control" name="tType52">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType52-error">&nbsp;</span>

                    </div>

                    <label for="tContent52" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent52" name="tContent52">
                        <span class="help-block errorMsg" id="tContent52-error">&nbsp;</span>
                    </div>

                    <label for="tCost52" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost52" name="tCost52">
                        <span class="help-block errorMsg" id="tCost52-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType53" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType53" class="form-control" name="tType53">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType53-error">&nbsp;</span>

                    </div>

                    <label for="tContent53" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent53" name="tContent53">
                        <span class="help-block errorMsg" id="tContent53-error">&nbsp;</span>
                    </div>

                    <label for="tCost53" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost53" name="tCost53">
                        <span class="help-block errorMsg" id="tCost53-error">&nbsp;</span>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="tType54" class="col-sm-1 control-label ">类型</label>
                    <div class="col-sm-3 ">
                        <select id="tType54" class="form-control" name="tType54">
                            <option value="1">身体训练</option>
                            <option value="2">技术训练</option>
                            <option value="3">战术训练</option>
                            <option value="4">理论知识</option>
                        </select>
                        <span class="help-block errorMsg" id="tType54-error">&nbsp;</span>

                    </div>

                    <label for="tContent54" class="col-sm-1 control-label">内容</label>
                    <div class="col-sm-3">
                        <input type="text " class="form-control " id="tContent54" name="tContent54">
                        <span class="help-block errorMsg" id="tContent54-error">&nbsp;</span>
                    </div>

                    <label for="tCost54" class="col-sm-1 control-label ">用时(分)</label>
                    <div class="col-sm-3 ">
                        <input type="number" class="form-control " id="tCost54" name="tCost54">
                        <span class="help-block errorMsg" id="tCost54-error">&nbsp;</span>
                    </div>
                </div>
            </form>

            <div class="row" style="margin-bottom: 20px">
                <div class="col-sm-1">
                </div>
                <div class="col-sm-11">
                    <div style=" margin-left: auto; margin-right: auto;">
                        <input id="btnEdit" name="btnEdit" type="button"
                               onclick="schoolDetail.schoolAdd.handleEditBtn()" style="display:none;width: 100px;"
                               class="btn btn-primary" value="编辑"/>
                        <input id="btnSave" name="btnSave" type="button" onclick="trainingDetail.op.submitForm()"
                               style="width: 100px;" class="btn btn-primary" value="保存"/>
                        <input type="button" onclick=" trainingDetail.op.back()" style="width: 100px;"
                               class="btn btn-primary" value="返回"/>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/detail_footer.jsp" %>
<script src="resources/js/training/trainingDetail.js"></script>

</html>