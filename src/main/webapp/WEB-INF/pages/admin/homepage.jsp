<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>主页</title>
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
                <div class="layui-card-header">
                    最新活动
                    <a id="moreActivity" class="layui-a-tips">更多>></a>
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space10" id="newActivity">
                        <%--                        <div class="layui-col-xs12 layui-col-sm4">--%>
                        <%--                            <div class="layuiadmin-card-text">--%>
                        <%--                                <div class="layui-text-top">--%>
                        <%--                                    <i class="layui-icon layui-icon-form"></i>--%>
                        <%--                                    <a lay-href="https://www.layui.com/doc/modules/flow.html">flow</a>--%>
                        <%--                                </div>--%>
                        <%--                                <p class="layui-text-center">修复开启 isLazyimg:true 后, 图片懒加载但是图片不存在的报错问题</p>--%>
                        <%--                                <p class="layui-text-bottom">--%>
                        <%--                                    <a lay-href="https://www.layui.com/doc/modules/flow.html">流加载</a>--%>
                        <%--                                    <span>7 天前</span>--%>
                        <%--                                </p>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                    </div>
                </div>
            </div>
            <div class="layui-card">
                <div class="layui-card-header">最新公告
                    <a id="moreNotice" class="layui-a-tips">更多>></a>
                </div>
                <div class="layui-card-body">
                    <dl class="layuiadmin-card-status" id="newNotice">

                    </dl>
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
    }).use(['index', 'sample'], function () {
        var $ = layui.$;
        <%--   最新活动 --%>
        $.post("${pageContext.request.contextPath}/activity/findAll", {
            "currentPage": 1,
            "pageSize": 6
        }, function (pageInfo) {
            var str = "";
            for (var i = 0; i < pageInfo.list.length; i++) {
                str += '<div class="layui-col-xs12 layui-col-sm4">';
                str += '<div class="layuiadmin-card-text">';
                str += '<div class="layui-text-top">';
                str += '<i class="layui-icon layui-icon-form"></i>';
                str += '<a lay-href="${pageContext.request.contextPath}/activity/activityDetail?onlyContent=1&activityId=' + pageInfo.list[i].id + '">' + pageInfo.list[i].name + '</a>';
                str += '</div>';
                str += '<p class="layui-text-center">';
                str += pageInfo.list[i].simpleDetail;
                str += '</p>';
                str += '<p class="layui-text-bottom">';
                str += '<a>' + pageInfo.list[i].cname + '</a>';
                str += '<span>' + pageInfo.list[i].monthAndDay + '</span>';
                str += '</p></div></div>';
            }
            $("#newActivity").html(str);
        }, "json");

        //最新公告
        $.post("${pageContext.request.contextPath}/notice/findAll", {
            "currentPage": 1,
            "pageSize": 6
        }, function (pageInfo) {
            var str = "";
            for (var i = 0; i < pageInfo.list.length; i++) {
                str += '<dd>';
                str += '<div class="layui-status-img"><a href="javascript:;">';
                str += '<img src="${pageContext.request.contextPath}/layuiadmin/style/res/logo.png" style="margin-top: 6px"></a>';
                str += '</div><div>';
                str += '<p><a style="color: #0f0f0f" lay-href="${pageContext.request.contextPath}/notice/noticeDetail?onlyContent=1&noticeId=' + pageInfo.list[i].id + '">' + pageInfo.list[i].title + '</a></p>';
                str += '<span>' + pageInfo.list[i].formatDate + '</span>';
                str += '</div></dd>';
            }
            $("#newNotice").html(str);
        }, "json");

        $('#moreActivity').click(function () {
            window.open("${pageContext.request.contextPath}/allActivityList");
        });

        $('#moreNotice').click(function () {
            window.open("${pageContext.request.contextPath}/allNoticeList");
        });


    });

</script>
</body>
</html>