layui.use(['table', 'treetable'], function () {
    var $ = layui.jquery,
        table = layui.table;
    treeTable = layui.treetable;

    treeTable.render({
        id: 'menu',
        treeColIndex: 1,	//树形图标显示在第几列
        treeSpid: 0,		//最上级的父级id
        treeIdName: 'id',	//id字段的名称
        treePidName: 'parentId',	//父级节点字段
        treeDefaultClose: true,	//是否默认折叠
        treeLinkage: false,		//父级展开时是否自动展开所有子级
        elem: '#moduleMenu',	//表格id
        url: ctx + '/module/list',
        toolbar: '#toolbarDemo',
        page: false,
        cols: [[
            {type: 'numbers'},
            {field: 'moduleName', align: 'center', title: '菜单名称'},
            {field: 'optValue', align: 'center', width: 70, title: '权限码'},
            {field: 'url', align: 'center', width: 70, title: '菜单url'},
            {field: 'createDate', align: 'center', width: 90, title: '创建时间'},
            {field: 'updateDate', align: 'center', width: 90, title: '更新时间'},
            {
                field: 'grade', align: 'center', width: 70, templet: function (d) {
                    if (d.grade == 0) {
                        return '<span class="layui-badge layui-bg-blue">目录</span>'
                    }
                    if (d.grade == 1) {
                        return '<span class="layui-badge-rim">菜单</span>'
                    }
                    if (d.grade == 2) {
                        return '<span class="layui-badge layui-bg-gray">按钮</span>'
                    }
                },
                title: '类型'
            },
            {templet: "#auth-state", align: 'center', title: '操作'}

        ]],
        //数据渲染完的回调
        done: function () {
            //关闭加载
            layer.closeAll('loading');

        }
    });

    // 头工具栏事件
    table.on('toolbar(moduleMenu)', function (obj) {
        switch (obj.event) {
            case "add":
                openAddModuleDialog(0, 0);
                break;
            case "expand":
                treeTable.expandAll('#moduleMenu');
                break;
            case "fold":
                treeTable.foldAll('#moduleMenu');
                break;

        }
    });

    //行工具栏
    table.on('tool(moduleMenu)', function (obj) {
        var layEvent = obj.event;
        if (layEvent === "add") {
            if (obj.data.grade == 2) {
                layer.msg("暂不支持四级菜单操作");
                return;
            }
            openAddModuleDialog(obj.data.grade + 1, obj.data.id);
        }
        if (layEvent === "edit") {
            openUpdModuleDialog(obj.data.id);
        }
        if (layEvent === "del") {
            layer.confirm("确认删除当前记录?", {icon: 3, title: "菜单管理"}, function (index) {
                $.post(ctx + "/module/delete", {id: obj.data.id}, function (data) {
                    if (data.code == 200) {
                        layer.msg("删除成功");
                        window.location.reload();
                    } else {
                        layer.msg(data.msg);
                    }
                })
            })
        }

    });

    /**
     * 打开添加对话框
     */
    function openAddModuleDialog(grade, parentId) {
        layui.layer.open({
            title: "菜单管理-菜单添加",
            type: 2,
            area: ["700px", "500px"],
            maxmin: true,
            content: ctx + "/module/addModulePage?grade=" + grade + "&parentId=" + parentId
        })
    };

    /**
     * 更新对话框
     */

    function openUpdModuleDialog(id) {
        layui.layer.open({
            title: "菜单管理-菜单更新",
            type: 2,
            area: ["700px", "500px"],
            maxmin: true,
            content: ctx + "/module/updateModulePage?id=" + id
        })
    }
})