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
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">设置我的资料</div>
                <div class="layui-card-body" pad15>

                    <div class="layui-form" lay-filter="">
                        <div class="layui-form-item">
                            <label class="layui-form-label">我的角色</label>
                            <div class="layui-input-inline">
                                <select lay-verify="">
                                    <option value="2" disabled>社团管理员</option>
                                    <option value="1" selected>超级管理员</option>
                                    <option value="3" disabled>赞助商</option>
                                </select>
                            </div>
                            <div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="username" value="${user.mname}" readonly class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">不可修改。用于后台登入名</div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">真实姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="realName" id="realName" value="${user.realName}"
                                         autocomplete="off" placeholder="请输入真实姓名" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">所属社团</label>
                            <div class="layui-input-inline">
                                <input type="text" name="username" value="${user.cname}" readonly class="layui-input">
                            </div>
                            <div class="layui-form-mid layui-word-aux">仅超级管理员可修改</div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
                                <button class="layui-btn layui-btn-primary" id="reset">重新填写
                                </button>
                            </div>
                        </div>
                    </div>

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
    }).use(['index', 'set'],function () {
        var layer=layui.layer;
        var form=layui.form;
        var $ = layui.$;
        $("#reset").click(function () {
            $("#realName").val("");
        });
        form.on("submit(setmyinfo)", function (obj) {
            $.post("${pageContext.request.contextPath}/manager/updateRealName",obj.field,function (res) {
                layer.msg(res.msg,{time:1000,offset: '15px'});
            });
        });
    });
</script>
</body>
</html>