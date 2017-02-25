/**
 * Created by jinzhany on 2017/2/19.
 */


$(function () {
    myGrid.init();
    myToastr.init();
});

var myGrid = {
    gridData1: null,
    gridData2: null,
    gridPostData1: null,
    gridPostData2: null,
    enumObj: {
        "1": "控卫",
        "2": "分卫",
        "3": "小前锋",
        "4": "大前锋",
        "5": "中锋"
    },
    saveAll: function () {
        $('#btnSave1').click();
        $('#btnSave2').click();
        var list = new Array();
        list.push(myGrid.gridPostData1);
        list.push(myGrid.gridPostData2);
        $.ajax({
            type: "post",
            url: myGrid.url.edit,
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(list),
            success: function (data, status) {
                if (data.success) {
                    toastr.success('保存成功');
                    setTimeout(function () {
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    }, 800);
                } else {
                    alert("保存失败");
                    toastr.error();
                }
            }
        });
    },
    url: {
        edit: "game/gameDataEditAction?gameId="+$('#gameId').val(),
        getData: "game/gameDataGetAction"
    },
    init: function () {
        var gameId = $('#gameId').val();
        $.get(myGrid.url.getData + "?gameId=" + gameId, "", function (data) {
            debugger;
            myGrid.gridData1 = data[0];
            myGrid.gridData2 = data[1];
            $('#title1').show();
            $('#title2').show();
            $('#btnSaveAll').show();
            BUI.use(['bui/grid', 'bui/data'], function (Grid, Data) {
                var Store = Data.Store,
                    columns = [{
                        title: '姓名',
                        dataIndex: 'playerName',
                        editor: {
                            xtype: 'text',
                            validator: validFn,
                            editableFn: function (value, record) {
                                return false;
                            }
                        }

                    }, {
                        title: '位置',
                        dataIndex: 'duty',
                        editor: {
                            id: 'mySelect',
                            xtype: 'select',
                            items: myGrid.enumObj,
                            editableFn: function (value, record) {
                                return false;
                            }
                        },
                        renderer: Grid.Format.enumRenderer(myGrid.enumObj)
                    },

                        {
                            title: '得分',
                            dataIndex: 'score',
                            editor: {
                                xtype: 'number',
                                min: 0,
                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '出手',
                            dataIndex: 'shot',
                            editor: {
                                xtype: 'number',
                                min: 0,
                                rules: {
                                    required: true
                                }
                            }
                        }, {
                            title: '命中',
                            dataIndex: 'fieldGoal',
                            editor: {
                                xtype: 'number',
                                min: 0,
                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '三分出手',
                            dataIndex: 'threePointShot',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '三分命中',
                            dataIndex: 'threePointShotGoal',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, {
                            title: '篮板',
                            dataIndex: 'backboard',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '助攻',
                            dataIndex: 'assist',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '抢断',
                            dataIndex: 'steal',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '盖帽',
                            dataIndex: 'blockshot',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {

                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '失误',
                            dataIndex: 'turnover',
                            editor: {
                                xtype: 'number',
                                min: 0,
                                rules: {
                                    required: true
                                }
                            }
                        }
                    ];

                var editing = new Grid.Plugins.CellEditing({
                        triggerSelected: false //触发编辑的时候不选中行
                    }),

                    store = new Store({
                        data: myGrid.gridData1,
                        autoLoad: true
                    }),

                    grid = new Grid.Grid({
                        render: '#grid1',
                        columns: columns,
                        width: 900,
                        forceFit: true,
                        plugins: [editing, Grid.Plugins.CheckSelection, Grid.Plugins.ColumnChecked],
                        store: store
                    });

                grid.render();

                function validFn(value, obj) {
                    var records = store.getResult(),
                        rst = '';
                    BUI.each(records, function (record) {
                        if (record.a == value && obj != record) {
                            rst = '文本不能重复';
                            return false;
                        }
                    });
                    return rst;
                }

                $('#btnSave1').on('click', function () {
                    myGrid.gridPostData1 = store.getResult();
                });
            });

            BUI.use(['bui/grid', 'bui/data'], function (Grid, Data) {
                var Store = Data.Store,
                    columns = [{
                        title: '姓名',
                        dataIndex: 'playerName',
                        editor: {
                            xtype: 'text',
                            validator: validFn
                        }
                    }, {
                        title: '位置',
                        dataIndex: 'duty',
                        editor: {
                            id: 'mySelect',
                            xtype: 'select',
                            items: myGrid.enumObj,
                        },
                        renderer: Grid.Format.enumRenderer(myGrid.enumObj)
                    },

                        {
                            title: '得分',
                            dataIndex: 'score',
                            editor: {
                                xtype: 'number',
                                min: 0,
                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '出手',
                            dataIndex: 'shot',
                            editor: {
                                xtype: 'number',
                                min: 0,
                                rules: {
                                    required: true
                                }
                            }
                        }, {
                            title: '命中',
                            dataIndex: 'fieldGoal',
                            editor: {
                                xtype: 'number',
                                min: 0,
                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '三分出手',
                            dataIndex: 'threePointShot',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '三分命中',
                            dataIndex: 'threePointShotGoal',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, {
                            title: '篮板',
                            dataIndex: 'backboard',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '助攻',
                            dataIndex: 'assist',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '抢断',
                            dataIndex: 'steal',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '盖帽',
                            dataIndex: 'blockshot',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {

                                    required: true
                                }
                            }
                        }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                        {
                            title: '失误',
                            dataIndex: 'turnover',
                            editor: {
                                xtype: 'number',
                                min: 0,

                                rules: {
                                    required: true
                                }
                            }
                        }
                    ];
                var editing = new Grid.Plugins.CellEditing({
                        triggerSelected: false //触发编辑的时候不选中行
                    }),

                    store = new Store({
                        data: myGrid.gridData2,
                        autoLoad: true
                    }),

                    grid = new Grid.Grid({
                        render: '#grid2',
                        columns: columns,
                        width: 900,
                        forceFit: true,
                        tbar: { //添加、删除
                            items: [{
                                btnCls: 'button button-small',
                                text: '<i class="icon-plus"></i>添加',
                                listeners: {
                                    'click': addFunction
                                }
                            }, {
                                btnCls: 'button button-small',
                                text: '<i class="icon-remove"></i>删除',
                                listeners: {
                                    'click': delFunction
                                }
                            }]
                        },
                        plugins: [editing, Grid.Plugins.CheckSelection, Grid.Plugins.ColumnChecked],
                        store: store
                    });

                grid.render();

                //添加记录
                function addFunction() {

                    var newData = {
                        assist: 0,
                        backboard: 0,
                        blockshot: 0,
                        fieldGoal: 0,
                        score: 0,
                        shirtNum: 0,
                        shot: 0,
                        steal: 0,
                        threePointShot: 0,
                        threePointShotGoal: 0,
                        turnover: 0
                    };

                    store.addAt(newData, 0);
                    editing.edit(newData, 'a'); //添加记录后，直接编辑
                }

                //删除选中的记录
                function delFunction() {
                    var selections = grid.getSelection();
                    store.remove(selections);
                }

                function validFn(value, obj) {
                    var records = store.getResult(),
                        rst = '';
                    BUI.each(records, function (record) {
                        if (record.a == value && obj != record) {
                            rst = '文本不能重复';
                            return false;
                        }
                    });
                    return rst;
                }

                $('#btnSave2').on('click', function () {
                    // if (editing.isValid()) { //判断是否通过验证，如果在表单中，那么阻止表单提交
                        myGrid.gridPostData2 = store.getResult();
                    // }
                });
            });
            //grid end

        });
    }
}