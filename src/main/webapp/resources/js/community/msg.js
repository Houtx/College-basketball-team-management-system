var msgMng = {
    serachClick: function () {
        $("#tb_msg").bootstrapTable('refresh');
    },

    URL: {
        getMsgs: function () {
            return 'community/msgGetAction';
        },
        changeState: function () {
            return 'community/msgChangeStateAction';
        }
    },

    init: function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
    },
    changeReadState: function (isRead,id,articleId) {
        if(isRead==0){
            $.get(msgMng.URL.changeState() + "?msgId=" + id, {}, function (data) {
                if (data.success) {
                    var msgNum = $("#msgNum", parent.document).html();
                    var afterNum = Number(msgNum)-1;
                    if(afterNum==0){
                        $("#msgNum", parent.document).removeClass('badge-danger');
                        $("#msgNum", parent.document).html("");
                    }else {
                        $("#msgNum", parent.document).html(afterNum+"");
                    }
                    window.document.location = '/community/detailPage?articleId=' + articleId;
                } else {
                    toastr.error("系统异常");
                }
            });
        }else {
            window.document.location = '/community/detailPage?articleId=' + articleId;
        }



    }
}


var TableInit = function () {
    //debugger;
    var oTableInit = new Object();
    oTableInit.curPageNum = 0;
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_msg').bootstrapTable({
            url: msgMng.URL.getMsgs(),         //请求后台的URL（*）
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
                title: '状态',
                formatter: function (value, row, index) {
                    if (row.isRead == 0) {
                        return "未读";
                    } else {
                        return "已读";
                    }
                },
            }, {
                align: 'center',
                title: '时间',
                width: '140px',
                formatter: function (value, row, index) {
                    var date = new Date(row.replytime);
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var day = date.getDate();
                    var hour = date.getHours();
                    var min = date.getMinutes();
                    return year + "-" + month + "-" + day + " " + hour + ":" + min;
                },
            }, {
                align: 'center',
                title: '回复人',
                field: 'replyName'
            }, {
                align: 'center',
                title: '内容',
                formatter: function (value, row, index) {
                    return row.content;
                },
            }, {
                align: 'center',
                title: '所属帖子',
                formatter: function (value, row, index) {
                    var html = "<a href='javascript:void(0)' onclick='msgMng.changeReadState("+row.isRead+","+row.id+"," + row.articleId +")'>" + row.articleTitle + "</a>";
                    return html;
                }
            }]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        oTableInit.curPageNum = params.offset;
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            userId: $('#userId').val()
        };
        return temp;
    };
    return oTableInit;
};


$(function () {
    msgMng.init();
    //初始化消息框位置
    myToastr.init();
    //初始化模态框位置
    myDialog.init();
});