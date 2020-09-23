<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input type="hidden" name="id" value="${(role.id)!}">
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">角色名</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   lay-verify="required" name="roleName" id="roleName" value="${(role.roleName)!}"
                   placeholder="请输入角色名称">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">角色描述</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input"
                   name="roleRemark" id="roleRemark" placeholder="请输入角色描述" value="${(role.roleRemark)!}">
        </div>
    </div>
    <#--    <div class="magb15 layui-col-md4 layui-col-xs12">-->
    <#--        <label class="layui-form-label">角色</label>-->
    <#--        <div class="layui-input-block">-->
    <#--            <select name="roleIds" xm-select="selectId"></select>-->
    <#--        </div>-->
    <#--    </div>-->
    <br/>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-lg" lay-submit=""
                    lay-filter="addOrUpdateRole">确认
            </button>
            <button class="layui-btn layui-btn-lg layui-btn-normal" id="quiet">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/role/add.update.js"></script>
</body>
</html>