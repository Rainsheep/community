<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <title>修改活动</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/wangEditor/wangEditor-fullscreen-plugin.css">
        <style>
            .layui-upload-img {
                width: 92px;
                height: 92px;
                margin: 0 10px 10px 0;
            }
        </style>
    </head>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">修改活动</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" lay-filter="component-form-group">

                <div class="layui-form-item layui-hide">
                    <label class="layui-form-label">活动ID</label>
                    <div class="layui-input-block">
                        <input type="text" name="id" lay-verify="required" autocomplete="off" value="${activity.id}"
                               placeholder="请输入活动ID" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">活动名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" lay-verify="required" autocomplete="off" value="${activity.name}"
                               placeholder="请输入活动名称" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">活动时间</label>
                    <div class="layui-input-block">
                        <input type="text" class="layui-input" id="test-laydate-type-datetime"
                               name="dateTime" autocomplete="off" lay-verify="required" value="${activity.formatDate2}"
                               placeholder="yyyy-MM-dd HH:mm:ss">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">活动地点</label>
                    <div class="layui-input-block">
                        <input type="text" name="place" lay-verify="required" autocomplete="off"
                               value="${activity.place}"
                               placeholder="请输入活动地点" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item layui-hide">
                    <label class="layui-form-label">活动所属社团</label>
                    <div class="layui-input-block">
                        <input type="text" name="belong" class="layui-input" value="${user.belong}">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">参与人数</label>
                    <div class="layui-input-block">
                        <input type="text" name="amount" lay-verify="number" autocomplete="off"
                               value="${activity.amount}"
                               placeholder="请输入活动参与人数" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">所需额度</label>
                    <div class="layui-input-block">
                        <input type="text" name="sponsorMoney" lay-verify="required" autocomplete="off"
                               value="${activity.sponsorMoney}"
                               placeholder="请输入所需赞助金额" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">活动详情</label>
                    <div class="layui-input-block">
                        <div id="editor">${activity.detail}</div>
                    </div>
                </div>

                <div class="layui-form-item layui-hide">
                    <label class="layui-form-label">申请人ID</label>
                    <div class="layui-input-block">
                        <input type="text" name="mid" class="layui-input" value="${user.mid}">
                    </div>
                </div>

                <div class="layui-form-item layui-hide">
                    <label class="layui-form-label">标记未审核</label>
                    <div class="layui-input-block">
                        <input type="text" name="type" class="layui-input" value="2">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">活动图片</label>
                    <div class="layui-input-block">
                        <div class="layui-upload">
                            <button type="button" class="layui-btn" id="test-upload-more">多图片上传</button>
                            <button type="button" class="layui-btn layui-btn-danger" id="deleteAllImg">删除所有图片</button>
                            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                                预览图：
                                <div class="layui-upload-list" id="test-upload-more-list">
                                    <c:forEach items="${activity.images}" var="activityImg">
                                        <img src="${pageContext.request.contextPath}${activityImg.url}"
                                             class="layui-upload-img">
                                    </c:forEach>
                                </div>
                            </blockquote>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即修改</button>
                        <button type="reset" class="layui-btn layui-btn-primary" id="reset">重置</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/wangEditor/wangEditor.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/wangEditor/wangEditor-fullscreen-plugin.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    editor.customConfig.uploadImgServer = '../file/upload';
    editor.customConfig.uploadFileName = 'file';
    editor.customConfig.uploadImgHooks = {
        customInsert: function (insertImg, res, editor) {
            for (var key in res["data"]) {
                insertImg('${pageContext.request.contextPath}' + res["data"][key]);
            }
        }
    };
    editor.create();
    E.fullscreen.init('#editor');
</script>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'laydate', 'upload', 'form'], function () {
        var $ = layui.jquery,
            laydate = layui.laydate,
            layer = layui.layer,
            form = layui.form,
            upload = layui.upload;
        var map = new Map();

        //日期时间选择器
        laydate.render({
            elem: '#test-laydate-type-datetime'
            , type: 'datetime'
        });

        //多图片上传
        upload.render({
            elem: '#test-upload-more'
            , url: '${pageContext.request.contextPath}/file/upload'
            , multiple: true
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#test-upload-more-list').append('<img src="' + result + '" alt="' + file.name + '" class="layui-upload-img">')
                });
            }
            , done: function (res) {
                if (res.code === 0) {
                    for (var key in res["data"]) {
                        map.set(key, res["data"][key]);
                    }
                } else {
                    layer.msg(res.msg);
                }
            }
        });

        //重置
        $("#reset").click(function () {
            location.reload();
        });

        $("#deleteAllImg").click(function () {
            layer.confirm('确定要删除所有图片?', {icon: 3, title: '提示'}, function (index) {
                layer.close(index);
                $('#test-upload-more-list').empty();
                map.clear();
                $.post("${pageContext.request.contextPath}/activityImg/delActivityImgByActivityId", {
                    activityId:${activity.id}
                }, function () {
                    layer.msg("删除成功!");
                });

            });

        });


        /* 监听提交 */
        form.on('submit(component-form-demo1)', function (obj) {
            var field = obj.field;

            let obj2 = Object.create(null);
            for (let [k, v] of map) {
                obj2[k] = v;
            }

            $.post("${pageContext.request.contextPath}/activity/updateActivity", {
                id: field.id,
                name: field.name,
                formatDate: field.dateTime,
                place: field.place,
                belong: field.belong,
                amount: field.amount,
                detail: editor.txt.html(),
                sponsorMoney: field.sponsorMoney,
                mid: field.mid,
                type: field.type,
                imgs: obj2
            }, function (res) {
                layer.msg(res.msg);
            });
            return false;
        });
    });
</script>
</body>
</html>
