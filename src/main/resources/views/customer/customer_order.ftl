<!DOCTYPE html>
<html>
<head>
    <title>订单信息查看</title>
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
                        <label class="layui-form-label">客户名称</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   name="name" id="name" value="${(order.name)!}"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">公司法人</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   name="fr" id="fr" value="${(order.fr)!}"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-row">
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">客户地址</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   name="address" lay-verify="required" value="${(order.address)!}"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">联系电话</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   lay-verify="phone" name="phone" value="${(order.phone)!}" id="phone"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="layui-col-md12">
    <table id="cusOrder" class="layui-table" lay-filter="cusOrder"></table>
</div>

<!--操作-->
<script id="cusOrderBar" type="text/html">
    <a class="layui-btn layui-btn-xs" id="edit" lay-event="orderMsg">订单详情</a>
</script>

<script type="text/javascript" src="${ctx}/js/customer/customer.order.js"></script>

</body>
</html>