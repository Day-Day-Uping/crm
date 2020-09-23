<!DOCTYPE html>
<html>
<head>
    <title>角色管理</title>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<#if permissions??>
    <form class="layui-form">
        <blockquote class="layui-elem-quote quoteBox">
            <#if permissions?seq_contains("503030")>
                <form class="layui-form">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" name="roleName"
                                   class="layui-input
					searchVal" placeholder="角色名"/>
                        </div>
                        <a class="layui-btn search_btn" data-type="reload"><i
                                    class="layui-icon">&#xe615;</i> 搜索</a>
                    </div>
                </form>
            </#if>
        </blockquote>
        <table id="roleList" class="layui-table" lay-filter="roleList"></table>


        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <#if permissions?seq_contains("503010")>
                    <a class="layui-btn layui-btn-normal addNews_btn" lay-event="add">
                        <i class="layui-icon">&#xe608;</i>
                        添加角色
                    </a>
                </#if>
                <#if permissions?seq_contains("503020")>
                    <a class="layui-btn layui-btn-normal delNews_btn" lay-event="permissoin">
                        <i class="layui-icon">&#xe608;</i>
                        角色授权
                    </a>
                </#if>
            </div>
        </script>


        <!--操作-->
        <script id="saleChanceListBar" type="text/html">
            <#if permissions?seq_contains("503040")>
                <a class="layui-btn layui-btn-xs" id="edit" lay-event="edit">编辑</a>
            </#if>
            <#if permissions?seq_contains("503050")>
                <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
            </#if>
        </script>

    </form>
</#if>
<script type="text/javascript" src="${ctx}/js/role/role.js"></script>

</body>
</html>