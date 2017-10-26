//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)

var trainingDetail = {
    URL: {
        parent: function () {
            return "training/trainingMngPage";
        },
        getTraining: function () {
            return 'training/trainingDetailGetAction';
        },
        add: function () {
            return 'training/trainingAddAction';
        },
        edit: function () {
            return 'training/trainingEditAction';
        }
    },

    op: {
        init: function () {
            schoolNameUtil.init('schoolName');
            trainingDetail.op.setFormValidator();
            var opType = $('#opType').val();
            //1编辑 2添加
            if (opType != "2") {
                trainingDetail.op.initData();
                // 0 详情
                if(opType=="0"){
                    trainingDetail.op.handleDetail();
                }
                // trainingDetail.op.handleEdit();
            }
            myToastr.init();
        },

        initData: function () {
            var trainingId = $('#trainingId').val();
            $.get(trainingDetail.URL.getTraining() + "?id=" + trainingId, {}, function (data) {
                $('#title').val(data.title);
                $('#schoolName').val(data.schName);
                var k = 0;
                for (var i = 1; i <= 5; i++) {
                    for (var j = 1; j <= 4; j++) {
                       // debugger;
                        var trainingItem = data.trainingItems[k++];
                        var tId = "tId" + i + j;
                        var type = "tType" + i + j;
                        var content = "tContent" + i + j;
                        var cost = "tCost" + i + j;
                        $('#' + tId).val(trainingItem.id);
                        $('#' + type).val(trainingItem.item);
                        $('#' + content).val(trainingItem.content);
                        $('#' + cost).val(trainingItem.cost);
                    }
                }
            });
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
            var opType = $('#opType').val();
            $('#btnSave').attr('disabled', true);
            if (opType == "1") {
                var trainingId = $('#trainingId').val();
                var training = new Object();
                training.id = trainingId;
                training.title = $('#title').val();
                training.schName = $('#schoolName').val();
                training.trainingItems = new Array();
                for (var i = 1; i <= 5; i++) {
                    for (var j = 1; j <= 4; j++) {
                        var trainingItem = new Object();
                        var tId = "tId" + i + j;
                        var type = "tType" + i + j;
                        var content = "tContent" + i + j;
                        var cost = "tCost" + i + j;
                        trainingItem.id = $('#' + tId).val();
                        trainingItem.item = $('#' + type).val();
                        trainingItem.content = $('#' + content).val();
                        trainingItem.cost = $('#' + cost).val();
                        trainingItem.day = i;
                        trainingItem.traingingId = trainingId;
                        training.trainingItems.push(trainingItem);
                    }
                }
                $.ajax({
                    type: "post",
                    url: trainingDetail.URL.edit(),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(training),
                    success: function (data, status) {
                        if (data.success) {
                            toastr.success(data.msg);
                            trainingDetail.op.successBack();
                        } else {
                            toastr.error(data.msg);
                            $('#btnSave').attr('disabled', false);
                        }
                    }
                });
                return;
            } else {
                url = trainingDetail.URL.add();
            }
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
            //$('#title').html("&nbsp;训练计划&nbsp;&nbsp;>&nbsp;&nbsp;训练计划详情");

            $("input").attr('disabled', true);
            $("select").attr('disabled', true);

            $('#btnBack').attr('disabled', false);
            $('#btnSave').hide();
            $('#btnSave').attr('disabled', false);
            var editState = $('#trainingEditP').val();
            if (editState == 1) {
                $('#btnEdit').attr('disabled', false);
                $('#btnEdit').show();
            }
        },

        handleEdit: function () {
            //$('#title').html("&nbsp;赛事管理&nbsp;&nbsp;>&nbsp;&nbsp;修改赛事");
            $("input").attr('disabled', false);
            $("select").attr('disabled', false);
            $('#btnEdit').hide();
            $('#btnSave').show();
            $('#opType').val("1");
        },

    }
}

$(function () {
    trainingDetail.op.init();
});