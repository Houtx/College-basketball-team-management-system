//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)
var userDetail = {
    URL: {
        parent: function () {
            return "user/userMngPage";
        },
        add: function () {
            return 'user/userAddAction/';
        },
        validateAccount: function () {
            return "/user/userValidateAction";
        },
        edit: function () {
            return "user/userEditAction";
        },
    },

    validator: {
        validateuserName: function (userName) {
            console.log("validateuserName");
        },

    },

    userAdd: {
        init: function () {
            pic.initPic('headPic');
            userDetail.userAdd.setFormValidator();
            var opType = $('#opType').val();
            myToastr.init();
            schoolNameUtil.init('schoolName');
            if(opType!="2"){
                $('#password').val('aaa');
                $('#passwordDiv').hide();
                if (opType == "0") {
                    userDetail.userAdd.handleDetail();
                } else if (opType == "1") {
                    userDetail.userAdd.handleEdit();
                }
            }
        },

        setFormValidator: function () {
            $("#userForm").validate({
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
                    name: {
                        required: true,

                    },
                    account: {
                        required: true,
                        mobile:true,
                        remote: {
                            url: userDetail.URL.validateAccount(), //后台处理程序
                            type: "get", //数据发送方式
                            dataType: "json", //接受数据格式
                            contentType: "application/json;charset=UTF-8",
                        },
                    },
                    password: {
                        required: true,
                        rangelength:[6,16]
                    },
                    height: {
                        positiveNumber: true,
                    },
                    weight: {
                        positiveNumber: true,
                    },
                    shirtNum: {
                        positiveNumber: true,
                    },
                },
                messages: {
                    schoolName: {
                        required: "请输入校名",
                        remote: schoolNameUtil.validateMsg
                    },
                    name: {
                        required: "请输入姓名",
                    },
                    account: {
                        required: "请输入手机号",
                        remote: "该手机号已被注册"
                    },
                    password: {
                        required: "请输入密码",
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
        fileChange: function () {
            //因为可以一次上传多个文件所以要写file.files[0]表示第一个文件
            var myFile = file.files[0];
            if (!myValidator.picValidator(myFile)) {
                return;
            }
            var url = window.URL.createObjectURL(myFile);
            $('#imgDiv').css("background", "url(" + url + ")");
            $('#imgDiv').css("background-size", "100% 100%");
            //参考文档  https://developer.mozilla.org/en-US/docs/Using_files_from_web_applications
            $("#headImgForm").submit();
        },
        back: function () {
            window.document.location = userDetail.URL.parent();
        },
        successBack: function () {
            setTimeout("userDetail.userAdd.back()", 1200);
        },
        submitForm: function () {
            debugger;
            var result = $("#userForm").valid();
            var fileError = $('#file-error').css('visibility');

            if (!result || fileError != 'hidden') {
                return;
            }
            var fileName = $("#file").val();

            var url;
            var opType = $('#opType').val();

            if (opType == "1") {
                url = userDetail.URL.edit();
            } else {
                url = userDetail.URL.add();
            }

            //判断是否修改图片
            if (fileName == "" || (typeof(fileName) == 'undefined')) {
                //无修改图片则无操作
            } else {
                //做一个标识图片修改了
                url = url + "?pic=1";
            }
            $('#btnSave').attr('disabled', true);
            $.post(url, $('#userForm').serialize(), function (result) {
                if (result.success) {
                    if (opType == "1") {
                        toastr.success('修改成功');
                    } else {
                        toastr.success('添加成功');
                    }
                    userDetail.userAdd.successBack();
                } else {
                    toastr.error('添加失败:'+result.msg);
                    $('#btnSave').attr('disabled', false);
                }
            }, 'json');
        },

        handleDetail: function () {
            debugger;
            $('#title').html("&nbsp;人员管理&nbsp;&nbsp;>&nbsp;&nbsp;人员详情");
            $('#btnSave').hide();
            $("input[name='sex']").attr("disabled",true);
            $("input[name='duty']").attr("disabled",true);
            $("input[name='userType']").attr("disabled",true);
            $('#file').attr('disabled', true);
            $('#account').attr('disabled', true);
            $('#schoolName').attr('disabled', true);
            $('#name').attr('disabled', true);
            $('#grade').attr('disabled', true);
            $('#height').attr('disabled', true);
            $('#weight').attr('disabled', true);
            $('#shirtNum').attr('disabled', true);

            var editState = $('#userEditP').val();
            if (editState == 1) {
                $('#btnEdit').show();
            }
        },

        handleEdit: function () {
            $('#title').html("&nbsp;人员管理&nbsp;&nbsp;>&nbsp;&nbsp;修改人员")
            $("input[name='userType']").attr("disabled",true);
            $('#userName').attr('disabled', true);
            $('#schoolName').attr('disabled', true);
            $('#account').attr('disabled', true);
        },

        editBtnClick: function () {
            $('#opType').val("1");
            $('#title').html("&nbsp;人员管理&nbsp;&nbsp;>&nbsp;&nbsp;修改人员");
            $('#btnSave').show();
            $('#btnEdit').hide();
            $("input[name='sex']").attr("disabled",false);
            $("input[name='duty']").attr("disabled",false);
            $('#file').attr('disabled', false);
            $('#grade').attr('disabled', false);
            $('#height').attr('disabled', false);
            $('#weight').attr('disabled', false);
            $('#shirtNum').attr('disabled', false);
        },
        handleUserTypeChange: function () {
            debugger;
            var val = $("input[name='userType']:checked").val();
            if (val == "球员") {
                $('#gradeDiv').show();
                $('#heightDiv').show();
                $('#weightDiv').show();
                $('#shirtNumDiv').show();

                $("input[name='duty'][value='1']").attr("checked",true);
                $('#dutyDiv').show();
            } else {
                $('#gradeDiv').hide();
                $('#heightDiv').hide();
                $('#weightDiv').hide();
                $('#shirtNumDiv').hide();
                $('#dutyDiv').hide();

                $('#grade').val("");
                $('#height').val("");
                $('#weight').val("");
                $('#shirtNum').val("");
                $("input[name='duty'][value='1']").attr("checked",false);
                $("input[name='duty'][value='2']").attr("checked",false);
                $("input[name='duty'][value='3']").attr("checked",false);
                $("input[name='duty'][value='4']").attr("checked",false);
                $("input[name='duty'][value='5']").attr("checked",false);
            }
        },
    }
}

$(function () {
    userDetail.userAdd.init();
});