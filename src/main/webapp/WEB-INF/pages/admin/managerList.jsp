<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>社团管理员列表</title>
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
        <a><cite>社团管理员</cite></a>
        <a><cite>管理员列表</cite></a>
    </div>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">管理员列表</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>

                    <script type="text/html" id="test-table-toolbar-toolbarDemo">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-sm" lay-event="delSelected">删除所选</button>
                        </div>
                    </script>

                    <script type="text/html" id="test-table-toolbar-barDemo">
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
            , url: '${pageContext.request.contextPath}/manager/findAll'
            , toolbar: '#test-table-toolbar-toolbarDemo'
            , title: '社团管理员列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'mid', title: 'ID', width: 100, fixed: 'left', unresize: true, sort: true}
                , {field: 'mname', title: '用户名', width: 200}
                , {field: 'password', title: '密码', width: 200, edit: 'text'}
                , {field: 'realName', title: '姓名', width: 200, edit: 'text'}
                , {field: 'cname', title: '所属社团', width: 250, edit: 'text'}
                , {fixed: 'right', title: '操作', toolbar: '#test-table-toolbar-barDemo'}
            ]]
            , page: true
        });

        //头工具栏事件
        table.on('toolbar(test-table-toolbar)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'delSelected':
                    var data = checkStatus.data;
                    if (data.length === 0) {
                        layer.msg("请选择数据行", {
                            time: 1000
                        });
                        break;
                    }
                    layer.confirm('确定要删除所选行吗？', {icon: 3, title: '提示'}, function (index) {
                        for (var i = 0; i < data.length; i++) {
                            $.post("${pageContext.request.contextPath}/manager/delManagerById", {
                                mid: data[i]['mid']
                            });
                        }
                        layer.close(index);
                        layer.msg("操作成功!", {
                            time: 1000
                        });
                        tableIns.reload({
                            page: {
                                curr: 1 //重新从第 1 页开始
                            }
                        });
                    });
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test-table-toolbar)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('确定要删除吗？', function (index) {

                    layer.close(index);
                    $.post("${pageContext.request.contextPath}/manager/delManagerById", {
                        mid: data.mid
                    }, function (res) {
                        if (res.status === 0) {
                            obj.del();
                            layer.msg("删除成功!");
                        } else {
                            layer.msg("删除失败!");
                        }

                    });
                });
            }
        });

        //监听单元格编辑
        table.on('edit(test-table-toolbar)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            $.post("${pageContext.request.contextPath}/manager/updateFieldByMidAndValue", {
                "mid": data.mid,
                "field": field,
                "value": value
            }, function (res) {
                layer.msg(res.msg);
                if (res.status === -1) {
                    var json = {};
                    json[field] = res.data;
                    obj.update(json);
                }
            });

        });

    });
</script>
</body>
</html>