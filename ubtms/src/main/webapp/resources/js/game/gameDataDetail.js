var TableInit = function () {
    var oTableInit = new Object();//初始化Table
    oTableInit.Init = function (tabId, sendUrl) {
        $('#' + tabId).bootstrapTable({
            url: sendUrl,         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                       //初始化加载第一页，默认第一页
            pageSize: 20,                       //每页的记录行数（*）
            pageList: [20],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: false,
            showColumns: false,                  //是否显示列筛选按钮
            showRefresh: false,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
            showToggle: false,                    //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            columns: [{
                align: 'center',
                field: 'playerName',
                title: '姓名',
            }, {
                align: 'center',
                title: '得分',
                field: 'score',
            }, {
                align: 'center',
                title: '号码',
                field: 'shirtNum',
            }, {
                align: 'center',
                title: '位置',
                formatter: function (value, row, index) {
                    switch (row.duty){
                        case 1:
                            return "控卫";
                        case 2:
                            return "分卫";
                        case 3:
                            return "小前锋";
                        case 4:
                            return "大前锋";
                        case 5:
                            return "中锋";
                    }
                },
            }, {
                align: 'center',
                title: '出手',
                field: 'shot',
            }, {
                align: 'center',
                title: '命中',
                field: 'fieldGoal'
            }, {
                align: 'center',
                title: '三分出手',
                field: 'threePointShot'
            }, {
                align: 'center',
                title: '三分命中',
                field: 'threePointShotGoal'
            }, {
                align: 'center',
                title: '篮板',
                field: 'backboard'
            }, {
                align: 'center',
                title: '助攻',
                field: 'assist'
            }, {
                align: 'center',
                title: '抢断',
                field: 'steal'
            }, {
                align: 'center',
                title: '盖帽',
                field: 'blockshot'
            }, {
                align: 'center',
                title: '失误',
                field: 'turnover'
            }]
        });
    };
    return oTableInit;
};


var gameDataDetail = {
    url: {
        getSchooData: "game/gameSchoolDataGetAction?gameId=" + $('#gameId').val(),
        getRivalData: "game/gameRivalDataGetAction?gameId=" + $('#gameId').val(),
        getChartData: "game/chartDataGetAction?gameId=" + $('#gameId').val(),
    },

    init: function () {
        var score = $('#score').text();
        if(score ==' - '|| score=='0 - 0'){
            return;
        }
        gameDataDetail.showChart();
        var oTable = new TableInit();
        $('#title1').show();
        $('#title2').show();

        oTable.Init('tb_school', gameDataDetail.url.getSchooData);
        oTable.Init('tb_rival', gameDataDetail.url.getRivalData);
    },

    showChart: function () {
        $.get(gameDataDetail.url.getChartData, "", function (myData) {
            var school = new Object();
            var rival = new Object();
            school.data = new Array();
            rival.data = new Array();
            school.name = $('#school').text();
            rival.name = $('#rival').text();

            if(myData[0].score<myData[1].score) {
                $('#schoolImgDiv').css("background", "url(resources/images/common/unhappy.png)");
                $('#schoolImgDiv').css("background-size", "100% 100%");
            }else if(myData[0].score>myData[1].score){
                $('#rivalImgDiv').css("background", "url(resources/images/common/unhappy.png)");
                $('#rivalImgDiv').css("background-size", "100% 100%");
            }


            var sp1 = myData[0].fieldGoal / myData[0].shot;
            sp1*=100;
            sp1 = sp1.toFixed(1);
            var sp2 = myData[0].threePointShotGoal / myData[0].threePointShot;
            sp2 = sp2.toFixed(3) * 100;
            var rp1 = myData[1].fieldGoal / myData[1].shot;
            rp1 = rp1.toFixed(3) * 100;
            var rp2 = myData[1].threePointShotGoal / myData[1].threePointShot;
            rp2 = rp2.toFixed(3) * 100;

            school.data[0] = myData[0].score;
            school.data[1] = sp1;
            school.data[2] = sp2;
            school.data[3] = myData[0].backboard;
            school.data[4] = myData[0].assist;
            school.data[5] = myData[0].steal;
            school.data[6] = myData[0].blockshot;
            school.data[7] = myData[0].turnover;
            rival.data[0] = myData[1].score;
            rival.data[1] = rp1;
            rival.data[2] = rp2;
            rival.data[3] = myData[1].backboard;
            rival.data[4] = myData[1].assist;
            rival.data[5] = myData[1].steal;
            rival.data[6] = myData[1].blockshot;
            rival.data[7] = myData[1].turnover;

            var newData = new Array();
            newData.push(school);
            newData.push(rival);
            var itemName = ['得分','命中率%', '三分命中率%', '篮板', '助攻', '抢断', '盖帽', '失误'];

            for (var i = 0; i < newData.length; i++) {
                var item = newData[i];
                var datas = item.data;
                for (var j = 0; j < datas.length; j++) {
                    item[itemName[j]] = datas[j];
                }
                newData[i] = item;
            }
            var Stat = G2.Stat;
            var Frame = G2.Frame;
            var frame = new Frame(newData);
            frame = Frame.combinColumns(frame,itemName, '数值', '项目', 'name');
            var chart = new G2.Chart({
                id: 'chart',
                forceFit: true,
                height: 300,
                plotCfg: {
                    margin: [20, 90, 60, 60]
                }
            });
            chart.source(frame);
            chart.col('name', {
                alias: " ",
            });
            chart.axis('项目', {
                title: null
            });
            chart.axis('数值', {
                title: null
            });
            chart.intervalDodge().position('项目*数值').color('name');
            chart.render();
        });
    }
}

$(function () {
    gameDataDetail.init();
});