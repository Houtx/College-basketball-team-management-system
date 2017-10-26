/**
 * Created by Administrator on 2017/3/26.
 */


var personData = {
    charLine:null,
    url: {
        allData: "game/getAllDataAction",
        searchData: "game/getSearchDataAction"
    },
    op: {
        initPic:function () {
            var logo = $('#logo').val();
            if (logo != "") {
                $('#imgDiv').css("background", "url(resources/images/common/" + logo+ ")");
                $('#imgDiv').css("background-size", "100% 100%");
            }
        },

        init: function () {
            personData.op.initPic();
            $('#datetimepickerDiv').datetimepicker({
                format: 'YYYY',//日期格式化，只显示日期
            });
            personData.op.setAllData();
            personData.op.setSearchData();
        },
        setAllData: function () {
            $.get(personData.url.allData + "?playerId=" + $('#playerId').val(), {}, function (res) {
                if (res.success) {
                    var data = new Array();
                    var score = {
                        item: "场均得分",
                        value: res.data.score,
                        obj: res.data.playerName
                    };
                    var assist = {
                        item: "场均助攻",
                        value: res.data.assist,
                        obj: res.data.playerName
                    };
                    var backboard = {
                        item: "场均篮板",
                        value: res.data.backboard,
                        obj: res.data.playerName
                    };
                    var blockshot = {
                        item: "场均盖帽",
                        value: res.data.blockshot,
                        obj: res.data.playerName
                    };
                    var steal = {
                        item: "场均抢断",
                        value: res.data.steal,
                        obj: res.data.playerName
                    };
                    data.push(score);
                    data.push(assist);
                    data.push(backboard);
                    data.push(steal);
                    data.push(blockshot);
                    var chart = new G2.Chart({
                        id: 'c1',
                        forceFit: true,
                        height: 250,
                    });
                    chart.source(data, {
                        'value': {
                            min: 0,
                            max: 30,
                            tickCount: 3
                        }
                    });
                    chart.coord('polar');
                    chart.legend('obj', { // 配置具体字段对应的图例属性
                        title: null,
                        position: 'bottom'
                    });
                    chart.axis('item', { // 设置坐标系栅格样式
                        line: null
                    });
                    chart.axis('value', { // 设置坐标系栅格样式
                        grid: {
                            type: 'polygon' //圆形栅格，可以改成
                        }
                    });
                    chart.line().position('item*value').color('obj');
                    chart.point().position('item*value').color('obj').shape('circle');
                    chart.area().position('item*value').color('obj');
                    chart.render();
                } else {
                    toastr.error("加载数据失败");
                }
            });
        },


        setSearchData: function () {
            $.get(personData.url.searchData +"?playerId="+ $('#playerId').val() + "&searchTime=" + $('#searchTime').val(), {}, function (res) {
                if (res.success) {
                    var item = $('#searchType').val();
                    var myData = new Array();
                    for(x in res.data){
                        var object = new Object();
                        object.value = res.data[x][item];
                        var date = new Date(res.data[x].time);
                        var year = date.getFullYear();
                        var month = date.getMonth() + 1;
                        var day = date.getDate();
                        object.time =year + "-" + month + "-" + day;
                        myData.push(object);
                    }
                    if(personData.charLine==null){
                        personData.charLine = new G2.Chart({
                            time: {type: 'time'},
                            mask: 'yyyy-MM-dd',
                            id: 'c2',
                            forceFit: true,
                            height: 450
                        });
                    }
                    personData.charLine.clear();
                    personData.charLine.source(myData, {
                        // item: {
                        //     alias: '数值',
                        // },
                        // value: {
                        //     alias: '日期'
                        // }
                    });
                    personData.charLine.line().position('time*value').size(2);
                    personData.charLine.render();
                } else {
                    alert("加载数据失败");
                }
            });
        }
    }
};

$(function () {
    personData.op.init();
    myToastr.init();
})