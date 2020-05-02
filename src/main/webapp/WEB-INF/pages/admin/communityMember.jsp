<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>社团成员列表</title>
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
                <div class="layui-card-header">社团成员</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>

                    <script type="text/html" id="test-table-toolbar-toolbarDemo">
                        <div class="layui-btn-container">
                        </div>
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
    }).use(['index', 'table', 'upload'], function () {
        var admin = layui.admin
            , table = layui.table
            , $ = layui.$
            , upload = layui.upload;

        var tableIns = table.render({
            elem: '#test-table-toolbar'
            , url: '${pageContext.request.contextPath}/communityMember/findCommunityMemberByBelong?belong=${memberBelong}'
            , toolbar: '#test-table-toolbar-toolbarDemo'
            , title: '社团成员列表'
            , cols: [[
                {field: 'id', title: 'ID', fixed: 'left', unresize: true, sort: true, hide: true}
                , {field: 'xuehao', title: '学号', sort: true}
                , {field: 'realName', title: '姓名'}
                , {field: 'position', title: '职务'}
            ]]
            , page: true
        });

    });
</script>
</body>
</html>