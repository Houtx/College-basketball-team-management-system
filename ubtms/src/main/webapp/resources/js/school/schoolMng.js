
$(function () {
    //debugger;
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

   // debugger;
    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();
    //初始化消息框位置
    toastr.options = {positionClass:'toast-top-center',showDuration: "300",timeOut:"800"};
});


var TableInit = function () {
    //debugger;
    var oTableInit = new Object();
    oTableInit.curPageNum=0;
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_schools').bootstrapTable({
            url: 'school/schoolGetAction',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10,20],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                  //是否显示列筛选按钮
            showRefresh: false,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            height: 500,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                title:null,
                checkbox: true,
                width:'4%'
            }, {
                title: '序号',
                formatter:function(value,row,index){
                   return index+1+oTableInit.curPageNum;
                },
                width:'5%'
            },{
                field: 'schName',
                title: '校名',
                width:'51%'
            },{
                title: '状态',
                formatter:function(value,row,index){
                    debugger;
                    if(row.state==1)
                        return "正常";
                    else
                        return "已禁用";
                },
                width:'20%'
            }, {
                title: '操作',
                formatter:function(value,row,index,params){
                    debugger;
                    var editState = $('#schoolEdit').val();
                    var detail = "<a href='/school/schoolViewAndEditAction?schId="+row.schId+"&type=0'><i class='glyphicon glyphicon-eye-open'></i></a>";
                    var edit = "<a href='/school/schoolViewAndEditAction?schId="+row.schId+"&type=1' style='margin-left: 20px'><i class='glyphicon glyphicon-pencil'></i></a>";
                    if(editState==1){
                        return detail+edit;
                    }else {
                        return detail;
                    }
                },
                width:'20%'
            },]
        });
    };
    
    //得到查询的参数
    oTableInit.queryParams = function (params) {
        debugger;
        oTableInit.curPageNum=params.offset;
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset,  //页码
            // departmentname: $("#txt_search_departmentname").val(),
            // statu: $("#txt_search_statu").val()
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
            //debugger;
            window.document.location="school/schoolAddPage";
           //$("#myModalLabel").text("新增");
           //$("#myModal").find(".form-control").val("");
           //$('#myModal').modal()
           //postdata.DEPARTMENT_ID = "";
        });

        //$("#btn_edit").click(function () {
        //    var arrselections = $("#tb_departments").bootstrapTable('getSelections');
        //    if (arrselections.length > 1) {
        //        toastr.warning('只能选择一行进行编辑');

        //        return;
        //    }
        //    if (arrselections.length <= 0) {
        //        toastr.warning('请选择有效数据');

        //        return;
        //    }
        //    $("#myModalLabel").text("编辑");
        //    $("#txt_departmentname").val(arrselections[0].DEPARTMENT_NAME);
        //    $("#txt_parentdepartment").val(arrselections[0].PARENT_ID);
        //    $("#txt_departmentlevel").val(arrselections[0].DEPARTMENT_LEVEL);
        //    $("#txt_statu").val(arrselections[0].STATUS);

        //    postdata.DEPARTMENT_ID = arrselections[0].DEPARTMENT_ID;
        //    $('#myModal').modal();
        //});

        $("#btn_delete").click(function () {
           var arrselections = $("#tb_schools").bootstrapTable('getSelections');
           if (arrselections.length <= 0) {
               //toastr.warning('请选择有效数据');
               return;
           }
            for (var i=0;i<arrselections.length;i++){
                delete arrselections[i]["0"];
            }
            $.ajax({
                type: "post",
                url: "/school/schoolDelAction",
                dataType:"json",
                contentType:"application/json;charset=utf-8",
                data: JSON.stringify(arrselections),
                success: function (data, status) {
                    if (status == "success") {
                        toastr.success('提交数据成功');
                        $("#tb_schools").bootstrapTable('refresh');
                    }
                },
                error: function () {
                    toastr.error('Error');
                },
                complete: function () {

                }

            });
           // Ewin.confirm({ message: "确认要删除选择的数据吗？" }).on(function (e) {
           //     if (!e) {
           //         return;
           //     }
           //     $.ajax({
           //         type: "post",
           //         url: "/school/schoolDelAction",
           //         data: { "delList": JSON.stringify(arrselections) },
           //         success: function (data, status) {
           //             if (status == "success") {
           //                 toastr.success('提交数据成功');
           //                 $("#tb_schools").bootstrapTable('refresh');
           //             }
           //         },
           //         error: function () {
           //             toastr.error('Error');
           //         },
           //         complete: function () {
           //
           //         }
           //
           //     });
           // });
        });

        $("#btn_disable").click(function () {
            var arrselections = $("#tb_schools").bootstrapTable('getSelections');
            if (arrselections.length <= 0) {
                //toastr.warning('请选择有效数据');
                return;
            }
            for (var i=0;i<arrselections.length;i++){
                arrselections[i]["state"]=0;
                delete arrselections[i]["0"];
            }
            $.ajax({
                type: "post",
                url: "/school/schoolDisableAction",
                dataType:"json",
                contentType:"application/json;charset=utf-8",
                data: JSON.stringify(arrselections),
                success: function (data, status) {
                    if (status == "success") {
                        toastr.success('禁用成功');
                        $("#tb_schools").bootstrapTable('refresh');
                    }
                },
                error: function () {
                    toastr.error('禁用失败');
                },
                complete: function () {

                }

            });
            // Ewin.confirm({ message: "确认要删除选择的数据吗？" }).on(function (e) {
            //     if (!e) {
            //         return;
            //     }
            //     $.ajax({
            //         type: "post",
            //         url: "/school/schoolDelAction",
            //         data: { "delList": JSON.stringify(arrselections) },
            //         success: function (data, status) {
            //             if (status == "success") {
            //                 toastr.success('提交数据成功');
            //                 $("#tb_schools").bootstrapTable('refresh');
            //             }
            //         },
            //         error: function () {
            //             toastr.error('Error');
            //         },
            //         complete: function () {
            //
            //         }
            //
            //     });
            // });
        });

        //$("#btn_submit").click(function () {
        //    postdata.DEPARTMENT_NAME = $("#txt_departmentname").val();
        //    postdata.PARENT_ID = $("#txt_parentdepartment").val();
        //    postdata.DEPARTMENT_LEVEL = $("#txt_departmentlevel").val();
        //    postdata.STATUS = $("#txt_statu").val();
        //    $.ajax({
        //        type: "post",
        //        url: "/Home/GetEdit",
        //        data: { "": JSON.stringify(postdata) },
        //        success: function (data, status) {
        //            if (status == "success") {
        //                toastr.success('提交数据成功');
        //                $("#tb_departments").bootstrapTable('refresh');
        //            }
        //        },
        //        error: function () {
        //            toastr.error('Error');
        //        },
        //        complete: function () {

        //        }

        //    });
        //});

        //$("#btn_query").click(function () {
        //    $("#tb_departments").bootstrapTable('refresh');
        //});
    };

    return oInit;
};