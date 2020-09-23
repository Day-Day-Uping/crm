<!DOCTYPE html>
<html>
<head>
    <#include "../common.ftl">
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input type="hidden" name="id" class="layui-col-xs6" value="${(customer.id)!}">
    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">*客户名称</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" required="required"
                       lay-verify="required" name="name" id="name" value="${(customer.name)!}" placeholder="请输入客户名称">
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">*手机号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="phone" lay-verify="required"
                       placeholder="请输入手机号" value="${(customer.phone)!}">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6 ">
            <label class="layui-form-label">*法人代表</label>
            <div class="layui-input-block">
                <input placeholder="请输入法人代表" name="fr" required="required"
                       class="layui-input" value="${(customer.fr)!}"></input>
            </div>
        </div>
        <div class="layui-col-xs6 ">
            <label class="layui-form-label">客户编号</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="khno" id="khno" placeholder="客户编号" value="${(customer.khno)!}" placeholder="请输入客户编号">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6 ">
            <label class="layui-form-label">客户经理</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="cusManager" lay-verify="required"
                       placeholder="请输入客户经理" value="${(customer.cusManager)!}">
            </div>
        </div>
        <div class="layui-col-xs6 ">
            <label class="layui-form-label">信誉度</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input"
                       name="xyd" placeholder="请输入信誉度" value="${(customer.xyd)!}">
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">传真</label>
            <div class="layui-input-block">
                <input placeholder="请输入传真" name="fax"
                       class="layui-input" value="${(customer.fax)!}"></input>
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">网址</label>
            <div class="layui-input-block">
                <input placeholder="请输入网址" name="webSite"
                       class="layui-input" value="${(customer.webSite)!}"></input>
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">注册资金</label>
            <div class="layui-input-block">
                <input placeholder="请输入注册资金" name="zczj"
                       class="layui-input" value="${(customer.zczj)!}"></input>
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">开户行</label>
            <div class="layui-input-block">
                <input placeholder="请输入开户行" name="khyh"
                       class="layui-input" value="${(customer.khyh)!}"></input>
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">开户账号</label>
            <div class="layui-input-block">
                <input placeholder="请输入开户账号" name="khzh"
                       class="layui-input" value="${(customer.khzh)!}"></input>
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">营业执照</label>
            <div class="layui-input-block">
                <input placeholder="请输入营业执照" name="yyzzch"
                       class="layui-input" value="${(customer.yyzzch)!}"></input>
            </div>
        </div>
    </div>

    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">国税</label>
            <div class="layui-input-block">
                <input placeholder="请输入国税" name="gsdjh"
                       class="layui-input" value="${(customer.gsdjh)!}"></input>
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">地税</label>
            <div class="layui-input-block">
                <input placeholder="请输入地税" name="dsdjh"
                       class="layui-input" value="${(customer.dsdjh)!}"></input>
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-row">
        <div class="layui-col-xs6">
            <label class="layui-form-label">满意度</label>
            <div class="layui-input-block">
                <select name="myd" id="myd">
                    <option value="">请选择客户满意度</option>
                    <option value="满意">满意</option>
                    <option value="一般">一般</option>
                    <option value="不满意">不满意</option>
                </select>
            </div>
        </div>
        <div class="layui-col-xs6">
            <label class="layui-form-label">客户级别</label>
            <div class="layui-input-block">
                <select name="level" id="level">
                    <option value="">请选择客户级别</option>
                    <option value="普通客户">普通客户</option>
                    <option value="战略合作伙伴">战略合作伙伴</option>
                    <option value="大客户">大客户</option>
                    <option value="重点开发客户">重点开发客户</option>
                </select>
            </div>
        </div>
    </div>
    <br/>
    <div class="layui-form-item layui-row">
        <div class="layui-input-block" align="center">
            <button class="layui-btn layui-btn-lg" lay-submit="" lay-filter="addOrUpdateCustomer">确认</button>
            <button class="layui-btn layui-btn-lg" id="quiet">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/js/customer/add.update.js"></script>
</body>
</html>