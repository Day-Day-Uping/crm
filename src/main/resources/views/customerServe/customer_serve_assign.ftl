<!DOCTYPE html>
<html>
<head>
    <title>服务分配</title>
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
    <table id="customerServeAssign" class="layui-table" lay-filter="customerServeAssign"></table>
    <#--    头工具栏-->
    <script type="text/html" id="toolbarDemo"></script>

    <!--操作-->
    <script id="customerServeAssignBar" type="text/html">
        <a class="layui-btn layui-btn-xs" id="edit" lay-event="assign">分配</a>
    </script>
</form>
<script type="text/javascript" src="${ctx}/js/customerServe/customer_serve_assign.js"></script>

</body>
</html>