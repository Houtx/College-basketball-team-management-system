/**
 * Created by Administrator on 2017/3/17.
 */

var psw={
    url:"user/updatePswAction",
    init:function(){
        myToastr.init();
        psw.setFormValidator();
    },

    setFormValidator: function () {
        $("#pswForm").validate({
            focusCleanup: false,
            rules: {
                focusCleanup: false,
                oldPsw: {
                    required: true,
                },
                newPsw: {
                    required: true,
                    rangelength:[6,16]
                }
            },
            messages: {
                oldPsw: {
                    required: "请输入密码",
                },
                newPsw: {
                    required: "请输入密码",
                }
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
    updatePsw:function() {
        if(!$("#pswForm").valid()){
            return;
        }
        var userId = $('#userId').val();
        var oldPsw = $('#oldPsw').val();
        var newPsw = $('#newPsw').val();
        var arry = [userId,oldPsw, newPsw];
        $('#btnUpdate').attr('disabled', true);
        $.ajax({
            type: "post",
            url: psw.url,
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(arry),
            success: function (data, status) {
                if (data.success) {
                    toastr.success(data.msg);
                    setTimeout(function () {
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    }, 800);
                } else {
                    toastr.error(data.msg);
                    $('#btnUpdate').attr('disabled', false);
                }
            }

        });
    }
}

$(function () {
    psw.init();
})

