<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input name="parentId" type="hidden" value="${module.parentId}">
    <input name="id" type="hidden" value="${module.id}">
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">菜单名</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" value="${(module.moduleName)!}"
                   lay-verify="required" name="moduleName" id="moduleName"
                   placeholder="请输入菜单名">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">菜单样式</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" value="${(module.moduleStyle)!}"
                   name="moduleStyle" id="moduleStyle" placeholder="请输入菜单样式">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">排序</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" value="${(module.orders)!}"
                   name="orders" placeholder="请输入排序">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">权限码</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" required="required" value="${(module.optValue)!}"
                   name="optValue" placeholder="请输入权限码">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">菜单级别</label>
        <div class="layui-input-block">
                <select name="grade">
                    <#if module.grade==0>
                        <option value="0" selected="selected">一级菜单</option></#if>
                    <#if module.grade==1>
                        <option value="1" selected="selected">二级菜单</option></#if>
                    <#if module.grade==2>
                        <option value="2" selected="selected">三级菜单</option></#if>
                </select>
        </div>
    </div>
    <#if module.grade==1>
        <div class="magb15 layui-col-md4 layui-col-xs12">
            <label class="layui-form-label">菜单url</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="url"
                       required="required" name="url" placeholder="请输入菜单url" value="${(module.url)!}">
            </div>
        </div>
    </#if>
    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-lg" lay-submit=""
                    lay-filter="updateModule">确认
            </button>
            <button class="layui-btn layui-btn-lg layui-btn-normal" id="quiet">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/module/updateModule.js"></script>
</body>