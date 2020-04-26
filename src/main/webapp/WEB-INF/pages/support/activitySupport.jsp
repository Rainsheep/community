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
        <a><cite>赞助活动</cite></a>
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
                        <a class="layui-btn layui-btn-xs" lay-event="detail">活动详情</a>
                        {{#  if(d.supportStatus == '可赞助'){ }}
                        <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="add">赞助活动</a>
                        {{#  }else{ }}
                        <button class="layui-btn layui-btn-disabled layui-btn-xs" disabled>不可赞助</button>
                        {{#  } }}
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
            , url: '${pageContext.request.contextPath}/support/findAllActivitySupport'
            , toolbar: '#test-table-toolbar-toolbarDemo'
            , title: '社团活动列表'
            , cols: [[
                {field: 'id', title: 'ID', fixed: 'left', width: 70, unresize: true, sort: true}
                , {field: 'name', title: '活动名称', width: 200}
                , {field: 'formatDate', title: '活动时间', width: 200, sort: true}
                , {field: 'place', title: '活动地点', width: 250}
                , {field: 'cname', title: '所属社团', width: 180, hide: true}
                , {field: 'amount', title: '参与人数', width: 100, sort: true}
                , {field: 'formatSponsorMoney', title: '所需赞助', sort: true, width: 110}
                , {field: 'formatNowMoney', title: '已有赞助', sort: true, width: 110}
                , {field: 'supportStatus', title: '赞助状态', hide: true}
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
            if (obj.event === 'add') {
                layer.prompt({
                    title: '请输入赞助金额',
                }, function (value, index, elem) {
                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/support/addSupport", {
                        activityId: data.id,
                        money: value
                    }, function (res) {
                        layer.msg(res.msg);
                        if (res.status === 0) tableIns.reload();
                    })
                });
            } else if (obj.event === 'detail') {
                newTab("${pageContext.request.contextPath}/activity/activityDetail?onlyContent=1&activityId=" + data.id, "活动详情");
            }
        });


    });
</script>
</body>
</html>