<!DOCTYPE html>
<html>
<head>
    <title>菜单管理</title>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<table id="moduleMenu" class="layui-table" lay-filter="moduleMenu"></table>


<#--操作-->
<script type="text/html" id="auth-state">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-xs" lay-event="add">
            添加子项
        </a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">
            修改子项
        </a>
        <a class="layui-btn layui-btn-xs" lay-event="del">
            删除子项
        </a>
    </div>
</script>
<#--头栏-->
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-normal addNews_btn" lay-event="expand">
            <i class="layui-icon">&#xe608;</i>
            全部展开
        </a>
        <a class="layui-btn layui-btn-normal addNews_btn" lay-event="fold">
            <i class="layui-icon">&#xe608;</i>
            全部折叠
        </a>
        <a class="layui-btn layui-btn-normal addNews_btn" lay-event="add">
            <i class="layui-icon">&#xe608;</i>
            添加目录
        </a>
    </div>
</script>
<script type="text/javascript" src="${ctx}/js/module/module.js"></script>
</body>
</html>