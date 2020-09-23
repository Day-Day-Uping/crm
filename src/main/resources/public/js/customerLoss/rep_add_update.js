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


    form.on('submit(addOrUpdateCusRep)',function (data) {
        var index= top.layer.msg("数据提交中,请稍后...",{icon:16,time:false,shade:0.8});
        var url = ctx+"/customer_rep/save";
        if($("input[name='id']").val()){
            url=ctx+"/customer_rep/update";
        }
        $.post(url,data.field,function (res) {
            if(res.code==200){
                top.layer.msg("操作成功");
                top.layer.close(index);
                layer.closeAll("iframe");
                // 刷新父页面
                parent.location.reload();
            }else{
                layer.msg(res.msg);
            }
        });
        return false;
    });
})