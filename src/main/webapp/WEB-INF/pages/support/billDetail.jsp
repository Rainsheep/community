<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>账单详情</title>
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
                <div class="layui-card-header">账单详情</div>
                <div class="layui-card-body">
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>账单详情</legend>
                        <div class="layui-field-box">
                            <table class="layui-table" lay-skin="nob" id="test-table-simple" style="width: 400px">
                                <tr>
                                    <td align="right">花销方式：</td>
                                    <td align="left">${billDTO3.way}</td>
                                </tr>
                                <tr>
                                    <td align="right">花销金额：</td>
                                    <td>${billDTO3.formatCost}</td>
                                </tr>
                                <tr>
                                    <td align="right">赞助所占金额：</td>
                                    <td>${billDTO3.formatMoney}</td>
                                </tr>
                                <tr>
                                    <td align="right">花销时间：</td>
                                    <td>${billDTO3.formatDatetime}</td>
                                </tr>
                                <tr>
                                    <td align="right">花销地点：</td>
                                    <td>${billDTO3.place}</td>
                                </tr>
                                <tr>
                                    <td align="right">上传人：</td>
                                    <td>${billDTO3.realName}</td>
                                </tr>
                                <tr>
                                    <td align="right">上传时间：</td>
                                    <td>${billDTO3.formatCurrentdate}</td>
                                </tr>
                                <tr>
                                    <td align="right">备注：</td>
                                    <td>${billDTO3.note}</td>
                                </tr>
                            </table>
                        </div>
                    </fieldset>

                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>相关附件</legend>
                        <div class="layui-field-box">
                            <table class="layui-hide" lay-skin="line" id="test-table-simple2"
                                   lay-filter="test-table-toolbar"></table>
                            <script type="text/html" id="test-table-toolbar-barDemo">
                                <a class="layui-btn layui-btn-xs" lay-event="detail">点击下载</a>
                            </script>
                        </div>
                    </fieldset>
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

        table.render({
            elem: '#test-table-simple2'
            , url: '${pageContext.request.contextPath}/support/getBillDetailFiles'
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'numbers', width: '20%', title: '序号'}
                , {field: 'filename', width: '40%', title: '文件名'}
                , {field: 'url', width: '20%', title: '文件地址', hide: true}
                , {width: '40%', title: '操作', toolbar: '#test-table-toolbar-barDemo', align: 'center'}
            ]]
        });

        table.on('tool(test-table-toolbar)', function (obj) {
            var field = obj.data;
            location = "${pageContext.request.contextPath}/file/download?filename=" + field.filename + "&url=" + field.url;
        });

    });
</script>
</body>
</html>