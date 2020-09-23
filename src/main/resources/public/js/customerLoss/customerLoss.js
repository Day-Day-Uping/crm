layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //用户列表展示
    var tableIns = table.render({
        elem: '#customerLossList',
        url: ctx + '/customer_loss/list',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "customerLossList",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {field: "id", title: '编号', fixed: "true"},
            {field: 'cusName', title: '客户名', align: "center"},
            {field: 'cusNo', title: '客户编号', align: 'center'},
            {field: 'cusManager', title: '客户经理', align: 'center'},
            {field: 'lastOrderTime', title: '最新订单时间', align: 'center'},
            {field: 'confirmLossTime', title: '确认流失时间', align: 'center'},
            {field: 'lossReason', title: '流失原因', align: 'center'},
            {field: 'createDate', title: '创建时间', align: 'center'},
            {field: 'updateDate', title: '更新时间', align: 'center'},
            {title: '操作', templet: '#customerLoss', fixed: "right", align: "center", minWidth: 80}
        ]]
    });
    // 多条件搜索
    $(".search_btn").on("click", function () {
        table.reload("customerLossList", {
            page: {
                curr: 1
            },
            where: {
                name: $("input[name='cusName']").val(),// 客户名
                cusNo: $("input[name='cusNo']").val(),// 客户编号
                state: $("#state").val() //客户流失状态
            }
        })
    });
//操作栏
    table.on("tool(customerLossList)", function (obj) {
        var layEvent = obj.event;
        if (layEvent === "add") {
            openCusRepDialog("客户流失-暂缓数据维护", obj.data.id);
        } else if (layEvent === "info") {
            openCusRepDialog("客户流失-暂缓数据详情", obj.data.id);
        }
    });
    /**
     * 打开添加或更新对话框
     * title:标题
     *
     */
    function openCusRepDialog(title,cid) {

        layui.layer.open({
            title:title,
            type:2,
            area:["900px","500px"],
            maxmin:true,
            content:ctx+"/customer_loss/toCusRepPage?id="+cid
        })
    }


})