<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>设置我的资料</title>
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
        <div class="layui-card-header">设置我的资料</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item">
                    <label class="layui-form-label">我的角色</label>
                    <div class="layui-input-inline">
                        <select>
                            <option value="2" disabled>社团管理员</option>
                            <option value="1" disabled>超级管理员</option>
                            <option value="3" selected>赞助商</option>
                        </select>
                    </div>
                    <div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
                </div>

                <div class="layui-form-item layui-hide">
                    <label class="layui-form-label">赞助商ID</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sid" value="${user.sid}" readonly class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="sname" value="${user.sname}" readonly class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">不可修改。用于后台登入名</div>
                </div>

                <div class="layui-form-item layui-hide">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="password" value="${user.password}" readonly class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-inline">
                        <input type="text" name="realName" id="realName" value="${user.realName}" lay-verify="required"
                               autocomplete="off" placeholder="请输入真实姓名" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">所属公司</label>
                    <div class="layui-input-inline">
                        <input type="text" name="belong" lay-verify="required" placeholder="请输入所属公司"
                               value="${user.belong}"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">联系方式</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phone" lay-verify="required|number" placeholder="请输入联系方式"
                               value="${user.phone}"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">企业地址</label>
                    <div class="layui-input-inline">
                        <input type="text" name="address" lay-verify="required" placeholder="请输入企业地址"
                               value="${user.address}"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">官网链接</label>
                    <div class="layui-input-inline">
                        <input type="text" name="detail" lay-verify="required|url" placeholder="请输入官网地址"
                               value="${user.detail}"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
                        <button class="layui-btn layui-btn-primary" type="reset">重新填写
                        </button>
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
    }).use(['index', 'set'], function () {
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;

        form.on("submit(setmyinfo)", function (obj) {
            $.post("${pageContext.request.contextPath}/sponsor/updateSponsor", obj.field, function (res) {
                layer.msg(res.msg, {time: 1000, offset: '15px'});
            });
            return false;
        });
    });
</script>
</body>
</html>