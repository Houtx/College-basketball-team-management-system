//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)
var articleDetail = {
    editor: null,

    URL: {
        parent: function () {
            return "community/communityMngPage";
        },
        add: function () {
            return 'community/articleAddAction';
        },
        edit: function () {
            return "community/articleEditAction";
        },
        saveComment: function () {
            return "community/commentSaveAction";
        },
        saveReply: function () {
            return "community/replySaveAction";
        },
    },

    articleOp: {
        replyReply:function (object) {
            debugger;
            var jqObject = $(object);
            var commentId = jqObject.prev().val();
            $('#commentId').val(commentId);
            var contentNode = jqObject.parent().prev();
            var content = contentNode.text();
            var targetName = content.substr(0,content.indexOf("@"));
            var commentlistNode = jqObject.parent().parent().parent();
            var insertNode = commentlistNode.next();
            if(insertNode.length==0){
                var divId = "comment" + commentId + "Div";
                var editorId = "comment" + commentId + "Editor";
                commentlistNode.after("<div style='margin-top: 20px' id=" + divId + "><div id=" + editorId + " style='height: 120px;'></div><div style='margin-top: 10px' class='row'><div class='col-xs-offset-11 col-xs-1'><input onclick='articleDetail.articleOp.sendReply(\"" +divId+"\",\""+ editorId + "\")' style='width: 70px' type='button' class='btn btn-primary' value='发送'></div></div></div>");
                var editor = new wangEditor(editorId);
                editor.config.menus = [
                    'emotion'
                ];
                editor.create();
                var personName = "@" + targetName + "：";
                editor.$txt.html(personName);
            }else{
                var childEditor =insertNode.children(":first").children(":last");
                var childEditorContent = childEditor.text();
                var childTargetName = childEditorContent.substr(childEditorContent.indexOf("@")+1,childEditorContent.indexOf("：")-1);
                if(childTargetName==targetName){
                    insertNode.remove();
                    $('#commentId').val("");
                }else{
                    childEditor.html("");
                    childEditor.html("@" + targetName + "：");
                }
            }
        },
        replyComment: function (object) {
            var jqObject = $(object);
            var commentId = jqObject.prev().val();
            $('#commentId').val(commentId);
            var grandParent = jqObject.parent().parent();
            var siblings = grandParent.children();
            var len = siblings.length;
            var lastChild = siblings[len-1];
            var className = lastChild.className;
            var personMsgDom = siblings[0];
            var targetName = personMsgDom.children[1].innerText;
            lastChild = $(lastChild);
            if(className!="comment-footer" && className !="child-comment-list"){
                var childEditor =lastChild.children(":first").children(":last");
                var childEditorContent = childEditor.text();
                var childTargetName = childEditorContent.substr(childEditorContent.indexOf("@")+1,childEditorContent.indexOf("：")-1);
                if(childTargetName==targetName){
                    lastChild.remove();
                    $('#commentId').val("");
                }else{
                    childEditor.html("");
                    childEditor.html("@" + targetName + "：");
                }

            }else{
                var divId = "comment" + commentId + "Div";
                var editorId = "comment" + commentId + "Editor";
                lastChild.after("<div style='margin-top: 20px' id=" + divId + "><div id=" + editorId + " style='height: 120px;'></div><div style='margin-top: 10px' class='row'><div class='col-xs-offset-11 col-xs-1'><input onclick='articleDetail.articleOp.sendReply(\"" +divId+"\",\""+ editorId + "\")' style='width: 70px' type='button' class='btn btn-primary' value='发送'></div></div></div>");
                var editor = new wangEditor(editorId);
                editor.config.menus = [
                    'emotion'
                ];
                editor.create();
                var personName = "@" + targetName + "：";
                editor.$txt.html(personName);
            }

        },
        sendReply: function (divId,editorId) {
            var content = $('#' + editorId).html();
            var id = $('#commentId').val();
            var reply = new Object();
            reply.content = content;
            reply.commentId = id;
            $.ajax({
                type: "post",
                url: articleDetail.URL.saveReply(),
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(reply),
                success: function(data, status) {
                    if (data.success) {
                        window.location.reload();
                    } else {
                        toastr.error(data.msg);
                    }
                }
            });
        },
        init: function () {
            //articleDetail.articleOp.setFormValidator();
            articleDetail.articleOp.setEditor();
            //var articleType = $('#opType').val();
            myToastr.init();
        },

        setEditor: function () {
            articleDetail.editor = new wangEditor('myComment');
            articleDetail.editor.config.menus = [
                'emotion'
            ];
            articleDetail.editor.create();
        },

        sendComment: function () {
            var content = articleDetail.editor.$txt.html();
            if (content == "<p><br></p>") {
                return;
            }
            var comment = new Object();
            comment.content = content;
            comment.articleId = $('#articleId').val();
            $.ajax({
                type: "post",
                url: articleDetail.URL.saveComment(),
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(comment),
                success: function (data, status) {
                    if (data.success) {
                        toastr.success(data.msg);
                        window.location.reload();
                    } else {
                        toastr.error(data.msg);
                    }
                }
            });
        },

        setFormValidator: function () {
            $("#articleForm").validate({
                focusCleanup: false,
                rules: {
                    articleTitle: {
                        required: true
                    },
                },
                messages: {
                    articleTitle: {required: "请输入标题"},
                },
                errorPlacement: function (error, element) {
                    if (error[0].innerHTML != " ") {
                        var errorMsgId = error[0].id;
                        var errorMsg = error[0].innerHTML;
                        $('#' + errorMsgId).parent().addClass('has-error');
                        $('#' + errorMsgId).html(errorMsg + '&nbsp;');
                        $('#' + errorMsgId).css('visibility', 'visible');
                    }
                },
                success: function (label) {
                    var errorMsgId = label[0].id;
                    $('#' + errorMsgId).parent().removeClass('has-error');
                    $('#' + errorMsgId).css('visibility', 'hidden');
                }

            });
        },

        back: function () {
            window.document.location = articleDetail.URL.parent();
        },
        successBack: function () {
            setTimeout("articleDetail.articleOp.back()", 1000);
        },
        submitForm: function () {
            var result = $("#articleForm").valid();
            var content = articleDetail.editor.$txt.html();
            if (!result || '' == content) {
                return;
            }

            var url = articleDetail.URL.add();

            // var articleType = $('#opTpe').val();
            // //判断是否修改帖子
            // if (articleType == "1") {
            //     url = articleDetail.URL.edit();
            // } else {
            //     url = articleDetail.URL.add();
            // }

            // $('#btnExpress').attr('disabled', true);
            var article = new Object();
            article.title = $('#articleTitle').val();
            article.content = content;

            $.ajax({
                type: "post",
                url: url,
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(article),
                success: function (data, status) {
                    if (data.success) {
                        toastr.success(data.msg);
                        articleDetail.articleOp.successBack();
                    } else {
                        toastr.error(data.msg);
                    }
                }
            });

        },
        loadMore:function (articleId,offset,author) {
            debugger;
            window.document.location("community/detailPage?articleId="+articleId+"&offset="+offset+"&author="+author);
        }
    }
};

$(function () {
    articleDetail.articleOp.init();
});