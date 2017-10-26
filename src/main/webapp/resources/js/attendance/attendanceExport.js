/**
 * Created by Administrator on 2017/3/24.
 */

var attendanceExport = {
    init: function () {
        debugger;
        schoolNameUtil.init('schoolName');
        attendanceExport.setFormValidator();
        $('#datetimepickerDiv').datetimepicker({
            format: 'YYYY-MM'//日期格式化，只显示日期
        });
    },

    getData: function () {
        debugger;
        var access = $("#exportForm").valid();
        if (!access) {
            return;
        }
        var url = "attendance/exportAction?school=" + $('#schoolName').val() + "&time=" + $('#searchTime').val();
        window.document.location = url;
        //$.get(url);
    },

    setFormValidator: function () {
        $("#exportForm").validate({
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
                searchTime: {
                    required: true
                },
            },
            messages: {
                schoolName: {
                    required: "请输入校名",
                    remote: schoolNameUtil.validateMsg
                },
                searchTime: {required: "请选择月份"},

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
    }
}

$(function () {

    attendanceExport.init();
});
