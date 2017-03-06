//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)
var articleDetail = {
    editor:null,
    
    URL: {
        parent: function () {
            return "community/communityMngPage";
        },
        add: function () {
            return 'community/articleAddAction';
        },
        edit: function () {
            return "community/articleEditAction";
        }
    },

    articleOp: {
        init: function () {
            articleDetail.articleOp.setFormValidator();
            articleDetail.articleOp.setEditor();
            //var articleType = $('#opType').val();
            myToastr.init();
        },

        setEditor: function () {
            articleDetail.editor = new wangEditor('editor');
            /*     仅仅想移除某几个菜单，例如想移除『插入代码』和『全屏』菜单：
             其中的 wangEditor.config.menus 可获取默认情况下的菜单配置*/
            articleDetail.editor .config.menus = $.map(wangEditor.config.menus, function (item, key) {
                articleDetail.editor .config.uploadImgUrl = 'community/imgUpload';
                //取消网络url上传图片
                articleDetail.editor .config.hideLinkImg = true;
                if (item === 'source') {
                    return null;
                }
                if (item === 'video') {
                    return null;
                }
                if (item === 'location') {
                    return null;
                }
                if (item === 'insertcode') {
                    return null;
                }
                return item;
            });
            articleDetail.editor .create();
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
                    debugger;
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

        handleDetail: function () {
            $('#title').html("&nbsp;帖子管理&nbsp;&nbsp;>&nbsp;&nbsp;帖子详情");
            $('#btnSave').hide();
            $('#file').attr('disabled', true);
            $('#articleName').attr('disabled', true);
            $('#introduction').attr('disabled', true);
            var editState = $('#articleEditP').val();
            // editState=0;
            // debugger;
            if (editState == 1) {
                $('#btnEdit').show();
            }
        },

        handleEdit: function () {
            $('#title').html("&nbsp;帖子管理&nbsp;&nbsp;>&nbsp;&nbsp;修改帖子");
            $('#articleName').attr('disabled', true);
        },

    }
}

$(function () {
    articleDetail.articleOp.init();
});