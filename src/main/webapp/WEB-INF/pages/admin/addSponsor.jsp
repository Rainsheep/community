<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加赞助商</title>
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
        <div class="layui-card-header">添加赞助商</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="sname" lay-verify="required|username" placeholder="请输入用户名"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" lay-verify="required|pass" placeholder="请输入密码"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="repassword" lay-verify="required|pass" placeholder="请输入确认密码"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="realName" lay-verify="required" placeholder="请输入真实姓名"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">所属公司</label>
                    <div class="layui-input-block">
                        <input type="text" name="belong" lay-verify="required" placeholder="请输入所属公司"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">联系方式</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" lay-verify="required|number" placeholder="请输入联系方式"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">企业地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" lay-verify="required" placeholder="请输入企业地址"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">官网链接</label>
                    <div class="layui-input-block">
                        <input type="text" name="detail" lay-verify="required|url" placeholder="请输入官网地址"
                               autocomplete="off"
                               class="layui-input">
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

        /* 自定义验证规则 */
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , username: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)) {
                    return '用户名不能有特殊字符';
                }
                if (/(^\_)|(\__)|(\_+$)/.test(value)) {
                    return '用户名首尾不能出现下划线\'_\'';
                }
                if (/^\d+\d+\d$/.test(value)) {
                    return '用户名不能全为数字';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        /* 监听提交 */
        form.on('submit(component-form-demo1)', function (data) {
            var field = data.field;

            if (field.password !== field.repassword) {
                layer.msg('两次密码输入不一致')
                return false;
            }

            $.post("${pageContext.request.contextPath}/sponsor/addSponsor", {
                sname: field.sname,
                password: field.password,
                realName: field.realName,
                belong: field.belong,
                phone: field.phone,
                address: field.address,
                detail: field.detail
            }, function (res) {
                layer.msg(res.msg);
            });
            return false;
        });
    });
</script>
</body>
</html>
