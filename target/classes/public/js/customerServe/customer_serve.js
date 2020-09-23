layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //用户列表展示
    var tableIns = table.render({
        elem: '#customerServe',
        url: ctx + '/customer_serve/list?flag=0',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "customerServeTable",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {field: "id", title: '编号', fixed: "true"},
            {field: 'customer', title: '客户名', align: "center"},
            {field: 'dataDicValue', title: '服务类型', align: 'center'},
            {field: 'overView', title: '服务概要', align: 'center'},
            {field: 'createPeople', title: '创建人', align: 'center'},
            {field: 'createTime', title: '创建时间', align: 'center'},
            {field: 'updateTime', title: '更新时间', align: 'center'},
            {title: '操作', templet: '#customerAchieveBar', fixed: "right", align: "center", minWidth: 150}
        ]]
    });

    // 多条件搜索
    $(".search_btn").on("click", function () {
        table.reload("customerServeTable", {
            page: {
                curr: 1
            },
            where: {
                customer: $("input[name='customer']").val(),// 客户名
                serveType: $("#serveType").val(),//
            }
        })
    });

    // 头工具栏事件
    table.on('toolbar(customerServe)', function (obj) {
        switch (obj.event) {
            case "add":
                openAddCustomerServeDialog();
                break;
        }
    });

    function openAddCustomerServeDialog() {
        layui.layer.open({
            title: "服务管理-服务创建",
            type: 2,
            area: ["700px", "500px"],
            maxmin: true,
            content: ctx + "/customer_serve/addPage"
        })

    };

})