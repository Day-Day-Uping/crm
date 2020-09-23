layui.use(['form', 'layer', 'formSelects'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery;
    var formSelects = layui.formSelects;

    //取消按钮
    $(document).on('click', "#quiet", function () {
        layer.closeAll("iframe");
        // 刷新父页面
        parent.location.reload();
    });
    //确认按钮
    form.on('submit(addOrUpdateUser)', function (data) {
        var index = top.layer.msg("数据提交中,请稍后...", {icon: 16, time: false, shade: 0.8});
        var url = ctx + "/user/save";
        if ($("input[name='id']").val()) {
            url = ctx + "/user/update";
        }
        $.post(url, data.field, function (res) {
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
    //角色
    //获取隐藏域userId
    var userId=$("input[name='id']").val();
    formSelects.config(
        "selectId",
        {
            type: "post",
            searchUrl: ctx + "/role/queryAllRoles?userId="+userId,
            keyName: 'roleName',
            keyVal: 'id'
        },
        true
    )


})