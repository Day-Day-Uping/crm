layui.use(['table', 'layer', 'form'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //用户列表展示
    var tableIns = table.render({
        elem: '#customerServeProce',
        url: ctx + '/customer_serve/list?state=2&flag=1',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "customerServeProceBarTable",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {field: "id", title: '编号', fixed: "true"},
            {field: 'customer', title: '客户名', align: "center"},
            {field: 'dataDicValue', title: '服务类型', align: 'center'},
            {field: 'overView', title: '服务概要', align: 'center'},
            {field: 'assignTime', title: '分配时间', align: 'center'},
            {field: 'createPeople', title: '创建人', align: 'center'},
            {field: 'assigner', title: '分配人', align: 'center'},
            {field: 'createTime', title: '创建时间', align: 'center'},
            {field: 'updateTime', title: '更新时间', align: 'center'},
            {title: '操作', templet: '#customerServeProceBar', fixed: "right", align: "center", minWidth: 150}
        ]]
    });


    //行工具栏
    table.on('tool(customerServeProce)', function (obj) {
        var layEvent = obj.event;
        if (layEvent === "proce") {
            openProcDialog(obj.data.id);
        }
    });

    /**
     * 打开添加或更新对话框
     */
    function openProcDialog(id) {
        var title = "服务管理-服务处理";
        var url = ctx + "/customer_serve/addServeProcPage?id=" + id;
        layui.layer.open({
            title: title,
            type: 2,
            area: ["700px", "500px"],
            maxmin: true,
            content: url
        })
    };
})