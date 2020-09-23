<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input type="hidden" name="id" value="${(serverAssign.id)!}">
    <input name="state" type="hidden" value="2">
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">客户名</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   lay-verify="required" name="customer" id="userName" value="${(serverAssign.customer)!}"
                   placeholder="请输入用户名称">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">服务类型</label>
        <div class="layui-input-block">
            <select name="serveType" id="serveType" disabled="disabled">
                <option value="">请选择</option>
                <option value="6" <#if serverAssign.serveType==6>selected="selected"</#if>>咨询</option>
                <option value="7" <#if serverAssign.serveType==7>selected="selected"</#if>>建议</option>
                <option value="8" <#if serverAssign.serveType==8>selected="selected"</#if>>投诉</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">服务概要</label>
        <div class="layui-input-block">
            <textarea type="text" class="layui-textarea" readonly="readonly"
                      name="overView" lay-verify="required">${(serverAssign.overView)!}</textarea>
        </div>
    </div>

    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">服务内容</label>
        <div class="layui-input-block">
            <textarea type="text" class="layui-textarea" readonly="readonly"
                      lay-verify="serviceRequest" name="serviceRequest" id="serviceRequest"
            >${(serverAssign.serviceRequest)!}</textarea>
        </div>
    </div>
    <div class="magb15 layui-col-md4 layui-col-xs12">
        <label class="layui-form-label">指派给</label>
        <div class="layui-input-block">
            <select name="assigner" xm-select="assigner" id="assigner">
                <option value="">请选择</option>
            </select>
        </div>
    </div>
    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block" align="center">
            <button class="layui-btn layui-btn-lg" lay-submit=""
                    lay-filter="confirm">确认
            </button>
            <button class="layui-btn layui-btn-lg layui-btn-normal" id="quiet">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/customerServe/add_server_assign.js"></script>
</body>
</html>