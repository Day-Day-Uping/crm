layui.use(['form', 'layer', 'formSelects'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;

    //取消按钮
    $(document).on('click', "#quiet", function () {
        layer.closeAll("iframe");
        // 刷新父页面
        parent.location.reload();
    });
    //确认按钮
    form.on('submit(addConsumerServe)', function (data) {
        var url = ctx + "/customer_serve/save";
        $.post(url, data.field, function (res) {
            if (res.code == 200) {
                top.layer.msg("操作成功");
                layer.closeAll("iframe");
                // 刷新父页面
                parent.location.reload();
            } else {
                layer.msg(res.msg);
            }
        });
        return false;
    });


})