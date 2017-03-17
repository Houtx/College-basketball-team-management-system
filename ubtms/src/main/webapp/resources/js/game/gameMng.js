var gameMng = {
    serachClick: function () {
        $("#tb_games").bootstrapTable('refresh');
    },

    URL: {
        getGames: function () {
            return 'game/gameGetAction';
        },
        editGameMsg: function () {
            return 'game/gameMsgAddAndEditPage?opType=1';
        },
        addGameMsg: function () {
            return 'game/gameMsgAddAndEditPage?opType=2';
        },
        editGameData:function () {
            return 'game/gameDataEditPage';
        },
        detail: function () {
            return '/game/gameDetailPage';
        },
        delete: function () {
            return "/game/gameDelAction";
        },

    },

    init: function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();
        $('#datetimepickerDiv').datetimepicker({
            format: 'YYYY-MM-DD',//日期格式化，只显示日期
        });
    }
}


var TableInit = function () {
    //debugger;
    var oTableInit = new Object();
    oTableInit.curPageNum = 0;
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_games').bootstrapTable({
            url: gameMng.URL.getGames(),         //请求后台的URL（*）
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
            }, {
                align: 'center',
                title: '序号',
                formatter: function (value, row, index) {
                    return index + 1 + oTableInit.curPageNum;
                },
                width:'10px'
            }, {
                align: 'center',
                field: 'startTime',
                title: '时间',
            }, {
                align: 'center',
                title: '状态',
                field:'state',
            },{
                align: 'center',
                title: '学校',
                field:'mySchoolName',
            },{
                align: 'center',
                title: '比分',
                field:'vsscore',
            },{
                align: 'center',
                title: '客队',
                field:'game.rival',
            },{
                align: 'center',
                title: '操作',
                formatter: function (value, row, index, params) {
                    var editState = $('#gameEditP').val();
                    var detail = "<a href=" + gameMng.URL.detail() + "?gameId=" + row.game.id +"><i class='glyphicon glyphicon-eye-open'></i>&nbsp;详情</a>";
                    var editGame = "<a href=" + gameMng.URL.editGameMsg() + "&gameId=" + row.game.id + " style='margin-left: 25px'><i class='glyphicon glyphicon-pencil'></i>&nbsp;编辑赛事</a>";
                    var editData = "<a href='javascript:void(0)' onclick='DataEditLayer.open(" + row.game.id + ")' style='margin-left: 25px'><i class='glyphicon glyphicon-pencil'></i>&nbsp;编辑数据</a>";
                    if (editState == 1) {
                        return detail + editGame +editData;
                    } else {
                        return detail;
                    }
                },
                width:'300px'
            },]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        oTableInit.curPageNum = params.offset;
        //debugger;
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            startTime: $('#searchSchoolName').val(),
            rival: $('#searchRival').val(),
            state:$('#state').val()//开始 结束
        };
        return temp;
    };
    return oTableInit;
};

var ButtonInit = function () {
    var oInit = new Object();

    oInit.Init = function () {
        $("#btn_add").click(function () {
            window.document.location = gameMng.URL.addGameMsg();
        });

        $("#btn_delete").click(function () {
            var arrselections = $("#tb_games").bootstrapTable('getSelections');
            if (arrselections.length <= 0) {
                toastr.warning('请选择至少一条数据');
                return;
            }
            var select = new Array();
            for (var i = 0; i < arrselections.length; i++) {
                var selectGame = new Object();
                selectGame.id = arrselections[i].game.id;
                select.push(selectGame);
            }

            Ewin.confirm({message: "确认要删除选择的赛程吗？"}).on(function (e) {
                if (!e) {
                    return;
                }
                $.ajax({
                    type: "post",
                    url: gameMng.URL.delete(),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(select),
                    success: function (data, status) {
                        if (data.success) {
                            toastr.success(data.msg);
                            $("#tb_games").bootstrapTable('refresh');
                        } else {
                            toastr.error(data.msg);
                        }
                    }

                });
            });
        });

    };
    return oInit;
};

var DataEditLayer = {
    url: gameMng.URL.editGameData(),
    open: function (id) {
        var dataUrl = DataEditLayer.url + "?gameId=" + id;
        var maxOpen = layer.open({
            type: 2,
            title: '编辑比赛数据',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['900px', '600px'],
            content: dataUrl,
            btn: ['保存'],
            yes: function(index, layero){
                debugger;
                //var a = $('#btnSaveAll').find(layero);
                //btnClick.click();
                //layero.find('#btnSaveAll').click();
            }
        });
        layer.full(maxOpen);
    },
}

$(function () {
    gameMng.init();
    //初始化消息框位置
    myToastr.init();
    //初始化模态框位置
    myDialog.init();
});