layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //用户列表展示
    var tableIns = table.render({
        elem: '#roleList',
        url: ctx + '/role/list',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "roleListTable",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {field: "id", title: '编号', fixed: "true"},
            {field: 'roleName', title: '角色名', align: "center"},
            {field: 'roleRemark', title: '角色备注', align: 'center'},
            {field: 'createDate', title: '创建时间', align: 'center'},
            {field: 'updateDate', title: '更新时间', align: 'center'},
            {title: '操作', templet: '#saleChanceListBar', fixed: "right", align: "center", minWidth: 150}
        ]]
    });

    // 多条件搜索
    $(".search_btn").on("click", function () {
        table.reload("roleListTable", {
            page: {
                curr: 1
            },
            where: {
                roleName: $("input[name='roleName']").val(),// 角色名
            }
        })
    });

    /**
     * 打开添加或更新对话框
     */
    function openAddOrUpdateRoleDialog(id) {
        var title = "角色管理-角色添加";
        var url = ctx + "/role/addOrUpdateRolePage";
        if (id) {
            title = "用户管理-用户更新";
            url = url + "?id=" + id;
        }
        layui.layer.open({
            title: title,
            type: 2,
            area: ["700px", "500px"],
            maxmin: true,
            content: url
        })
    };

    // 头工具栏事件
    table.on('toolbar(roleList)', function (obj) {
        switch (obj.event) {
            case "add":
                openAddOrUpdateRoleDialog();
                break;
            case "permissoin":
                openAddGrandtDialog(table.checkStatus(obj.config.id).data);
                break;
        }
    });
    //行工具栏事件
    table.on('tool(roleList)', function (obj) {
        var layEvent = obj.event;
        if (layEvent === "edit") {
            openAddOrUpdateRoleDialog(obj.data.id);
        } else if (layEvent === "del") {
            layer.confirm("确认删除当前记录?", {icon: 3, title: "角色管理"}, function (index) {
                $.post(ctx + "/role/delete", {roleId: obj.data.id}, function (data) {
                    if (data.code == 200) {
                        layer.msg("删除成功");
                        tableIns.reload();
                    } else {
                        layer.msg(data.msg);
                    }
                })
            })
        }
    });

    //打开添加权限的对话框
    function openAddGrandtDialog(datas) {
        if (datas.length == 0) {
            layer.msg("请选择待授权的角色", {icon: 5});
            return;
        }
        if (datas.length > 1) {
            layer.msg("不支持此操作", {icon: 5});
            return;
        }
        layui.layer.open(
            {
                title: "角色管理-角色授权",
                type: 2,
                area: ["700px", "500px"],
                maxmin: true,
                content: ctx + "/role/toAddGrantPage?roleId=" + datas[0].id,
                end:function() {
                    location.reload();
                }
            }
        )
    }

})