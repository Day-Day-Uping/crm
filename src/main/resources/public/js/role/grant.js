$(function () {
    loadModuleInfo();
});
var zTreeObj;

function loadModuleInfo() {
    $.ajax({
        "url": ctx + "/module/queryAllModules?roleId=" + $("input[name='roleId']").val(),
        "type": "post",
        "dataType": "json",
        "success": function (data) {

            var settings = {
                data: {
                    simpleData: {
                        enable: true,
                        idKey: "id",
                        pIdKey: "pId",
                        rootPId: 0
                    }
                },
                check: {
                    enable: true
                },
                callback: {
                    onCheck: zTreeOnCheck
                }
            };
            zTreeObj = $.fn.zTree.init($("#treeDemo"), settings, data); //初始化树
        }
    });
}

function zTreeOnCheck(event, treeId, treeNode) {
    // alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
    var nodes = zTreeObj.getCheckedNodes(true);
    // console.log(nodes)
    var mids = "mids=";
    for (var i = 0; i < nodes.length; i++) {
        if (i < nodes.length - 1) {
            mids = mids + nodes[i].id + "&mids=";
        } else {
            mids = mids + nodes[i].id;
        }
    }
    //ajax提交数据
    $.ajax({
        "url": ctx + "/role/addGrant",
        "type": "post",
        "data": mids + "&roleId=" + $("input[name='roleId']").val(),
        "dataType": "json",
        "success": function (data) {
            console.log(data)
        }
    });
};