//存放主要交互逻辑的js代码
// javascript 模块化(package.类.方法)
var userDetail = {
    URL: {
        parent:function () {
            return "user/userMngPage";
        },
        add: function() {
            return 'user/userAddAction/';
        },
        validateName:function(){
            return "/user/userValidateAction";
        },
        edit:function () {
            return "user/userEditAction";
        }
    },

    validator: {
        validateAll: function() {
            this.validateuserName();
            return true;
        },

        validateuserName: function(userName) {
            console.log("validateuserName");
        },

    },

    userAdd: {
        init: function() {
            userDetail.userAdd.initPic();
            userDetail.userAdd.setFormValidator();
            var userType = $('#type').val();
            if(userType=="0"){
                userDetail.userAdd.handleDetail();
            }else if(userType=="1"){
                userDetail.userAdd.handleEdit();
            }
            myToastr.init();
        },

        initPic:function () {
            var schLogo = $('#schLogo').val();
            if (schLogo != "") {
                $('#imgDiv').css("background", "url(resources/images/common/" + schLogo+ ")");
                $('#imgDiv').css("background-size", "100% 100%");
            }

        },
        setFormValidator:function () {
            $("#userForm").validate({
                focusCleanup:false,
                rules: {
                    userName: {
                        required: true,
                        remote: {
                            url: userDetail.URL.validateName(),     //后台处理程序
                            type: "get",               //数据发送方式
                            dataType: "json",           //接受数据格式
                            contentType: "application/json;charset=UTF-8",
                        },
                    },
                },
                messages: {
                    userName: {required:"请输入校名",remote:"该账号已被注册"},
                },
                errorPlacement: function(error, element) {
                    if(error[0].innerHTML != " ") {
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
                        $('#' + errorMsgId).html(errorMsg+'&nbsp;');
                        $('#' + errorMsgId).css('visibility', 'visible');
                    }
                },
                success: function(label) {
                    var errorMsgId = label[0].id;
                    $('#' + errorMsgId).parent().removeClass('has-error');
                    $('#' + errorMsgId).css('visibility', 'hidden');
                }

            });
        },
        fileChange: function() {
            //因为可以一次上传多个文件所以要写file.files[0]表示第一个文件
            var myFile =file.files[0];
            if(!myValidator.picValidator(myFile)){
                return;
            }
            var url = window.URL.createObjectURL(myFile);
            $('#imgDiv').css("background", "url(" + url + ")");
            $('#imgDiv').css("background-size", "100% 100%");
            //参考文档  https://developer.mozilla.org/en-US/docs/Using_files_from_web_applications
            $("#headImgForm").submit();
        },
        back:function () {
            window.document.location=userDetail.URL.parent();
        },
        successBack:function () {
            setTimeout("userDetail.userAdd.back()",1200);
        },
        submitForm: function() {
            var result =  $("#userForm").valid();
            var fileError = $('#file-error').css('visibility');

            if(!result || fileError!='hidden'){
                return;
            }
            var fileName = $("#file").val();

            var url;
            var userType = $('#type').val();
            
            if(userType=="1"){
                url=userDetail.URL.edit();
            }else {
                url=userDetail.URL.add();
            }

            //判断是否修改图片
            if(fileName==""|| ( typeof (fileName)=='undefined')){
                //无修改图片则无操作
            }else{
                //做一个标识图片修改了
                url=url+"?pic=1";
            }

            $('#btnSave').attr('disabled',true);
            $.post(url, $('#userForm').serialize(), function(result) {
                if (result.success) {
                    if(userType=="1"){
                        toastr.success('修改成功');
                    }else{
                        toastr.success('添加成功');
                    }
                    userDetail.userAdd.successBack();
                } else {
                    toastr.error('添加失败');
                    $('#btnSave').attr('disabled',false);
                }
            }, 'json');
        },

        handleDetail:function () {
            $('#title').html("&nbsp;人员管理&nbsp;&nbsp;>&nbsp;&nbsp;人员详情");
            $('#btnSave').hide();

            $('#file').attr('disabled',true);
            $('#account').attr('disabled',true);
            $('#schoolName').attr('disabled',true);
            $('#name').attr('disabled',true);
            $('#grade').attr('disabled',true);
            $('#height').attr('disabled',true);
            $('#weight').attr('disabled',true);
            $('#shirtNum').attr('disabled',true);


            var editState = $('#userEditP').val();
            if(editState==1){
                $('#btnEdit').show();
            }
        },

        handleEdit:function () {
            $('#title').html("&nbsp;人员管理&nbsp;&nbsp;>&nbsp;&nbsp;修改人员");

            $('#userName').attr('disabled',true);
            $('#account').attr('disabled',true);
        },

        handleEditBtn:function () {
            $('#type').val("1");
            $('#title').html("&nbsp;人员管理&nbsp;&nbsp;>&nbsp;&nbsp;修改人员");
            $('#btnSave').show();
            $('#btnEdit').hide();

            $('#file').attr('disabled',false);
            $('#account').attr('disabled',false);
            $('#schoolName').attr('disabled',false);
            $('#name').attr('disabled',false);
            $('#grade').attr('disabled',false);
            $('#height').attr('disabled',false);
            $('#weight').attr('disabled',false);
            $('#shirtNum').attr('disabled',false);
        },
    }
}

$(function () {
    userDetail.userAdd.init();
});