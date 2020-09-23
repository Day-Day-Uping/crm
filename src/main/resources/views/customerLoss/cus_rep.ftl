<!DOCTYPE html>
<html>
<head>
    <title>客户流失管理</title>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-body">
            <form class="layui-form">
                <input name="id" type="hidden" value="${(customerLoss.id)!}"/>
                <div class="layui-form-item layui-row">
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">客户名称</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   name="cusName" id="cusName" value="${(customerLoss.cusName)!}" readonly="readonly">
                        </div>
                    </div>
                    <div class="layui-col-xs6">
                        <label class="layui-form-label">客户编号</label>
                        <div class="layui-input-block">
                            <input type="text" class="layui-input"
                                   name="cusNo" id="cusNo" value="${(customerLoss.cusNo)!}" readonly="readonly">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="layui-col-md12">
    <table id="cusRep" class="layui-table" lay-filter="cusRep"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <#if customerLoss.state==0>
        <div class="layui-btn-container">
            <a class="layui-btn layui-btn-normal addNews_btn" lay-event="add">
                <i class="layui-icon">&#xe608;</i>
                暂缓措施
            </a>
            <a class="layui-btn layui-btn-normal addNews_btn" lay-event="loss">
                <i class="layui-icon">&#xe608;</i>
                确认流失
            </a>
        </div>
    </#if>
</script>

<!--操作-->
<script id="cusRepBar" type="text/html">
    <#if customerLoss.state==0>
        <a class="layui-btn layui-btn-xs" id="edit" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </#if>
</script>

<script type="text/javascript" src="${ctx}/js/customerLoss/cus_rep.js"></script>

</body>
</html>