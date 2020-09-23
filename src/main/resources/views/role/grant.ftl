<html>
<head>
    <#include "../common.ftl">
    <link rel="stylesheet" href="${ctx}/zTree/v3/css/zTreeStyle/zTreeStyle.css">
    <script type="text/javascript" src="${ctx}/zTree/v3/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/zTree/v3/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="${ctx}/zTree/v3/js/jquery.ztree.exedit-3.5.js"></script>
    <script type="text/javascript" src="${ctx}/zTree/v3/js/jquery.ztree.excheck-3.5.js"></script>
</head>
<body>
<input type="hidden" value="${roleId}" name="roleId"/>
<div id="treeDemo" class="ztree"></div>
<script type="text/javascript" src="${ctx}/js/role/grant.js"></script>
</body>
</html>