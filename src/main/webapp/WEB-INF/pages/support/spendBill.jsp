<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>花销账单</title>
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
                <div class="layui-card-header">花销账单</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>

                    <script type="text/html" id="test-table-toolbar-toolbarDemo">
                        <div class="layui-btn-container">
                            <%--                            <button class="layui-btn layui-btn-sm" lay-event="delSelected">删除所选</button>--%>
                        </div>
                    </script>

                    <script type="text/html" id="test-table-toolbar-barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="detail">账单详情</a>
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
            , url: '${pageContext.request.contextPath}/bill/findBillBySupportId?supportId=' +${supportId}
            , toolbar: '#test-table-toolbar-toolbarDemo'
            , title: '花销账单'
            , cols: [[
                {field: 'way', title: '花销方式', width: '20%'}
                , {field: 'formatCost', title: '花销金额', sort: true, width: '10%'}
                , {field: 'formatMoney', title: '赞助所占金额', sort: true, width: '10%'}
                , {field: 'formatDatetime', title: '花销时间', sort: true, width: '15%'}
                , {field: 'place', title: '花销地点', hide: true}
                , {field: 'realName', title: '上传人', width: '10%'}
                , {field: 'formatCurrentdate', title: '上传时间', width: '20%'}
                , {field: 'note', title: '备注', hide: true}
                , {field: 'billProves', title: '附件', hide: true}
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
            console.log();
            if (obj.event === 'detail') {
                var t = data.billProves;
                delete data.billProves;
                $.each(t, function (index) {
                    data["billProves[" + index + "].id"] = t[index].id;
                    data["billProves[" + index + "].billId"] = t[index].billId;
                    data["billProves[" + index + "].filename"] = t[index].filename;
                    data["billProves[" + index + "].url"] = t[index].url;
                });
                $.post("${pageContext.request.contextPath}/support/putBillDetail", data);
                newTab("${pageContext.request.contextPath}/support/billDetail", '账单详情');
            }
        });


    });
</script>
</body>
</html>