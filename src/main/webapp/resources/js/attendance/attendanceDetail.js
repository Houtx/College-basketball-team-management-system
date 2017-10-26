//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)

var attendanceDetail = {
    URL: {
        parent: function () {
            return "attendance/attendanceMngPage";
        },
        add: function () {
            return 'attendance/attendanceAddAction';
        },
        edit: function () {
            return "attendance/attendanceEditAction";
        }
    },

    attendanceAdd: {
        initData:function () {
            var attend = $('#attend').val();
            var absenceType = $('#absenceType').val();
            if (attend == "1"){
                $("input[name='attendance'][value='1']").attr("checked",true);
            }else {
                $("input[name='attendance'][value='0']").attr("checked",true);
                $("input[name='reason'][value="+absenceType+"]").attr("checked",true);
                $('#reasonDiv').show();
            }
        },
        init: function () {
            $('#datetimepickerDiv').datetimepicker({
                format: 'YYYY-MM-DD',//日期格式化，只显示日期
            });
            schoolNameUtil.init('schoolName');
            attendanceDetail.attendanceAdd.setFormValidator();
            var opType = $('#opType').val();
            //1编辑 2添加
            if(opType!="2"){
                debugger;
                attendanceDetail.attendanceAdd.initData();
                if(opType=="0"){
                    attendanceDetail.attendanceAdd.handleDetail();
                }else {
                    $('#schoolName').attr('disabled', true);
                    attendanceDetail.attendanceAdd.handleEdit();
                }
            }
            myToastr.init();
        },
        setFormValidator: function () {
            $("#attendanceForm").validate({
                focusCleanup: false,
                rules: {
                    schoolName: {
                        required: true,
                        remote: {
                            url: schoolNameUtil.url.validate,     //后台处理程序
                            type: "get",               //数据发送方式
                            dataType: "json",           //接受数据格式
                            contentType: "application/json;charset=UTF-8",
                        }
                    },
                    aDate:{required: true},
                    stuName:{required: true},
                },
                messages: {
                    schoolName: {required: "请输入校名", remote: "该学校未注册"},
                    aDate:{required:"请选择日期"},
                    stuName:{required: "请输入姓名"}
                },
                errorPlacement: function (error, element) {
                    if (error[0].innerHTML != " ") {
                        var errorMsgId = error[0].id;
                        var errorMsg = error[0].innerHTML;
                        $('#' + errorMsgId).parent().addClass('has-error');
                        /*jquery validate设计有个很变态的问题
                         如果重写下面的success函数,当验证通过时jquery validate会
                         检测页面的的错误信息，然后删除，在该系统并不需要删除信息，只需要
                         将信息隐藏用来占一行当行距。所以当我们放置错误信息时需要额外加入&nbsp来占
                         一个位置，这样即使jquery validate删除错误信息后还有&nbsp帮我们占着位置

                         当然，如果你没有重写success函数，通过jquery validate验证后jquery validate
                         不会删除错误信息
                         */
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
            window.document.location = attendanceDetail.URL.parent();
        },
        successBack: function () {
            setTimeout("attendanceDetail.attendanceAdd.back()", 800);
        },
        submitForm: function () {
            var access = $("#attendanceForm").valid();
            if (!access) {
                return;
            }
            var url;
            var attendanceType = $('#opType').val();
            if (attendanceType == "1") {
                var attendanceId = $('#attendanceId').val();
                url = attendanceDetail.URL.edit()+"?attendanceId="+attendanceId+"&schoolName="+$('#schoolName').val();
            } else {
                url = attendanceDetail.URL.add();
            }
            $('#btnSave').attr('disabled', true);
            $.post(url, $('#attendanceForm').serialize(), function (result) {
                if (result.success) {
                    toastr.success(result.msg);
                    attendanceDetail.attendanceAdd.successBack();
                } else {
                    toastr.error(result.msg);
                    $('#btnSave').attr('disabled', false);
                }
            }, 'json');
        },

        handleAttendanceChange:function () {
            var val = $("input[name='attendance']:checked").val();
            if (val == "1"){
                $('#reasonDiv').hide();
            }else{
                $('#reasonDiv').show();
            }
        },
        handleDetail: function () {
            $('#title').html("&nbsp;考勤管理&nbsp;&nbsp;>&nbsp;&nbsp;考勤详情");
            $("input").attr('disabled', true);
            $('#btnSave').hide();
            $('#btnBack').attr('disabled', false);
            var editState = $('#attendanceEditP').val();
            if (editState == 1) {
                $('#btnEdit').attr('disabled', false);
                $('#btnEdit').show();
            }
        },

        handleEdit: function () {
           $('#title').html("&nbsp;考勤管理&nbsp;&nbsp;>&nbsp;&nbsp;修改考勤");
        },

    }
}

$(function () {
    attendanceDetail.attendanceAdd.init();
});