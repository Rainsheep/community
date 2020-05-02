<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加社团</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">添加社团</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item">
                    <label class="layui-form-label">社团名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="cname" lay-verify="required" placeholder="请输入社团名称" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">社团负责人</label>
                    <div class="layui-input-block">
                        <input type="text" name="mname" lay-verify="required" placeholder="请输入负责人姓名" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">社团人数</label>
                    <div class="layui-input-block">
                        <input type="text" name="amount" lay-verify="number|required" placeholder="请输入社团人数"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">成立日期</label>
                    <div class="layui-input-block">
                        <input type="text" name="holdTime" id="LAY-component-form-group-date" lay-verify="date|required"
                               placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">社团等级</label>
                    <div class="layui-input-block">
                        <select name="level" lay-filter="aihao" lay-verify="required">
                            <option value=""></option>
                            <option value="校级组织">校级组织</option>
                            <option value="院级组织">院级组织</option>
                            <option value="社团组织">社团组织</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'laydate'], function () {
        var $ = layui.$
            , admin = layui.admin
            , element = layui.element
            , layer = layui.layer
            , laydate = layui.laydate
            , form = layui.form;

        form.render(null, 'component-form-group');

        laydate.render({
            elem: '#LAY-component-form-group-date'
        });

        /* 监听提交 */
        form.on('submit(component-form-demo1)', function (data) {
            $.post("${pageContext.request.contextPath}/community/addCommunity", {
                cname:data.field.cname,
                mname:data.field.mname,
                amount:data.field.amount,
                formatDate:data.field.holdTime,
                level:data.field.level
            }, function (res) {
                layer.msg(res.msg);
            });
            return false;
        });
    });
</script>
</body>
</html>
