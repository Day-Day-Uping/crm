layui.use(['table', 'layer', 'form'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //用户列表展示
    var tableIns = table.render({
        elem: '#customerAchieve ',
        url: ctx + '/customer_serve/list?state=5&flag=-4',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "customerAchieveTable",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {field: "id", title: '编号', fixed: "true"},
            {field: 'customer', title: '客户名', align: "center"},
            {field: 'dataDicValue', title: '服务类型', align: 'center'},
            {field: 'overView', title: '服务概要', align: 'center'},
            {field: 'assignTime', title: '分配时间', align: 'center'},
            {field: 'createPeople', title: '创建人', align: 'center'},
            {field: 'serviceProcePeople', title: '处理人', align: 'center'},
             {field: 'serviceProceResult', title: '处理结果', align: 'center'},
              {field: 'myd', title: '满意度', align: 'center'},
            {field: 'assigner', title: '分配人', align: 'center'},
            {field: 'createTime', title: '创建时间', align: 'center'},
            {field: 'updateTime', title: '更新时间', align: 'center'},
            {title: '操作', templet: '#customerServeProceBar', fixed: "right", align: "center", minWidth: 150}
        ]]
    });
       // 多条件搜索
        $(".search_btn").on("click", function () {
            table.reload("customerAchieveTable", {
                page: {
                    curr: 1
                },
                where: {
                    customer: $("input[name='customer']").val(),// 客户名
                    serveType: $("#serveType").val(),//
                }
            })
        });
})