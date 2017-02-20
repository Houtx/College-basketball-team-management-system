/**
 * Created by jinzhany on 2017/2/19.
 */


$(function () {
    grid.init();
});

var grid = {
    url: {
        add: "game/addAndEditDataAction?opType=2",
        edit: "game/addAndEditDataAction?opType=1",
    },
    init: function () {
        BUI.use(['bui/grid', 'bui/data'], function (Grid, Data) {
            var Store = Data.Store,
                enumObj = {"1": "控卫", "2": "分卫", "3": "小前锋", "4": "大前锋", "5": "中锋"},
                columns = [{
                    title: '姓名',
                    dataIndex: 'name',
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
                        items: enumObj,
                        rules: {
                            required: true
                        },
                    },
                    renderer: Grid.Format.enumRenderer(enumObj)
                },

                    {
                        title: '得分',
                        dataIndex: 'a',
                        editor: {
                            xtype: 'number',
                            min: '0',
                            rules: {
                                required: true
                            }
                        }
                    }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                    {
                        title: '出手',
                        dataIndex: 'b',
                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {
                                required: true
                            }
                        }
                    }, {
                        title: '命中',
                        dataIndex: 'c',

                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {
                                required: true
                            }
                        }
                    }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                    {
                        title: '三分出手',
                        dataIndex: 'd',
                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {
                                required: true
                            }
                        }
                    }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                    {
                        title: '三分命中',
                        dataIndex: 'e',
                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {
                                required: true
                            }
                        }
                    }, {
                        title: '篮板',
                        dataIndex: 'f',
                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {
                                required: true
                            }
                        }
                    }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                    {
                        title: '助攻',
                        dataIndex: 'g',
                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {
                                required: true
                            }
                        }
                    }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                    {
                        title: '抢断',
                        dataIndex: 'h',
                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {
                                required: true
                            }
                        }
                    }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                    {
                        title: '盖帽',
                        dataIndex: 'i',
                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {

                                required: true
                            }
                        }
                    }, //editor中的定义等用于 BUI.Form.Field.Text的定义
                    {
                        title: '失误',
                        dataIndex: 'j',

                        editor: {
                            xtype: 'number',
                            min: '0',

                            rules: {
                                required: true
                            }
                        }
                    }

                ],
                data = [{
                    name: "威少",
                    duty: "1",
                    a: 123,
                    b: 11,
                    c: 10,
                    d: 1,
                    e: 1,
                    f: 8,
                    g: 22,
                    h: 43,
                    i: 33,
                    j: 11
                }, {
                    name: "杜兰特",
                    a: 11,
                    b: 11,
                    c: 10,
                    d: 1,
                    e: 1,
                    f: 8,
                    g: 22,
                    h: 43,
                    i: 33,
                    j: 1
                }];


            var editing = new Grid.Plugins.CellEditing({
                    triggerSelected: false //触发编辑的时候不选中行
                }),

                store = new Store({
                    data: data,
                    autoLoad: true
                }),

                grid = new Grid.Grid({
                    render: '#grid',
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

            //添加记录
            function addFunction() {
                var newData = {
                    b: 0
                };
                store.addAt(newData, 0);
                editing.edit(newData, 'a'); //添加记录后，直接编辑
            }

            //删除选中的记录
            function delFunction() {
                var selections = grid.getSelection();
                store.remove(selections);
            }

            $('#btnSave').on('click', function () {
                if (editing.isValid()) { //判断是否通过验证，如果在表单中，那么阻止表单提交
                    var records = store.getResult();
                    $.ajax({
                        type: "post",
                        url: grid.url.edit,
                        dataType: "json",
                        contentType: "application/json;charset=utf-8",
                        data: JSON.stringify(records),
                        success: function (data, status) {
                            if (data.success) {
                                toastr.success('保存成功');
                            } else {
                                toastr.error();
                            }
                        }

                    });
                }
            });
        });
    }
}