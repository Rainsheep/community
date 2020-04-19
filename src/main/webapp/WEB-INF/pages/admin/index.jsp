<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">

</head>

<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="${pageContext.request.contextPath}/index" target="_blank" title="前台">
                        <i class="layui-icon layui-icon-website"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
                <%--  选择主题  --%>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <%--  便签  --%>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <%--  全屏  --%>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <cite>${user.realName}</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="${pageContext.request.contextPath}/admin/userInfo">基本资料</a></dd>
                        <dd><a lay-href="${pageContext.request.contextPath}/admin/password">修改密码</a></dd>
                        <hr>
                        <dd style="text-align: center;"><a href="${pageContext.request.contextPath}/logout">退出</a></dd>
                    </dl>
                </li>
                <%-- 关于 --%>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="about"><i
                            class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="${pageContext.request.contextPath}/homepage">
                    <span>社团管理系统</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu"
                    lay-filter="layadmin-system-side-menu">
                    <li data-name="home" class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" lay-tips="主页" lay-direction="2">
                            <i class="layui-icon layui-icon-home"></i>
                            <cite>主页</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd data-name="console" class="layui-this">
                                <a lay-href="${pageContext.request.contextPath}/homepage">主页</a>
                            </dd>
                        </dl>
                    </li>

                    <li data-name="template" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="通知公告" lay-direction="2">
                            <i class="layui-icon layui-icon-template"></i>
                            <cite>通知公告</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a lay-href="${pageContext.request.contextPath}/allNoticeList?isAdmin=1">公告列表</a></dd>
                            <dd><a lay-href="${pageContext.request.contextPath}/addNotice">发布公告</a></dd>
                        </dl>
                    </li>

                    <li data-name="component" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="活动列表" lay-direction="2">
                            <i class="layui-icon layui-icon-component"></i>
                            <cite>社团活动</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="${pageContext.request.contextPath}/admin/activityList">活动列表</a>
                            </dd>
<%--                            <dd>--%>
<%--                                <a lay-href="component/button/inex.html">添加活动</a>--%>
<%--                            </dd>--%>
                            <dd>
                                <a lay-href="${pageContext.request.contextPath}/admin/aduitActivity">审核活动</a>
                            </dd>
                        </dl>
                    </li>

                    <li data-name="senior" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="学生社团" lay-direction="2">
                            <i class="layui-icon layui-icon-senior"></i>
                            <cite>学生社团</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="${pageContext.request.contextPath}/admin/communityList">社团列表</a>
                            </dd>
                            <dd>
                                <a lay-href="${pageContext.request.contextPath}/admin/addCommunity">添加社团</a>
                            </dd>
                        </dl>
                    </li>


                    <li data-name="user" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="社团管理员" lay-direction="2">
                            <i class="layui-icon layui-icon-user"></i>
                            <cite>社团管理员</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="${pageContext.request.contextPath}/admin/managerList">管理员列表</a>
                            </dd>
                            <dd>
                                <a lay-href="${pageContext.request.contextPath}/admin/addManager">添加管理员</a>
                            </dd>
                        </dl>
                    </li>

                    <li data-name="user" class="layui-nav-item">
                        <a href="javascript:;" lay-tips="赞助商" lay-direction="2">
                            <i class="layui-icon layui-icon-auz"></i>
                            <cite>赞助商</cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a lay-href="${pageContext.request.contextPath}/admin/sponsorList">赞助商列表</a>
                            </dd>
                            <dd>
                                <a lay-href="${pageContext.request.contextPath}/admin/addSponsor">添加赞助商</a>
                            </dd>
                        </dl>
                    </li>

                </ul>
            </div>
        </div>

        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="${pageContext.request.contextPath}/homepage"
                        lay-attr="${pageContext.request.contextPath}/homepage" class="layui-this"><i
                            class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="${pageContext.request.contextPath}/homepage" frameborder="0"
                        class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');
</script>

</body>

</html>