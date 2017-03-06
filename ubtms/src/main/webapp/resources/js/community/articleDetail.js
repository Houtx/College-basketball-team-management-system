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
        replyComment: function (object) {
            var jqObject = $(object);
            var commentId = jqObject.prev().val();
            $('#commentId').val(commentId);
            var parent = jqObject.parent().next();
            if (parent.next().length != 0) {
                parent.next().remove();
                $('#commonId').val("");
                return;
            }
            var divId = "comment" + commentId + "Div";
            var editorId = "comment" + commentId + "Editor";
            debugger;
            parent.after("<div style='margin-top: 20px' id=" + divId + "><div id=" + editorId + " style='height: 120px;'></div><div style='margin-top: 10px' class='row'><div class='col-xs-offset-11 col-xs-1'><input onclick='articleDetail.articleOp.sendReply(\"" +divId+"\",\""+ editorId + "\")' style='width: 70px' type='button' class='btn btn-primary' value='发送'></div></div></div>");
            var editor = new wangEditor(editorId);
            editor.config.menus = [
                'emotion'
            ];
            editor.create();
            var children = parent.parent().children();
            var personMsgDom = children[0];
            var personName = "@" + personMsgDom.children[1].innerText + "：";
            editor.$txt.text(personName);
        },
        sendReply: function (divId,editorId) {
            debugger;
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
                        $('#' + divId).remove();
                        //toastr.success(data.msg);
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
                    articleTitle: {required: "标题"},
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


            // $.post(url, $('#articleForm').serialize(), function (result) {
            //     if (result.success) {
            //         if (articleType == "1") {
            //             toastr.success('修改成功');
            //         } else {
            //             toastr.success('添加成功');
            //         }
            //         articleDetail.articleOp.successBack();
            //     } else {
            //         toastr.error('添加失败');
            //         $('#btnSave').attr('disabled', false);
            //     }
            // }, 'json');
        },


    }
};

$(function () {
    articleDetail.articleOp.init();
});