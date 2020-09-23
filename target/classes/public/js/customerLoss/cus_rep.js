layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //计划项数据展示
    var tableIns = table.render({
        elem: '#cusRep',
        url: ctx + '/customer_rep/list?lossId=' + $("input[name='id']").val(),
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "cusDevPlanListTable",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {field: "id", title: '编号', fixed: "true"},
            {field: 'measure', title: '暂缓措施', align: "center"},
            {field: 'createDate', title: '创建时间', align: "center"},
            {field: 'updateDate', title: '更新时间', align: "center"},
            {title: '操作', fixed: "right", align: "center", minWidth: 150, templet: "#cusRepBar"}
        ]]
    });
    //头监听
    table.on("toolbar(cusRep)", function (obj) {
        switch (obj.event) {
            case "add" :
                openAddOrUpdateRepDialog();
                break;
            case "loss":
                updateState();
                break;
        }
    });
    //行监听
    table.on("tool(cusRep)", function (obj) {
        var layEvent = obj.event;
        if (layEvent === "edit") {
            openAddOrUpdateRepDialog(obj.data.id);
        } else if (layEvent === "del") {
            layer.confirm("确认删除当前记录?", {icon: 3, title: "客户流失管理-删除暂缓措施"}, function (index) {
                $.post(ctx + "/customer_rep/delete", {id: obj.data.id}, function (data) {
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

    function updateState() {
        layer.confirm("确认流失当前客户吗?", {icon: 3, title: "客户流失管理-确认流失客户"}, function (index) {
            layer.close(index);
            layer.prompt({title: '请输入流失原因', formType: 2}, function (text, index) {
                layer.close(index);
                /**
                 * 传流失客户id以及刚刚输入的流失原因
                 */
                $.ajax({
                    "url": ctx + "/customer_loss/updatState",
                    "type": "post",
                    "data": {
                        id: $("input[name='id']").val(),
                        lossReason: text
                    },
                    "dataType": "json",
                    "success": function (data) {
                        if (data.code == 200) {
                            layer.msg(data.msg)
                            layer.closeAll("iframe");
                            parent.location.reload();
                        } else {
                            layer.msg(data.msg)
                        }
                    }
                });
            });
        })
    }


    function openAddOrUpdateRepDialog(id) {
        var title = "暂缓数据维护-添加暂缓";
        var url = ctx + "/customer_rep/addOrUpdateCusRep?lossId=" + $("input[name='id']").val();
        if (id) {
            title = "暂缓数据维护-更新暂缓";
            url = url + "&id=" + id;
        }
        layui.layer.open({
            title: title,
            type: 2,
            area: ["700px", "400px"],
            maxmin: true,
            content: url
        })
    }

})