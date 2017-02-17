var userMng = {
    serachClick: function () {
        $("#tb_users").bootstrapTable('refresh');
    },

    URL: {
        getRoles: function () {
            return 'user/userGetAction';
        },
        add: function () {
            return 'user/userAddPage?type=0';
        },
        detailAndEdit: function () {
            return '/user/userAddPage?type=1';
        },
        delete: function () {
            return "/user/userDelAction";
        },
        changeState: function () {
            return "/user/userStateChangeAction";
        }
    },

    init: function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();
    }
}


var TableInit = function () {
    //debugger;
    var oTableInit = new Object();
    oTableInit.curPageNum = 0;
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_users').bootstrapTable({
            url: userMng.URL.getRoles(),         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 20],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                  //是否显示列筛选按钮
            showRefresh: false,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                title: null,
                checkbox: true,
                width: '4%'
            }, {
                align: 'center',
                title: '序号',
                formatter: function (value, row, index) {
                    return index + 1 + oTableInit.curPageNum;
                },
                width: '4%'
            }, {
                align: 'center',
                field: 'realName',
                title: '姓名',
                width: '20%'
            }, {
                align: 'center',
                title: '性别',
                formatter: function (value, row, index) {
                    if (row.sex == 0) {
                        return "男";
                    }else{
                        return "女";
                    }
                },
                width: '4%'
            }, {
                align: 'center',
                field: 'role.school.schName',
                title: '校名',
                width: '25%'
            }, {
                align: 'center',
                field: 'role.roleName',
                title: '角色',
                width: '10%'
            }, {
                align: 'center',
                title: '状态',
                formatter: function (value, row, index) {
                    if (row.state == 1)
                        return "正常";
                    else
                        return "禁用";
                },
                width: '8%'
            }, {
                width: '25%',
                align: 'center',
                title: '操作',
                formatter: function (value, row, index, params) {
                    var editState = $('#userEditP').val();
                    var detail = "<a href=" + userMng.URL.detailAndEdit() + "?userId=" + row.id + "&type=0><i class='glyphicon glyphicon-eye-open'></i>&nbsp;查看</a>";
                    var edit = "<a href=" + userMng.URL.detailAndEdit() + "?userId=" + row.id + "&type=1 style='margin-left: 30px'><i class='glyphicon glyphicon-pencil'></i>&nbsp;编辑</a>";
                    if (editState == 1) {
                        return detail + edit;
                    } else {
                        return detail;
                    }
                },
            },]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        oTableInit.curPageNum = params.offset;
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            userName: $('#searchUserName').val(),
            schoolName: $('#searchSchoolName').val(),
        };
        return temp;
    };
    return oTableInit;
};

var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        $("#btn_add").click(function () {
            window.document.location = userMng.URL.add();
        });

        $("#btn_delete").click(function () {
            var arrselections = $("#tb_users").bootstrapTable('getSelections');
            if (arrselections.length <= 0) {
                toastr.warning('请选择至少一条数据');
                return;
            }
            var select = new Array();
            for (var i = 0; i < arrselections.length; i++) {
                var selectSchool = new Object();
                selectSchool.schId = arrselections[i].schId;
                select.push(selectSchool);
            }

            Ewin.confirm({message: "确认要删除选择的人员吗？"}).on(function (e) {
                if (!e) {
                    return;
                }
                $.ajax({
                    type: "post",
                    url: userMng.URL.delete(),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(select),
                    success: function (data, status) {
                        debugger;
                        if (data.success) {
                            toastr.success('删除成功');
                            $("#tb_users").bootstrapTable('refresh');
                        } else {
                            toastr.error(data.msg);
                        }
                    }

                });
            });
        });

        $("#btn_disable").click(function () {
            var arrselections = $("#tb_users").bootstrapTable('getSelections');
            if (arrselections.length <= 0) {
                toastr.warning('请选择至少一条数据');
                return;
            }
            var select = new Array();
            for (var i = 0; i < arrselections.length; i++) {
                var selectUser = new Object();
                selectUser.id = arrselections[i].id;
                selectUser.state = 0;
                select.push(selectUser);
            }

            Ewin.confirm({message: "确认要禁用选择的人员吗？"}).on(function (e) {
                if (!e) {
                    return;
                }
                $.ajax({
                    type: "post",
                    url: userMng.URL.changeState(),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(select),
                    success: function (data, status) {
                        debugger;
                        if (data.success) {
                            toastr.success('禁用成功');
                            $("#tb_users").bootstrapTable('refresh');
                        } else {
                            toastr.error('禁用失败');
                        }
                    }
                });
            });
        });


        $("#btn_enable").click(function () {
            var arrselections = $("#tb_users").bootstrapTable('getSelections');
            if (arrselections.length <= 0) {
                toastr.warning('请选择至少一条数据');
                return;
            }
            var select = new Array();
            for (var i = 0; i < arrselections.length; i++) {
                var selectUser = new Object();
                selectUser.id = arrselections[i].id;
                selectUser.state = 1;
                select.push(selectUser);
            }
            $.ajax({
                type: "post",
                url: userMng.URL.changeState(),
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(select),
                success: function (data, status) {
                    if (data.success) {
                        toastr.success('启用成功');
                        $("#tb_users").bootstrapTable('refresh');
                    } else {
                        toastr.error('启用失败');
                    }
                }
            });
        });
    };
    return oInit;
};


$(function () {
    userMng.init();
    //初始化消息框位置
    myToastr.init();
    //初始化模态框位置
    myDialog.init();
});