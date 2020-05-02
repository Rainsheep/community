<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>赞助申请</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">申请列表</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>

                    <script type="text/html" id="test-table-toolbar-toolbarDemo">
                        <div class="layui-btn-container">
                            <%--                            <button class="layui-btn layui-btn-sm" lay-event="delSelected">删除所选</button>--%>
                        </div>
                    </script>

                    <script type="text/html" id="test-table-toolbar-barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="yes">确认到账</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="no">拒绝赞助</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table'], function () {
        var admin = layui.admin
            , table = layui.table
            , $ = layui.$;

        var tableIns = table.render({
            elem: '#test-table-toolbar'
            , url: '${pageContext.request.contextPath}/support/findNotConfirmSupportByBelong'
            , toolbar: '#test-table-toolbar-toolbarDemo'
            , title: '赞助申请列表'
            , cols: [[
                {field: 'id', title: '赞助ID', fixed: 'left', unresize: true, sort: true, hide: true}
                , {field: 'activityName', title: '活动名称'}
                , {field: 'realName', title: '赞助商'}
                , {field: 'belong', title: '所属公司'}
                , {field: 'formatMoney', title: '赞助金额', sort: true}
                , {field: 'formatSupportTime', title: '赞助时间', sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#test-table-toolbar-barDemo', align: 'center'}
            ]]
            , page: true
        });

        //监听行工具事件
        table.on('tool(test-table-toolbar)', function (obj) {
            var data = obj.data;
            if (obj.event === 'yes') {
                layer.confirm('确定钱已到账?', function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/support/updateTypeById", {
                        id: data.id,
                        type: 0
                    }, function (res) {
                        layer.msg(res.msg);
                        tableIns.reload();
                    });
                });

            } else if (obj.event === 'no') {
                layer.confirm('确定拒绝此赞助?', function (index) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/support/updateTypeById", {
                        id: data.id,
                        type: 1
                    }, function (res) {
                        layer.msg(res.msg);
                        tableIns.reload();
                    });
                });
            }
        });

    });
</script>
</body>
</html>