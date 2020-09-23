<!DOCTYPE html>
<html>
<head>
    <title>客户信息管理</title>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form">
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" name="name"
                           class="layui-input
					searchVal" placeholder="客户名"/>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="cusNo" class="layui-input
					searchVal" placeholder="客户编号"/>
                </div>
                <div class="layui-input-inline">
                    <select name="level" id="level">
                        <option value="">请选择客户级别</option>
                        <option value="普通客户">普通客户</option>
                        <option value="战略合作伙伴">战略合作伙伴</option>
                        <option value="大客户">大客户</option>
                        <option value="重点开发客户">重点开发客户</option>
                    </select>
                </div>
                <a class="layui-btn search_btn" data-type="reload"><i
                            class="layui-icon">&#xe615;</i> 搜索</a>
            </div>
        </form>
    </blockquote>
    <table id="customerList" class="layui-table" lay-filter="customerList"></table>


    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <a class="layui-btn layui-btn-normal addNews_btn" lay-event="add">
                <i class="layui-icon">&#xe608;</i>
                添加客户
            </a>
            <a class="layui-btn layui-btn-normal delNews_btn" lay-event="linkman">
                <i class="layui-icon">&#xe608;</i>
                联系人管理
            </a>
            <a class="layui-btn layui-btn-normal delNews_btn" lay-event="chat">
                <i class="layui-icon">&#xe608;</i>
                交流记录
            </a>
            <a class="layui-btn layui-btn-normal delNews_btn" lay-event="orderview">
                <i class="layui-icon">&#xe608;</i>
                订单查看
            </a>
        </div>
    </script>
    <!--操作-->
    <script id="saleChanceListBar" type="text/html">
        <a class="layui-btn layui-btn-xs" id="edit" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </script>
</form>
<script type="text/javascript" src="${ctx}/js/customer/customer.js"></script>

</body>
</html>