layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //计划项数据展示
    var tableIns = table.render({
        elem: '#cus_loss_list',
        url: ctx + '/customer_loss/list?state=1',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "cus_loss_table",
        cols: [[
            {field: 'cusName', title: '客户名', align: "center"},
            {field: 'cusNo', title: '客户编号', align: 'center'},
            {field: 'cusManager', title: '客户经理', align: 'center'},
            {field: 'lastOrderTime', title: '最新订单时间', align: 'center'},
            {field: 'confirmLossTime', title: '确认流失时间', align: 'center'},
            {field: 'lossReason', title: '流失原因', align: 'center'}
        ]]
    });
    // 多条件搜索
    $(".search_btn").on("click", function () {
        table.reload("cus_loss_table", {
            page: {
                curr: 1
            },
            where: {
                name: $("input[name='cusName']").val(),// 客户名
                cusNo: $("input[name='cusNo']").val(),// 客户编号
            }
        })
    });
})
