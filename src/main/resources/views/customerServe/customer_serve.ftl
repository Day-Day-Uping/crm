<!DOCTYPE html>
<html>
<head>
    <title>服务创建</title>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form">
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" name="customer"
                           class="layui-input
					searchVal" placeholder="客户"/>
                </div>
                <div class="layui-input-inline">
                    <select name="serveType" id="serveType">
                        <option value="">请选择服务类型</option>
                        <option value="6">咨询</option>
                        <option value="7">建议</option>
                        <option value="8">投诉</option>
                    </select>
                </div>
                <a class="layui-btn search_btn" data-type="reload"><i
                            class="layui-icon">&#xe615;</i> 搜索</a>
            </div>
        </form>
    </blockquote>
    <table id="customerServe" class="layui-table" lay-filter="customerServe"></table>


    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <a class="layui-btn layui-btn-normal addNews_btn" lay-event="add">
                <i class="layui-icon">&#xe608;</i>
                添加客户
            </a>
        </div>
    </script>
    <!--操作-->
    <script id="customerServeBar" type="text/html">
<#--        <a class="layui-btn layui-btn-xs" id="edit" lay-event="edit">编辑</a>-->
<#--        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>-->
    </script>
</form>
<script type="text/javascript" src="${ctx}/js/customerServe/customer_serve.js"></script>

</body>
</html>