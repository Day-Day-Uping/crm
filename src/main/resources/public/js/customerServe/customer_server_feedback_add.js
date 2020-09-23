layui.use(['table', 'layer'], function () {
    var layer = parent.layer === undefined ? layui.layer : top.layer,
        form = layui.form;
            //取消
            $(document).on('click', "#quiet", function () {
                layer.closeAll("iframe");
                // 刷新父页面
                parent.location.reload();
            });
 form.on('submit(confirm)',function (data) {
        var index = top.layer.msg("数据提交中,请稍后...", {icon: 16, time: false, shade: 0.8});
        $.post(ctx + "/customer_serve/update", data.field, function (res) {
            if (res.code == 200) {
                top.layer.msg("操作成功");
                top.layer.close(index);
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