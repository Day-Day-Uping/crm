layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        table = layui.table;
    //用户列表展示
    var tableIns = table.render({
        elem: '#customerList',
        url: ctx + '/customer/list',
        cellMinWidth: 95,
        page: true,
        height: "full-125",
        limits: [10, 15, 20, 25],
        limit: 10,
        toolbar: "#toolbarDemo",
        id: "customerListTable",
        cols: [[
            {type: "checkbox", fixed: "center"},
            {field: "id", title: '编号', fixed: "true"},
            {field: 'name', title: '客户名', align: "center"},
            {field: 'khno', title: '客户编号', align: 'center'},
            {field: 'cusManager', title: '客户经理', align: 'center'},
            {field: 'myd', title: '满意度', align: 'center'},
            {field: 'level', title: '客户级别', align: 'center'},
            {field: 'phone', title: '手机号', align: 'center'},
            {field: 'xyd', title: '信誉度', align: 'center'},
            {field: 'address', title: '详细地址', align: 'center'},
            {field: 'fr', title: '法人', align: 'center'},
            {field: 'webSite', title: '网址', align: 'center'},
            {field: 'fax', title: '传真', align: 'center'},
            {field: 'zczj', title: '注册资金', align: 'center'},
            {field: 'yyzzch', title: '营业执照', align: 'center'},
            {field: 'khyh', title: '开户行', align: 'center'},
            {field: 'khzh', title: '开户账号', align: 'center'},
            {field: 'gsdjh', title: '国税', align: 'center'},
            {field: 'dsdjh', title: '地税', align: 'center'},
            {field: 'createDate', title: '创建时间', align: 'center'},
            {field: 'updateDate', title: '更新时间', align: 'center'},
            {title: '操作', templet: '#saleChanceListBar', fixed: "right", align: "center", minWidth: 150}
        ]]
    });

    // 多条件搜索
    $(".search_btn").on("click", function () {
        table.reload("customerListTable", {
            page: {
                curr: 1
            },
            where: {
                name: $("input[name='name']").val(),// 客户名
                cusNo: $("input[name='cusNo']").val(),// 客户编号
                level: $("#level").val() //客户等级
            }
        })
    });
    //行工具栏
    table.on('tool(customerList)', function (obj) {
        var layEvent = obj.event;
        if (layEvent === "edit") {
            openAddOrUpdateCustomerDialog(obj.data.id);
        } else if (layEvent === "del") {
            layer.confirm("确认删除当前记录?", {icon: 3, title: "客户管理"}, function (index) {
                $.post(ctx + "/customer/delete", {id: obj.data.id}, function (data) {
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

    // 头工具栏事件
    table.on('toolbar(customerList)', function (obj) {
        switch (obj.event) {
            case "add":
                openAddOrUpdateCustomerDialog();
                break;
            case "orderview":
                //选中的行记录
                openOrderInfoDialog(table.checkStatus(obj.config.id).data);
                break;
        }
    });

    //添加或更新
    function openAddOrUpdateCustomerDialog(id) {
        var title = "客户管理-客户添加";
        var url = ctx + "/customer/addOrUpdateCustomerPage";
        if (id) {
            title = "客户管理-客户更新";
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

    function openOrderInfoDialog(data) {
        if (data.length == 0) {
            layer.msg("请勾选客户后再查看")
            return;
        } if (data.length > 1) {
            layer.msg("暂不支持批量查看")
            return;
        }
        layui.layer.open({
            title: "客户管理-订单信息查看",
            type: 2,
            area: ["900px", "500px"],
            maxmin: true,
            content: ctx + "/customer/orderInfoPage?id=" + data[0].id
        })

    }


})