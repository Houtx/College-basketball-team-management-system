//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)

var trainingDetail = {
    URL: {
        parent: function () {
            return "training/trainingMngPage";
        },
        addAndEdit: function () {
            return 'training/trainingAddAndEditAction';
        },
    },

    op: {
        init: function () {
            debugger;
            schoolNameUtil.init('schoolName');
            trainingDetail.op.setFormValidator();
            var opType = $('#opType').val();
            //1编辑 2添加
            if(opType=="1"){
                trainingDetail.op.handleEdit();
            }
            myToastr.init();
        },
        setFormValidator: function () {
            $("#trainingForm").validate({
                focusCleanup: false,
                rules: {
                    schoolName: {
                        required: true,
                        remote: {
                            url: schoolNameUtil.url.validate, //后台处理程序
                            type: "get", //数据发送方式
                            dataType: "json", //接受数据格式
                            contentType: "application/json;charset=UTF-8",
                        },
                    },
                    title: {
                        required: true,
                    },
                },
                messages: {
                    title: {
                        required: "请输入计划名",
                    },
                    schoolName: {
                        required: "请输入校名",
                        remote: schoolNameUtil.validateMsg
                    },
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
            window.document.location = trainingDetail.URL.parent();
        },
        successBack: function () {
            setTimeout("trainingDetail.op.back()", 800);
        },
        submitForm: function () {
            var access = $("#trainingForm").valid();
            if (!access) {
                return;
            }
            var url;
            var trainingType = $('#opType').val();
            if (trainingType == "1") {
                var trainingId = $('#trainingId').val();
               // url = trainingDetail.URL.edit()+"&trainingId="+trainingId;
            } else {
                url = trainingDetail.URL.addAndEdit();
            }
            $('#btnSave').attr('disabled', true);
            $.post(url, $('#trainingForm').serialize(), function (result) {
                if (result.success) {
                    toastr.success(result.msg);
                    trainingDetail.op.successBack();
                } else {
                    toastr.error(result.msg);
                    $('#btnSave').attr('disabled', false);
                }
            }, 'json');
        },

        handleDetail: function () {
            $('#title').html("&nbsp;赛事管理&nbsp;&nbsp;>&nbsp;&nbsp;赛事详情");
            $('#btnSave').hide();
            $('#file').attr('disabled', true);
            $('#trainingName').attr('disabled', true);
            $('#introduction').attr('disabled', true);
            var editState = $('#trainingEditP').val();
            if (editState == 1) {
                $('#btnEdit').show();
            }
        },

        handleEdit: function () {
            $('#title').html("&nbsp;赛事管理&nbsp;&nbsp;>&nbsp;&nbsp;修改赛事");
            $('#schoolName').attr('disabled', true);
        },

    }
}

$(function () {
    trainingDetail.op.init();
});