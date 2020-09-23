<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
<#--    <input type="hidden" name="id" value="${(saleChance.id)!}">-->
    <div class="layui-form-item layui-row">
        <div class="layui-form-item layui-row layui-col-xs12">
            <label class="layui-form-label">服务类型</label>
            <div class="layui-input-block">
                <select name="serveType" id="serveType">
                    <option value="">请选择</option>
                    <option value="6">咨询</option>
                    <option value="7">建议</option>
                    <option value="8">投诉</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-row layui-col-xs12">
            <label class="layui-form-label">客户名</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="customer" id="customer" placeholder="请输入客户名">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">服务内容</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入服务内容" name="serviceRequest"
                      class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">服务概要</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入服务概要" name="overView"
                      class="layui-textarea"></textarea>
        </div>
    </div>

    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-lg" lay-submit=""
                    lay-filter="addConsumerServe">确认
            </button>
            <button class="layui-btn layui-btn-lg layui-btn-normal" id="quiet">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/customerServe/add.update.js"></script>
</body>
</html>