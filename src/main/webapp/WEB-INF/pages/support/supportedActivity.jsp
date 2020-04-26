<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>我赞助的活动</title>
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
                <div class="layui-card-header">我赞助的活动</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>

                    <script type="text/html" id="test-table-toolbar-toolbarDemo">
                        <div class="layui-btn-container">
                            <%--                            <button class="layui-btn layui-btn-sm" lay-event="delSelected">删除所选</button>--%>
                        </div>
                    </script>

                    <script type="text/html" id="test-table-toolbar-barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="detail">活动详情</a>
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
            , url: '${pageContext.request.contextPath}/support/findSupportBySid'
            , toolbar: '#test-table-toolbar-toolbarDemo'
            , title: '赞助活动列表'
            , cols: [[
                {field: 'id', title: '赞助记录ID', hide: true}
                , {field: 'activityId', title: '活动ID', hide: true}
                , {field: 'activityName', title: '活动名称', width: '25%'}
                , {field: 'formatMoney', title: '赞助金额', sort: true, width: '15%'}
                , {field: 'formatLeftMoney', title: '所剩金额', sort: true, width: '15%'}
                , {field: 'formatSupportTime', title: '赞助时间', width: '25%', sort: true}
                , {fixed: 'right', title: '操作', toolbar: '#test-table-toolbar-barDemo', align: 'center'}
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
                <%--window.open("${pageContext.request.contextPath}/activity/activityDetail?activityId=" + data.activityId);--%>
                newTab("${pageContext.request.contextPath}/activity/activityDetail?onlyContent=1&activityId=" + data.activityId, "活动详情");
            } else if (obj.event === 'bill') {
                newTab("${pageContext.request.contextPath}/support/spendBill?supportId=" + data.id, "花销账单");
            }
        });


    });
</script>
</body>
</html>