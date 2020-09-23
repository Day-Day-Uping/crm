layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //用户列表展示
    var tableIns = table.render({
        elem: '#customerServeFeedBack',
        url: ctx + '/customer_serve/list?state=3&flag=-2',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "feedback",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {field: "id", title: '编号', fixed: "true"},
            {field: 'customer', title: '客户名', align: "center"},
            {field: 'dataDicValue', title: '服务类型', align: 'center'},
            {field: 'overView', title: '服务概要', align: 'center'},
            {field: 'assignTime', title: '分配时间', align: 'center'},
            {field: 'createPeople', title: '创建人', align: 'center'},
            {field: 'assigner', title: '分配人', align: 'center'},
             {field: 'serviceProcePeople', title: '处理人', align: 'center'},
            {field: 'createTime', title: '创建时间', align: 'center'},
            {field: 'updateTime', title: '更新时间', align: 'center'},
            {title: '操作', templet: '#feedbackBar', fixed: "right", align: "center", minWidth: 150}
        ]]
    });

    //行工具栏
    table.on('tool(customerServeFeedBack)', function (obj) {
        var layEvent = obj.event;
        if (layEvent === "feedback") {
            openFeedbackDialog(obj.data.id);
        }
    });

    /**
     * 打开添加或更新对话框
     */
    function openFeedbackDialog(id) {
        var title = "服务管理-服务反馈";
        var url = ctx + "/customer_serve/addServeFeedBackPage?id=" + id;
        layui.layer.open({
            title: title,
            type: 2,
            area: ["700px", "500px"],
            maxmin: true,
            content: url
        })
    };


    })
