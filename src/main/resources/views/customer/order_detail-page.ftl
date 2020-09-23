<!DOCTYPE html>
<html>
<head>
    <title>订单详情页面</title>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form">
                <input name="id" type="hidden" value="${(order.id)!}"/>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">订单编号</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   name="orderNo" id="orderNo" value="${(order.orderNo)!}"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">总金额(¥)</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   name="total" id="total" value="${(order.total)!}"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">支付状态</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   name="status" lay-verify="required" value="${(order.status)!}"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">物流地址</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   lay-verify="address" name="address" value="${(order.address)!}" id="address"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="layui-col-md12">
    <table id="orderDetail" class="layui-table" lay-filter="orderDetail"></table>
</div>

<!--操作-->
<script id="orderDetailBar" type="text/html">
    <a class="layui-btn layui-btn-xs" id="edit" lay-event="orderMsg">后期开发(暂留)</a>
</script>

<script type="text/javascript" src="${ctx}/js/customer/order.detail_page.js"></script>

</body>
</html>