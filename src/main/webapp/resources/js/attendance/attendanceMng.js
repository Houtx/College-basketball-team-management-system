var attendanceMng = {
    serachClick: function () {
        $("#tb_attendance").bootstrapTable('refresh');
    },

    URL: {
        getAttendances: function () {
            return 'attendance/attenDanceGetAction';
        },
        detail: function () {
            return 'attendance/attendanceDetailPage';
        },
        delete: function () {
            return "attendance/attendanceDelAction";
        },
        downLoad: function () {
            return "attendance/downLoadModel";
        },
    },

    init: function () {
        $('#datetimepickerDiv').datetimepicker({
            format: 'YYYY-MM'//日期格式化，只显示日期
        });

        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();
        $('#file').change(
            function () {
                var myFile = file.files[0];
                var fileNameStr = myFile.name.split('.');
                var extendName = fileNameStr[fileNameStr.length - 1];
                extendName = extendName.toLowerCase();
                if (extendName != "xlsx") {
                    toastr.error("仅支持xlsx格式文件");
                    return;
                }
                $('#importForm').submit();
            }
        );
    }


}


var TableInit = function () {
    //debugger;
    var oTableInit = new Object();
    oTableInit.curPageNum = 0;
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_attendance').bootstrapTable({
            url: attendanceMng.URL.getAttendances(),         //请求后台的URL（*）
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
                width: '10px'
            }, {
                align: 'center',
                title: '学校',
                field: 'schoolName'
            }, {
                align: 'center',
                title: '时间',
                width: '140px',
                formatter: function (value, row, index) {
                    var date = new Date(row.date);
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var day = date.getDate();
                    return year + "-" + month + "-" + day;
                },
            }, {
                align: 'center',
                title: '姓名',
                field: 'userName'
            }, {
                align: 'center',
                title: '考勤',
                formatter: function (value, row, index) {
                    var res;
                    if (row.attend == "1") {
                        res = "出勤";
                    } else {
                        switch (row.absenceType) {
                            case 0:
                                res = "无故缺勤";
                                break;
                            case 1:
                                res = "病假";
                                break;
                            case 2:
                                res = "事假";
                                break;
                        }
                    }
                    return res;
                },
            }, {
                align: 'center',
                title: '操作',
                formatter: function (value, row, index, params) {
                    var editState = $('#attendanceEditP').val();
                    var detail = "<a style='margin-right: 30px' href=" + attendanceMng.URL.detail() + "?attendanceId=" + row.id + "&opType=0><i class='glyphicon glyphicon-eye-open'></i>&nbsp;详情</a>";
                    var edit = "<a href=" + attendanceMng.URL.detail() + "?attendanceId=" + row.id + "&opType=1><i class='glyphicon glyphicon-eye-open'></i>&nbsp;编辑</a>";
                    if (editState == 1) {
                        return detail + edit;
                    } else {
                        return detail;
                    }
                },
            }

            ]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        oTableInit.curPageNum = params.offset;
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            searchSchoolName: $('#searchSchoolName').val(),
            searchStuName: $('#searchStuName').val(),
            searchTime: $('#searchTime').val(),
            searchState: $('#searchState').val()
        };
        return temp;
    };
    return oTableInit;
};

var ButtonInit = function () {
    var oInit = new Object();

    oInit.Init = function () {

        $("#btn_model").click(function () {
            window.document.location = attendanceMng.URL.downLoad();
        });
        $("#btn_import").click(function () {
            $('#file').click();
        });

        $("#btn_export").click(function () {
            layer.open({
                type: 2,
                title: '导出数据',
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                area: ['700px', '270px'],
                content: "attendance/exportPage"
            });
        });

        $("#btn_add").click(function () {
            window.document.location = attendanceMng.URL.detail() + "?opType=2";
        });

        $("#btn_delete").click(function () {
            var arrselections = $("#tb_attendance").bootstrapTable('getSelections');
            if (arrselections.length <= 0) {
                toastr.warning('请选择至少一条数据');
                return;
            }
            var select = new Array();
            for (var i = 0; i < arrselections.length; i++) {
                var selectAttendance = new Object();
                selectAttendance.id = arrselections[i].id;
                select.push(selectAttendance);
            }

            Ewin.confirm({message: "确认要删除选择的评论吗？"}).on(function (e) {
                if (!e) {
                    return;
                }
                $.ajax({
                    type: "post",
                    url: attendanceMng.URL.delete(),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(select),
                    success: function (data, status) {
                        if (data.success) {
                            toastr.success(data.msg);
                            $("#tb_attendance").bootstrapTable('refresh');
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

$(function () {
    attendanceMng.init();
    //初始化消息框位置
    myToastr.init();
    //初始化模态框位置
    myDialog.init();
});