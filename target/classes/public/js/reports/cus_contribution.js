layui.use(['table', 'layer', 'laydate'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table,
        laydate = layui.laydate;
    //时间选择器
    laydate.render({
        elem: '#time'
        , format: 'yyyy-MM-dd HH:mm:ss'
    });

//计划项数据展示
    var tableIns = table.render({
        elem: '#cusContribution',
        url: ctx + '/customer/cus/attribution/list',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "cusContributionTable",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {type: 'numbers', title: '编号', align: "center"},
            {field: 'name', title: '客户名', align: "center"},
            {field: 'total', title: '总金额', align: "center"}
        ]]
    });
    // 多条件搜索
    $(".search_btn").on("click", function () {
        table.reload("cusContributionTable", {
            page: {
                curr: 1
            },
            where: {
                name: $("input[name='name']").val(),// 用户名
                type: $("#type").val(),//
                time: $("input[name='time']").val() //
            }
        })
    });
})

