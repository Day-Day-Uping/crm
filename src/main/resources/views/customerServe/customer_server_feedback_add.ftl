<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input type="hidden" name="id" value="${(feedback.id)!}">
    <input name="state" type="hidden" value="4">
    <input name="serviceProcePeople" type="hidden" value="">
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">客户名</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" readonly="readonly"
                   lay-verify="required" name="customer" id="customer" value="${(feedback.customer)!}"
                   placeholder="请输入用户名称">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">服务类型</label>
        <div class="layui-input-block">
            <select name="serveType" id="serveType" disabled="disabled">
                <option value="">请选择</option>
                <option value="6" <#if feedback.serveType==6>selected="selected"</#if>>咨询</option>
                <option value="7" <#if feedback.serveType==7>selected="selected"</#if>>建议</option>
                <option value="8" <#if feedback.serveType==8>selected="selected"</#if>>投诉</option>
            </select>
        </div>
    </div>


    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">指派人</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" readonly="readonly"
                   lay-verify="required" name="assigner" id="assigner" value="${(feedback.assigner)!}"
            >
        </div>
    </div>
    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">指派时间</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" readonly="readonly"
                   lay-verify="required" name="assignTime" id="assignTime"
                   value="${(feedback.assignTime?string('yyyy-MM-dd HH:mm:ss'))!}"
            >
        </div>
    </div>
    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">处理时间</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" readonly="readonly"
                   lay-verify="required" name="serviceProceTime" id="serviceProceTime"
                   value="${(feedback.serviceProceTime?string('yyyy-MM-dd HH:mm:ss'))!}"
            >
        </div>
    </div>
    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">*处理结果(必填)</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   lay-verify="required" name="serviceProceResult" id="serviceProceResult"
                   value="${(feedback.serviceProceResult)!}">
        </div>
    </div>
    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">*满意度<br>(必填)</label>
        <div class="layui-input-block">
            <select name="myd" id="myd">
                <option value="">请选择</option>
                <option value="✩">✩</option>
                <option value="✩✩">✩✩</option>
                <option value="✩✩✩">✩✩✩</option>
                <option value="✩✩✩✩">✩✩✩✩</option>
                <option value="✩✩✩✩✩">✩✩✩✩✩</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">服务概要</label>
        <div class="layui-input-block">
            <textarea type="text" class="layui-textarea" readonly="readonly"
                      name="overView" lay-verify="required">${(feedback.overView)!}</textarea>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">服务内容</label>
        <div class="layui-input-block">
            <textarea type="text" class="layui-textarea" readonly="readonly"
                      lay-verify="serviceProce" name="serviceRequest" id="serviceRequest"
            >${(feedback.serviceRequest)!}</textarea>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">处理内容</label>
        <div class="layui-input-block">
            <textarea type="text" class="layui-textarea"
                      lay-verify="serviceProce" name="serviceProce" id="serviceProce"
            >${(feedback.serviceProce)!}</textarea>
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
<script type="text/javascript" src="${ctx}/js/customerServe/customer_server_feedback_add.js"></script>
</body>
</html>