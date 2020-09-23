layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;

    //展示列表
    var tableIns = table.render({
        elem: '#cusDevPlans',
        url: ctx + '/sale_chance/list?state=1&flag=1',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "saleChanceListTable",
        cols: [[
            {field: "id", title: '编号', fixed: "true"},
            {field: 'chanceSource', title: '机会来源', align: "center"},
            {field: 'customerName', title: '客户名称', align: 'center'},
            {field: 'cgjl', title: '成功几率', align: 'center'},
            {field: 'overview', title: '概要', align: 'center'},
            {field: 'linkMan', title: '联系人', align: 'center'},
            {field: 'linkPhone', title: '联系电话', align: 'center'},
            {field: 'description', title: '描述', align: 'center'},
            {field: 'createMan', title: '创建人', align: 'center'},
            {field: 'createDate', title: '创建时间', align: 'center'},
            {
                field: 'devResult', title: '开发状态', align: 'center', templet: function (d) {
                    return formatterDevResult(d.devResult);
                }
            },
            {title: '操作', templet: '#op', fixed: "right", align: "center", minWidth: 150}
        ]]
    });

    function formatterDevResult(value) {
        /**
         * 0-未开发
         * 1-开发中
         * 2-开发成功
         * 3-开发失败
         */
        if (value == 0) {
            return "<div style='color: yellow'>未开发</div>";
        } else if (value == 1) {
            return "<div style='color: #00FF00;'>开发中</div>";
        } else if (value == 2) {
            return "<div style='color: #00B83F'>开发成功</div>";
        } else if (value == 3) {
            return "<div style='color: red'>开发失败</div>";
        } else {
            return "<div style='color: #af0000'>未知</div>"
        }
    }

    // 多条件搜索
    $(".search_btn").on("click", function () {
        table.reload("saleChanceListTable", {
            page: {
                curr: 1
            },
            where: {
                customerName: $("input[name='customerName']").val(),// 客户名
                createMan: $("input[name='createMan']").val(),// 创建人
                devResult: $("#devResult").val()    //开发状态状态
            }
        })
    });

//操作栏
//     table.on("tool(cusDevPlans)", function (obj) {
//         switch (obj.event) {
//             //开发
//             case "dev":
//                 plan("计划项数据维护",obj.data.id)
//                 break;
//             //详情
//             case "info":
//                 plan("计划项数据详情",obj.data.id)
//                 break;
//         }
//     })


    table.on("tool(cusDevPlans)",function (obj) {
        var layEvent = obj.event;
        if(layEvent==="dev"){
            plan("计划项数据维护",obj.data.id);
        }else if(layEvent ==="info"){
            plan("计划项数据详情",obj.data.id);
        }
    });
    /**
     * 打开添加或更新对话框
     * title:标题
     * sid
     */
    function plan(title,sid) {

        layui.layer.open({
            title:title,
            type:2,
            area:["900px","500px"],
            maxmin:true,
            content:ctx+"/cus_dev_plan/toCusDevPlanDataPage?sid="+sid
        })
    }


})