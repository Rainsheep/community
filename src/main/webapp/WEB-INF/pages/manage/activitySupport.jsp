<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>活动赞助信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <style>
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
</head>
<body>

<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="${pageContext.request.contextPath}/homepage">主页</a>
        <a><cite>赞助管理</cite></a>
        <a><cite>赞助信息</cite></a>
    </div>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">活动赞助信息</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>

                    <script type="text/html" id="test-table-toolbar-toolbarDemo">
                        <div class="layui-btn-container">
                            <%--                            <button class="layui-btn layui-btn-sm" lay-event="delSelected">删除所选</button>--%>
                        </div>
                    </script>

                    <script type="text/html" id="test-table-toolbar-barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="detail">赞助名单</a>
                        <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="bill">花销账单</a>
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
            , url: '${pageContext.request.contextPath}/support/findActivitySupportByBelong'
            , toolbar: '#test-table-toolbar-toolbarDemo'
            , title: '活动赞助信息'
            , cols: [[
                {field: 'id', title: 'ID', fixed: 'left', width: 70, unresize: true, sort: true}
                , {field: 'name', title: '活动名称', width: 180}
                , {field: 'formatDate', title: '活动时间', width: 230, sort: true}
                , {field: 'place', title: '活动地点', width: 250}
                , {field: 'cname', title: '所属社团', width: 180, hide: true}
                , {field: 'amount', title: '参与人数', width: 100, sort: true}
                , {field: 'formatSponsorMoney', title: '所需赞助', sort: true, width: 110}
                , {field: 'formatNowMoney', title: '已有赞助', sort: true, width: 110}
                , {fixed: 'right', title: '操作', toolbar: '#test-table-toolbar-barDemo'}
            ]]
            , page: true
        });


        function newTab(url, tit) {
            if (top.layui.index) {
                top.layui.index.openTabsPage(url, tit)
            } else {
                window.open(url)
            }
        }

        //监听行工具事件
        table.on('tool(test-table-toolbar)', function (obj) {
            var data = obj.data;
            if (obj.event === 'detail') {
                newTab("${pageContext.request.contextPath}/manage/supportDetail?activityId=" + data.id, "赞助名单")
            } else if (obj.event === 'bill') {
                newTab("${pageContext.request.contextPath}/manage/activityBill?activityId=" + data.id, "花销账单")
            }
        });

    });
</script>
</body>
</html>