<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>社团信息</title>
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
        <div class="layui-card-header">社团信息</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">

                <div class="layui-form-item layui-hide">
                    <label class="layui-form-label">社团ID</label>
                    <div class="layui-input-block">
                        <input type="text" name="cid" lay-verify="" placeholder="" value="${community.cid}" readonly
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">社团名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="cname" value="${community.cname}" readonly
                               autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">仅超级管理员可修改</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">社团负责人</label>
                    <div class="layui-input-inline">
                        <input type="text" name="mname" value="${community.mname}" lay-verify="required"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">社团人数</label>
                    <div class="layui-input-inline">
                        <input type="text" name="amount" value="${community.amount}" lay-verify="required|number"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">社团活动数</label>
                    <div class="layui-input-inline">
                        <input type="text" name="activityNums" value="${community.activityNums}" readonly
                               autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">自动统计，不可修改</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">成立时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="holdTime" value="${community.formatDate}" readonly
                               autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">仅管理员可修改</div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">社团等级</label>
                    <div class="layui-input-inline">
                        <input type="text" name="level" value="${community.level}" readonly
                               autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">仅管理员可修改</div>
                </div>

                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即修改</button>
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
            var field = data.field;

            $.post("${pageContext.request.contextPath}/community/updateMnameAndAmount", {
                cid:field.cid,
                mname: field.mname,
                amount: field.amount,
            }, function (res) {
                layer.msg(res.msg);
            });
            return false;
        });
    });
</script>
</body>
</html>
