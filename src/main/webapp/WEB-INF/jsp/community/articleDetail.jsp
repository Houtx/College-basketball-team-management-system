<%--
  Created by IntelliJ IDEA.
  User: jinzhany
  Date: 2017/3/4
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/basePath.jsp" %>
<%@ include file="../common/tag.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>帖子详情</title>
    <%@ include file="../common/common_head.jsp" %>
    <%@ include file="../common/detail_head.jsp" %>
    <link rel="stylesheet" type="text/css" href="resources/css/wangEditor.min.css">
    <style type="text/css">
        a {
            color: gray;
        }

        a:hover {
            text-decoration: none;
        }

        .container .article-msg {
            margin: 10px 0;
        }

        .container .article-msg span {
            position: relative;
            top: 1px;
            margin-right: 10px;
            font-size: 18px;
            color: #999999;
        }

        .article-comment {
            margin-bottom: 8px;
        }

        .circular-squareP {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .comment-list .comment-content {
            margin: 10px 0;
            border-top: 1px solid #E6E6E6;
        }

        .comment-list .note-comment .comment-content .comment-header {
            margin: 10px 0;
        }

        .comment-list .comment-footer {
            text-align: right;
        }

        .child-comment-list {
            border-left: 3px solid #BBBBBB;
            border-bottom: 1px dashed #E6E6E6;
            margin-bottom: 10px;
            margin: 10px 0;
        }

        .child-comment-list .child-comment {
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 10px;
            border-top: 1px dashed #BBBBBB;
        }

        .child-comment-list .child-comment > p {
            margin-bottom: 4px;
        }

        .child-comment-list > div > div > a {
            float: right;
        }

        .article-img {
            text-align: center
        }

        .article {
            padding: 0 0px 50px 0px;
        }

        .reply {
            margin-top: 8px;
        }

        /*        .wangEditor-container {
                    border-radius: 2%;
                }*/
    </style>
</head>

<body>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 myNav" style="padding-left: 30px">
        <div class="navContent">
            <i class="Hui-iconfont">&#xe6c5;</i><span id="title">&nbsp;球队动态&nbsp;&nbsp;>&nbsp;&nbsp;帖子详情</span>
        </div>
    </div>
</div>
<div class="container">
    <div class="article">
        <h2>${articleDetail.title}</h2>
        <input type="hidden" id="articleId" value="${articleDetail.id}">
        <div class="article-msg">
            <span>${author}</span>
            <span>
                <fmt:formatDate value="${articleDetail.createTime}" pattern="yyyy-MM-dd HH:mm"/>
            </span>
        </div>

        <div id="article-content" class="article-content">
            <p>
                ${articleDetail.content}
            </p>
        </div>
        <div>
            <div id="myComment" style="height: 100px;"></div>
            <div style="margin-top: 10px" class="row">
                <div class="col-xs-offset-11 col-xs-1">
                    <input onclick="articleDetail.articleOp.sendComment()" style="width: 70px" type="button"
                           class="btn btn-primary" value="发送">
                </div>
            </div>
        </div>

        <c:if test="${articleDetail.commentDtos.size()!=0}">
            <div id="article-comment" class="article-comment">
                <c:forEach items="${articleDetail.commentDtos}" var="comment">
                    <!--评论列表-->
                    <input type="hidden" id="commentId">
                    <div class="comment-list">
                        <div class="comment-content">
                            <div class="comment-header" style="height: 50px;margin: 10px 0;">
                                <a href="javascript:void(0)" style="float: left;margin-right: 10px;">
                                    <img class="circular-squareP" src="resources/images/common/${comment.headPic}"/>
                                </a>

                                <p>
                                        ${comment.userName}
                                </p>

                                <span style="color: grey;">
                                 <fmt:formatDate value="${comment.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                                </span>
                            </div>
                            <p>${comment.content}</p>

                            <div class="comment-footer">
                                <input type="hidden" value="${comment.id}">
                                <a href="javascript:void(0)" onclick="articleDetail.articleOp.replyComment(this)">回复</a>
                            </div>

                            <c:if test="${comment.replyDtos.size()!=0}">
                                <div class="child-comment-list">
                                    <c:forEach items="${comment.replyDtos}" var="reply">
                                        <div class="child-comment">
                                            <div>${reply.content}</div>
                                            <div class="reply">
                                            <span>
                                            <fmt:formatDate value="${reply.createTime}"
                                                            pattern="yyyy-MM-dd HH:mm"/>
                                            </span>
                                                <input type="hidden" value="${comment.id}">
                                                <a href="javascript:void(0)"
                                                   onclick="articleDetail.articleOp.replyReply(this)">回复</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <c:if test="${moreFlag==1}">
                <p align="center">
                    <a href="javascript:void(0)"
                       onclick="articleDetail.articleOp.loadMore(${articleDetail.id},${offset},'${author}')">加载更多</a>
                </p>
            </c:if>

        </c:if>


    </div>

</div>
</body>
<%@ include file="../common/common_footer.jsp" %>
<%@ include file="../common/detail_footer.jsp" %>
<script type="text/javascript" src="resources/lib/wangEditor.min.js"></script>
<script type="text/javascript" src="resources/js/community/articleDetail.js"></script>

</html>
