var communityMng = {
    serachClick: function () {
        $("#tb_community").bootstrapTable('refresh');
    },

    URL: {
        getArticles: function () {
            return 'community/articleGetAction';
        },
        addAndEdit: function () {
            return 'community/articleAddAndEditPage';
        },
        detail: function () {
            return 'community/detailPage';
        },
        delete: function () {
            return "community/articleDelAction";
        },
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
        $('#tb_community').bootstrapTable({
            url: communityMng.URL.getArticles(),         //请求后台的URL（*）
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
            },  {
                align: 'center',
                title: '学校',
                field:'schoolName'
            },{
                align: 'center',
                title: '时间',
                formatter: function (value, row, index) {
                    //debugger;
                    var date = new Date(row.createTime);
                    var year = date.getFullYear();
                    var month = date.getMonth()+1;
                    var day = date.getDate();
                    var hour = date.getHours();
                    var min = date.getMinutes();
                    return year+"-"+month+"-"+day+" "+hour+":"+min;
                },
            }, {
                align: 'center',
                title: '标题',
                field:'title'
            }, {
                align: 'center',
                title: '作者',
                field:'author'
            },{
                align: 'center',
                title: '操作',
                formatter: function (value, row, index) {
                    var editState = $('#communityEditP').val();
                    var detail = "<a href=" + communityMng.URL.detail() + "?articleId=" + row.id + "&author="+row.author+"&offset=0><i class='glyphicon glyphicon-eye-open'></i>&nbsp;查看</a>";
                    var edit = "<a href=" + communityMng.URL.addAndEdit() + "?articleId=" + row.id + "&opType=1 style='margin-left: 30px'><i class='glyphicon glyphicon-pencil'></i>&nbsp;编辑</a>";
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
            title: $('#searchTitle').val(),
            schoolName: $('#searchSchoolName').val()
        };
        return temp;
    };
    return oTableInit;
};

var ButtonInit = function () {
    var oInit = new Object();

    oInit.Init = function () {
        $("#btn_add").click(function () {
            window.document.location = communityMng.URL.addAndEdit()+"?opType=2";
        });

        $("#btn_delete").click(function () {
            var arrselections = $("#tb_community").bootstrapTable('getSelections');
            if (arrselections.length <= 0) {
                toastr.warning('请选择至少一条数据');
                return;
            }
            var select = new Array();
            for (var i = 0; i < arrselections.length; i++) {
                var selectArticle = new Object();
                selectArticle.id = arrselections[i].id;
                select.push(selectArticle);
            }

            Ewin.confirm({message: "确认要删除选择的帖子吗？"}).on(function (e) {
                if (!e) {
                    return;
                }
                $.ajax({
                    type: "post",
                    url: communityMng.URL.delete(),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(select),
                    success: function (data, status) {
                        if (data.success) {
                            toastr.success('删除成功');
                            $("#tb_community").bootstrapTable('refresh');
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
    communityMng.init();
    //初始化消息框位置
    myToastr.init();
    //初始化模态框位置
    myDialog.init();
});